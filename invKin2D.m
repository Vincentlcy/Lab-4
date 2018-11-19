function theta = invKin2D(l,theta0,pos,n,mode)
    threshold = 0.0001;
    if mode == 0
        for i = 1:n
            [f,J] = evalRobot2D(l,theta0);
            f = f - pos;
            s = -J\f;
            theta0 = theta0 + s;
            if s < threshold
                break
            end
        end
    elseif mode == 1
        [~,B] = evalRobot2D(l,theta0);
        for i = 1:n
            f = evalRobot2D(l,theta0) - pos;
            s = -B\f;
            thetaNext = theta0 + s;
            fy = evalRobot2D(l,thetaNext) - evalRobot2D(l,theta0);
            B = B + ((fy - B*s)*s')/(s'*s);
            theta0 = thetaNext;
            if s < threshold
                break
            end
        end
    end
    theta = theta0;
end