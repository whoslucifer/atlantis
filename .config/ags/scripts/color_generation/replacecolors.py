#!/usr/bin/env python3
import os
import re
import sys
from pathlib import Path

# Get the user's home directory and username
home_dir = os.path.expanduser("~")
user_name = os.environ.get('USER', '')

# File paths
generated_colors_file = f'{home_dir}/.cache/ags/user/generated/material_colors.scss'
material_file = f"{home_dir}/.config/ags/scss/fallback/_material.scss"

def parse_colors(file_path):
    """Parse color definitions from a file."""
    colors = {}
    with open(file_path, 'r') as f:
        for line in f:
            match = re.match(r'^\$(\w+):\s*(#[0-9a-fA-F]+);', line)
            if match:
                colors[match.group(1)] = match.group(2)
    return colors

def update_material_file(material_path, new_colors):
    """Update the material file with new color values."""
    updated_lines = []
    with open(material_path, 'r') as f:
        for line in f:
            match = re.match(r'^(\$\w+):\s*(#[0-9a-fA-F]+);', line)
            if match:
                var_name = match.group(1)[1:]  # Remove leading '$'
                if var_name in new_colors:
                    # Replace with new color
                    updated_lines.append(f"${var_name}: {new_colors[var_name]};\n")
                    continue
            updated_lines.append(line)  # Keep the line unchanged if no match

    # Save the updated file
    with open(material_path, 'w') as f:
        f.writelines(updated_lines)

def main():
    # Parse colors from the generated colors file
    if not Path(generated_colors_file).exists():
        print(f"Error: Generated colors file '{generated_colors_file}' not found.")
        sys.exit(1)

    new_colors = parse_colors(generated_colors_file)

    # Update the material file
    if not Path(material_file).exists():
        print(f"Error: Material file '{material_file}' not found.")
        sys.exit(1)

    update_material_file(material_file, new_colors)
    print(f"Updated colors in '{material_file}' successfully.")

if __name__ == "__main__":
    main()

