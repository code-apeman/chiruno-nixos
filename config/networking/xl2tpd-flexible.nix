# Thanks to @stephen@nerdout.club (s-n.me) for this module!
# Licensed under CC BY-SA-NC 4.0

{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    services.xl2tpd-flexible = {
      enable = mkEnableOption "xl2tpd, with more flexible configuration";

      xl2tpOptions = mkOption {
        type        = types.lines;
        description = "xl2tpd configuration file content";
        default     = "";
      };

      pppOptions = mkOption {
        type        = types.lines;
        description = "ppp options file content";
        default     = "";
      };

    };
  };

  config = mkIf config.services.xl2tpd-flexible.enable {
    systemd.services.xl2tpd-flexible = let
      cfg = config.services.xl2tpd-flexible;

      pppd-options = pkgs.writeText "ppp-options-xl2tpd.conf" cfg.pppOptions;

      xl2tpd-conf = pkgs.writeText "xl2tpd.conf" ''
        ${cfg.xl2tpOptions}
        pppoptfile = ${pppd-options}
      '';

      xl2tpd-ppp-wrapped = pkgs.stdenv.mkDerivation {
        name         = "xl2tpd-ppp-wrapped";
        phases       = [ "installPhase" ];
        nativeBuildInputs  = with pkgs; [ makeWrapper ];
        installPhase = ''
          mkdir -p $out/bin

          makeWrapper ${pkgs.ppp}/sbin/pppd $out/bin/pppd \
            --set LD_PRELOAD    "${pkgs.libredirect}/lib/libredirect.so" \
            --set NIX_REDIRECTS "/etc/ppp=/etc/xl2tpd/ppp"

          makeWrapper ${pkgs.xl2tpd}/bin/xl2tpd $out/bin/xl2tpd \
            --set LD_PRELOAD    "${pkgs.libredirect}/lib/libredirect.so" \
            --set NIX_REDIRECTS "${pkgs.ppp}/sbin/pppd=$out/bin/pppd"
        '';
      };
    in {
      description = "xl2tpd flexible server";

      requires = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      preStart = ''
        mkdir -p -m 700 /etc/xl2tpd/ppp
        mkdir -p -m 700 /run/xl2tpd
      '';

      serviceConfig = {
        ExecStart = "${xl2tpd-ppp-wrapped}/bin/xl2tpd -D -c ${xl2tpd-conf} -p /run/xl2tpd/pid -C /run/xl2tpd/control";
        KillMode  = "process";
        Restart   = "on-success";
        Type      = "simple";
        PIDFile   = "/run/xl2tpd/pid";
      };
    };
  };
}
