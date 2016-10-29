
function f = lagrange(r,n,a,subX)
    % I quite honestly have no idea what this does 
    syms x;
    
    % Completely unnecessary but whatevs
    n = n+1;
    
    % Finds the negative of lagrange formula(optimization function only
    % finds minimums so it needs to be flipped
    init = -((diff(r,x,n))*subs((x-a)^(n),x,subX))/factorial(n)
    
    % Somethingsomething data types matlab sure is confusing
    g = matlabFunction(init);
    
    % Finds x value "subX" and "a" uninclusive such that g is at its
    % minimum (I have no idea how to make fminbind search inclusive so
    % whatever)
    if a < subX
        lower = a;
        upper = subX;
    else
        lower = subX;
        upper = a;
    end
    
    minimumX = fminbnd(g,lower,upper);
    
    % Inverts initial calculation for final solution
    init = -init;
    
    % ghetto solution to make it inclusive
    test1 = subs(init, x, minimumX);
    test2 = subs(init, x, subX);
    test3 = subs(init, x, a);
    
    if test1 < test2
        output = test2;
    elseif test1 < test3
        output = test3;
    else
        output = test1;
    end
    
    f=output
end
