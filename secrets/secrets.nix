let
  virajs-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWHDW+JNMHUPMKDnXDuTiSuX1jKi35zuILluPUIuiDB";
in
{
  "secret1.age".publicKeys = [virajs-server];
}
