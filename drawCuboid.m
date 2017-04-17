function h = drawCuboid(C)

% Assuming coodinates are labelled as 1, 2, 3, 4 clockwise on top
% and 5 6 7 8 clockwise on bottom

P = [1 2 3 4;
    5 6 7 8;
    1 2 6 5;
    4 3 7 8;
    1 4 8 5;
    2 3 7 6];

h = zeros(1, 6);
for j = 1:size(P, 1),
    ps = C(:, P(j, :));
    %        plot3(ps(1, :), ps(2, :), ps(3, :))
    h(j) = patch(ps(1, :), ps(2, :), ps(3, :), 'k');
    set(h(j), 'FaceAlpha', 0.25);
end;

view(45, 45)
axis equal

return;
