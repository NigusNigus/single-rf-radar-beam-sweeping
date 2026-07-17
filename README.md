# Single-RF-Chain Beam-Sweeping Angle-Doppler Demo

This MATLAB project simulates sequential analog receive-beam sweeping and performs a full joint angle-Doppler matched-filter search using the complete `Q x P` measurement matrix.

## Run

Open MATLAB in this folder and execute:

```matlab
run_beamsweep_demo
```

## Files

- `run_beamsweep_demo.m` — main driver.
- `default_parameters.m` — radar, target, beam, and search settings.
- `ula_beam_response.m` — normalized ULA beam response.
- `simulate_beam_sweep.m` — measurement and noise generation.
- `compute_doppler_fft.m` — coarse Doppler FFT for visualization.
- `joint_angle_doppler_match.m` — full 2-D matched-filter estimator.
- `plot_measured_beam_doppler.m` — measured beam-Doppler plot.
- `plot_joint_maps.m` — angle-Doppler, angle-velocity, and 3-D plots.
- `plot_beam_responses.m` — theoretical beam responses.
- `display_parameters.m` — command-window summary.

## MATLAB compatibility

The code uses implicit array expansion and is intended for MATLAB R2016b or newer. It also uses `hann`, which is available with Signal Processing Toolbox in many MATLAB releases. If unavailable, replace it with `hanning` or a manually defined Hann window.
