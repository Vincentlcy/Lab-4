function [pos, J] = evalRobot3D(M,theta)
    
    pos = M{1}*Rz(theta(3))*Ry(theta(2))*Rx(theta(1))*M{2}*Rx(theta(4))*M{3}*[0;0;0;1];
    
    J(:,1) = M{1}*Rz(theta(3))*Ry(theta(2))*dRx(theta(1))*M{2}*Rx(theta(4))*M{3}*[0;0;0;1];
    J(:,2) = M{1}*Rz(theta(3))*dRy(theta(2))*Rx(theta(1))*M{2}*Rx(theta(4))*M{3}*[0;0;0;1];
    J(:,3) = M{1}*dRz(theta(3))*Ry(theta(2))*Rx(theta(1))*M{2}*Rx(theta(4))*M{3}*[0;0;0;1];
    J(:,4) = M{1}*Rz(theta(3))*Ry(theta(2))*Rx(theta(1))*M{2}*dRx(theta(4))*M{3}*[0;0;0;1];
end

function rx = Rx(theta) 
    rx=[1    0           0              0
        0 cos(theta) -sin(theta)  0
        0 sin(theta) cos(theta)   0
        0    0           0              1];
end

function ry = Ry(theta)
    ry = [cos(theta) 0 sin(theta) 0
          0 1 0 0
          -sin(theta) 0 cos(theta) 0
          0 0 0 1];
end

function rz = Rz(theta)
    rz = [cos(theta) -sin(theta) 0 0
          sin(theta) cos(theta) 0 0
          0 0 1 0
          0 0 0 1];
end

function rx = dRx(theta)
    rx = [0    0           0            0
           0 -sin(theta) -cos(theta) 0
           0 cos(theta) -sin(theta)  0
           0    0           0              0];
end

function ry = dRy(theta)
    ry = [-sin(theta) 0 cos(theta) 0
       0 0 0 0
      -cos(theta) 0 -sin(theta) 0
       0 0 0 0];
end

function rz = dRz(theta)
    rz = [-sin(theta) -cos(theta) 0 0
       cos(theta) -sin(theta) 0 0
       0 0 0 0
       0 0 0 0];
end