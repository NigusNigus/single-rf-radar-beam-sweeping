function joint = joint_angle_doppler_match(Y, params)
%JOINT_ANGLE_DOPPLER_MATCH Search angle and Doppler using the full Q-by-P data.
%
% For each hypothesis, the matched-filter atom is
%   S(i,p) = f(beta_i,theta)*exp(j*2*pi*fD*(t_i+p*Tr)).

Ntheta = numel(params.theta_scan_deg);
NfD = numel(params.fD_search_Hz);
joint.power = zeros(Ntheta, NfD);

pulse_index = 0:params.P-1;
T_sample = params.t_beam_start(:) + pulse_index*params.Tr;

for q = 1:Ntheta
    h_theta = zeros(params.Q,1);

    for i = 1:params.Q
        h_theta(i) = ula_beamsteering_response( ...
            params.beta_beam_deg(i), ...
            params.theta_scan_deg(q), ...
            params.M, params.d, params.lambda);
    end

    for k = 1:NfD
        S_candidate = h_theta .* exp( ...
            1j*2*pi*params.fD_search_Hz(k)*T_sample);

        atom_energy = sum(abs(S_candidate(:)).^2);
        correlation = sum(conj(S_candidate(:)).*Y(:));

        joint.power(q,k) = ...
            abs(correlation)^2/(atom_energy + eps);
    end
end

joint.power_dB = 10*log10( ...
    joint.power/max(joint.power(:)) + eps);
joint.theta_axis_deg = params.theta_scan_deg;
joint.fD_axis_Hz = params.fD_search_Hz;
joint.velocity_axis_mps = params.lambda*params.fD_search_Hz/2;
end
