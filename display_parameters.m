function display_parameters(params)
%DISPLAY_PARAMETERS Print the simulation setup and true target parameters.

fprintf('\n');
fprintf('============================================================\n');
fprintf('SINGLE-RF-CHAIN BEAM-SWEEPING RADAR\n');
fprintf('TRUE JOINT ANGLE-DOPPLER MATCHING INCLUDED\n');
fprintf('============================================================\n');
fprintf('Physical antenna elements : %d\n',params.M);
fprintf('Swept receive beams       : %d\n',params.Q);
fprintf('Pulses per beam           : %d\n',params.P);
fprintf('Measurement matrix size   : %d beams x %d pulses\n', ...
    params.Q,params.P);
fprintf('Beam dwell time           : %.6e s\n',params.T_beam);
fprintf('Last beam start time      : %.6e s\n',params.t_beam_start(end));
fprintf('\nTRUE TARGET PARAMETERS\n');

for target = 1:params.L
    fprintf(['Target %d: theta_l = %7.2f deg, ' ...
             'fD_l = %8.2f Hz, velocity = %7.3f m/s\n'], ...
        target, ...
        params.theta_true_deg(target), ...
        params.fD_true_Hz(target), ...
        params.velocity_true_mps(target));
end

fprintf('============================================================\n');
end
