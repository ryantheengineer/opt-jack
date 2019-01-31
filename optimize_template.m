function [xopt, fopt, exitflag, output] = optimize_template()

    % ------------Starting point and bounds------------
    % Design variables
    %     LH   LP   LS   cl   dp1   dp4
    x0 = [42   1.5  7.3  4.6  0.6   0.5];
    ub = [];
    lb = [];

    % ------------Linear constraints------------
    A = [];
    b = [];
    Aeq = [];
    beq = [];

    % ------------Objective and Non-linear Constraints------------
    function [f, c, ceq] = objcon(x)
        
        % Design variables
        LH = x(1);
        LP = x(2);
        LS = x(3);
        cl = x(4);
        dp1 = x(5);
        dp4 = x(6);
        
        % other analysis variables
        cph = 0.3;
        cpw = 1.6;
        cbh = 2.5;
        cbw = 0.4;
        W = 2000;       % loading capacity
        t = 0.4;
        LT = 0.25;
        TH = 0.1;
        leha = 0.9;     % length to end of handle attachment
        sla = 1.3;      % side length of arm
        taw = 0.125;    % thickness of arm wall
        
        
        % Analysis functions
        
        
        
        % Objective function
        f = w;  % Minimize total weight of the jack
        
        % Inequality constraints
        c = zeros(5,1);
        c(1) = LF - 85;     % LF <= 85 lbs (lifting force)
        c(2) = 0 - LF;      % 0 lbs <= LF 
        

    end

    % ------------Call fmincon------------
    options = optimoptions(@fmincon, 'display', 'iter-detailed');
    [xopt, fopt, exitflag, output] = fmincon(@obj, x0, A, b, Aeq, beq, lb, ub, @con, options);
    
    
    % ------------Separate obj/con (do not change)------------
    function [f] = obj(x)
            [f, ~, ~] = objcon(x);
    end
    function [c, ceq] = con(x)
            [~, c, ceq] = objcon(x);
    end
end