function params = default_parameters()
%DEFAULT_PARAMETERS Define radar, beam-sweep, target, and search parameters.

params.c = 3e8;                      % Speed of light [m/s]
params.fc = 28e9;                    % Carrier frequency [Hz]
params.lambda = params.c/params.fc;  % Wavelength [m]

params.d = params.lambda/2;          % ULA element spacing [m]
params.M = 4;                        % Number of antenna elements

params.P = 64;                       % Pulses per beam
params.Tr = 1e-4;                    % Pulse repetition interval [s]
params.PRF = 1/params.Tr;             % Pulse repetition frequency [Hz]
params.SNR_dB = 20;                  % Average SNR [dB]
params.random_seed = 7;

params.beta_beam_deg = -60:15:60;    % Sequential receive beams [deg]
params.Q = numel(params.beta_beam_deg);
params.T_beam = params.P*params.Tr;
params.t_beam_start = (0:params.Q-1)*params.T_beam;

params.theta_true_deg = [-25, 1, 35];
params.fD_true_Hz = [-1400, 650, 1800];
params.alpha_true = [ ...
    1.00, ...
    0.75*exp(1j*pi/5), ...
    0.60*exp(-1j*pi/3)];
params.L = numel(params.theta_true_deg);
params.velocity_true_mps = params.lambda*params.fD_true_Hz/2;

params.Ndop = 256;
params.theta_scan_deg = -90:1:90;
params.fD_search_Hz = -params.PRF/2:20:params.PRF/2-20;
end
