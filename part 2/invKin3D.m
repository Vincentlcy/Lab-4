function theta=invKin3D(M,theta,pos)
    n = 10000;
    threshold = 0.0001;
    for i = 1:n
        [f,J] = evalRobot2D(l,theta0);
        f = f - pos;
        s = -J\f;
        theta0 = theta0 + s;
        if s < threshold
            break
        end
    end
end