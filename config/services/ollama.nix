{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      ollama = prev.ollama.override {
        cudaArches = [ "61" ]; # 6.1 - NVIDIA Compute Capability for consumer Pascal GPUs, GTX 1070 being one of them
      };
    })
  ];
  
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };
}
