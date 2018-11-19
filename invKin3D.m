function theta=invKin3D(M,theta,pos)
    n = 10000;
    threshold = 0.0001;
    for i = 1:n
        [f,J] = evalRobot3D(M,theta);
        f = f - pos;
        s = -J\f;
        theta = theta + s;
        if s < threshold
            break
        end
    end
end