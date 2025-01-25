const entry = `${App.configDir}/widgets/main.ts`;
const outdir = "/tmp/ags/main.js";
const scss = `${App.configDir}/style/style.scss`;
const css = "/tmp/ags/style.css";

Utils.ensureDirectory("/tmp/ags");

function reloadCss() {
  App.resetCss();
  Utils.exec(`sassc ${scss} ${css}`);
  App.applyCss(css);
}

// Initially apples css
reloadCss();

// Monitor scss changes and reapply css
Utils.monitorFile(`${App.configDir}/style`, () => {
  reloadCss();
});

try {
  await Utils.execAsync([
    "bun",
    "build",
    entry,
    "--outfile",
    outdir,
    "--external",
    "resource://",
    "--external",
    "gi://*",
    "--external",
    "file://*",
  ]);
} catch (error) {
  console.error(error);
}

const main = await import(`file://${outdir}`);

export default main.default;
