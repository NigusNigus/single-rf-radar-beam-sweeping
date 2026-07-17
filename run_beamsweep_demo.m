%% RUN_BEAMSWEEP_DEMO
% Main driver for the single-RF-chain beam-sweeping radar simulation.

clear;
clc;
close all;



params = default_parameters();

[Y, Y_clean, beam_gain_true] = simulate_beam_sweep(params);

joint = joint_angle_doppler_match(Y, params);

plot_joint_maps(joint, params);


display_parameters(params);