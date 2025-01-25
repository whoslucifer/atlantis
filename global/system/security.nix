{pkgs, ...}: {
  security = {
    # required by wireshark capture packets
    wrappers.dumpcap = {
      source = "${pkgs.wireshark}/bin/dumpcap";
      capabilities = "cap_net_raw,cap_net_admin+ep";
      owner = "root";
      group = "wireshark";
    };
  };
}
