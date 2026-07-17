function response = ula_beamsteering_response(beta_deg, theta_deg, M, d, lambda)
%ULA_BEAM_RESPONSE Normalized ULA response for beam direction beta and angle theta.
%
% beta_deg and theta_deg are scalar angles in degrees.

m0 = (0:M-1).';
beta = deg2rad(beta_deg);
theta = deg2rad(theta_deg);

phase_difference = 2*pi*(d/lambda)*m0 .* ...
    (sin(theta) - sin(beta));

response = sum(exp(1j*phase_difference))/M;
end
