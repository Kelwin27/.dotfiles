{ ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    environmentVariables = {
      OLLAMA_LLM_LIBRARY = "cuda";
      CUDA_VISIBLE_DEVICES = "0"; # Указываем GPU (0 для GTX 1650)
    };
  };
}
