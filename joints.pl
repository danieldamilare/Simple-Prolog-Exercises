% What is known about sore joints
background([ [sore_elbow(X), tennis_elbow(X)],
[sore_elbow(X), sore_joints(X)],
[sore_joints(X), arthritis(X)],
[sore_hips(X), sore_joints(X)],
[sore_hips(X), hip_fracture(X)],
[tennis_player(X), tennis_elbow(X)] ]).
% The possible explanations to consider
assumable(tennis_elbow(_)).
assumable(arthritis(_)).