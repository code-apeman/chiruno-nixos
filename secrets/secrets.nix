let
  root-pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0biVLLVlYo5rAYZCpUgxydTR4JJRPKalnvkmJC8NJR";
  system-pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOG27z2S/5+CgLvHhXDBG7eh98aXXfPv77LUtugE/jbE";
in {
  "l2tp-secrets.age".publicKeys = [ root-pubkey system-pubkey ];
  "vpn-password.age".publicKeys = [ root-pubkey system-pubkey ];
  "mailpassword.age".publicKeys = [ root-pubkey system-pubkey ];
  "gitlabmailpassword.age".publicKeys = [ root-pubkey system-pubkey ];
  "agnosprivkey.age".publicKeys = [ root-pubkey system-pubkey ];
}

