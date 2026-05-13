{ config, lib, pkgs, inputs, ... }: {
  fonts.packages = with pkgs; [
    maple-mono.NF-CN		# Give me that Chinese/Japanese support (i hope it DOES have Kana and not just Kanji)
    terminus_font
  ];
}
