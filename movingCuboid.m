clear; 
close all; 
  
numRocks = 10; % Specify how many rocks you want 
  
cobs = rand(3, numRocks); % 3 x n [0, 1] random numbers 
% for c(entres) o(f) b(locks) 
dobs = rand(3, numRocks); % d(imensions) o(f) b(locks) 
vobs = rand(3, numRocks); % v(elocity) o(f) blocks 
aobs = rand(3, numRocks) * pi / 2; 
% 3 x n [0, pi/2] random numbers for a(ngular velocity) 
% o(f) b(locks) 
  
timesteps = 10; % Define the timesteps 
  
% "Standard" block 
C = [1 -1 -1 1 1 -1 -1 1; 
    -1 -1 1 1 -1 -1 1 1; 
    1 1 1 1 -1 -1 -1 -1; 
    1 1 1 1 1 1 1 1]; % Homogeneous dimension 
  
% Loop over the timesteps in jumps of 0.5, 
% start at 0 (no movement 
for t = 0:0.5:timesteps, 
    pause(0.5); % Wait for a bit, reduce 
    % this to speed up animation 
    % For all rocks 
    for r = 1:numRocks, 
        % Get the current centre 
        ct = cobs(:, r) + t * vobs(:, r); 
        % Get the current rotation 
        at = aobs(:, r) * t; 
        % Get the current transformation 
        T = calcTrans(ct, dobs(:, r)', at); 
         
        if t == 0, 
            % Draw the cuboid 
            g(r, :) = drawCuboid(T * C); 
        else 
            % Update the handle matrix 
            updateCuboid(g(r, :), T * C); 
        end; 
         
        Ts(r, 1:4, 1:4) = T; 
    end; 
     
    if t == 0, 
        % This is the range I chose 
        % to show, update as you like 
        axis([-1 5 -1 5 -1 5]) 
    end; 
             
end; 