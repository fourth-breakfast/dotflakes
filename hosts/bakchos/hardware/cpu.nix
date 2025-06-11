{ ... }:
{
  hardware.cpu.amd.updateMicrocode = true;

  boot = {
    kernelParams = [
      "initcall_blacklist=amd_pstate_init"
      "amd_pstate.enable=0"
    ];
  };
}
