let
  virajs-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWHDW+JNMHUPMKDnXDuTiSuX1jKi35zuILluPUIuiDB";
in {
  "n8n.age".publicKeys = [ virajs-server ];
}