function Tr = calcTrans(centre, dimen, rotat)
% centre = [x, y, z] the centre of the block
% dimen = [w, d, h] the dimensions of the block
% rotat = [tx, ty, tz] the rotation around the x, y and z
% axes (in radians) respectively
% Some default inputs
if nargin < 1,
centre = [0 0 0];
end;
if nargin < 2,
dimen = [1 1 1];
end;
if nargin < 3,
rotat = [0 0 0];
end;
% Get the scaling matrix (remember the 1/2)
S = diag([1/2 * dimen, 1]);
% Get the translation matrix
T = eye(4);
T(1:3, 4) = centre';
% Get the rotation matrices
tx = rotat(1); ty = rotat(2); tz = rotat(3);
Rx = eye(4);
Rx([2 3], [2 3]) = [cos(tx), -sin(tx); sin(tx), cos(tx)];
Ry = eye(4);
Ry([3 1], [3 1]) = [cos(ty), -sin(ty); sin(ty), cos(ty)];
Rz = eye(4);
Rz([1 2], [1 2]) = [cos(tz), -sin(tz); sin(tz), cos(tz)];
% Get the transformation matrix, remember to do
% translation last
Tr = T * Rx * Ry * Rz * S;
return;