function collide = checkCollision(Mat1, Mat2, C)
% Mat1.T, Mat1.L, Mat1.U, Mat1.P = transformation
% matrix and corresponding LU factorisation for cuboid 1
% Mat2.T, Mat2.L, Mat2.U, Mat2.P = transformation
% matrix and corresponding LU factorisation for cuboid 2
% C = the "standard" cuboid
% Editor: En-Yu (Mike) Lee, 17/3/2016.
collide = 0;
T1 = Mat1.T;
L1 = Mat1.L;
U1 = Mat1.U;
P1 = Mat1.P;
T2 = Mat2.T;
L2 = Mat2.L;
U2 = Mat2.U;
P2 = Mat2.P;
% Produce new cuboids: C1 and C2.
C1 = T1*C;
C2 = T2*C;
% Find the x2 array, the corner points array of C2.
x2 = U1\(L1\(P1*C2));
% Find the x1 array, the corner points array of C1.
x1 = U2\(L2\(P2*C1));
% x range, y range, z range for standard C: -1~1. 
% find if any C2 corner points is inside standard C.
for i = 1: 8
    if abs(x2(1, i)) <= 1
        if abs(x2(2, i)) <= 1
            if abs(x2(3, i)) <= 1
                collide = 1;
                return;
            end
        end
    end
end
% find if any C1 corner points is inside standard C.
for j = 1: 8
    if abs(x1(1, j)) <= 1
        if abs(x1(2, j)) <= 1
            if abs(x1(3, j)) <= 1
                collide = 1;
                return;
            end
        end
    end
end

return;

