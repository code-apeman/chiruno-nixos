{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.config = {
    cudaSupport = true;
    cudaArchList = [ "6.1" ]; 
  };  
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };
}
