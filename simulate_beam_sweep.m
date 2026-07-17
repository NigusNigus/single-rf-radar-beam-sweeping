function [Y, Y_clean, beam_gain_true] = simulate_beam_sweep(params)
%SIMULATE_BEAM_SWEEP Generate the Q-by-P single-RF-chain measurement matrix.
%
% The inter-beam start time is included in every target's Doppler phase.

rng(params.random_seed);

Y_clean = zeros(params.Q, params.P);
beam_gain_true = zeros(params.Q, params.L);
pulse_index = 0:params.P-1;

for i = 1:params.Q
    for target = 1:params.L
        beam_gain = ula_beamsteering_response( ...
            params.beta_beam_deg(i), ...
            params.theta_true_deg(target), ...
            params.M, params.d, params.lambda);

        beam_gain_true(i,target) = beam_gain;

        slow_time = params.t_beam_start(i) + pulse_index*params.Tr;
        doppler_phase = exp( ...
            1j*2*pi*params.fD_true_Hz(target)*slow_time);

        Y_clean(i,:) = Y_clean(i,:) + ...
            params.alpha_true(target)*beam_gain*doppler_phase;
    end
end

signal_power = mean(abs(Y_clean(:)).^2);
noise_power = signal_power/(10^(params.SNR_dB/10));
noise = sqrt(noise_power/2) .* ...
    (randn(params.Q,params.P) + 1j*randn(params.Q,params.P));

Y = Y_clean + noise;
end
