% The background knowledge
background([
[wipers, not(dead_battery)],
[radio, not(dead_battery), not(broken_speaker)],
[ignition, key_turned, not(dead_battery)],
[car_starts, not(out_of_gas), ignition],
[gauge_shows_gas, not(out_of_gas), not(dead_battery)],
[key_turned]]).
% Things that can go wrong
assumable(dead_battery).
assumable(out_of_gas).
assumable(broken_speaker).
