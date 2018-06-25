function X = fftjb(x)
    n = size(x,2);
    
    if n > 1
    
        q = x(1:2:n);
        p = x(2:2:n);
        
        Q = fftjb(q);
        P = fftjb(p);
        
        k = 0:((n/2)-1);
        W = exp(-2*pi*i/n) .^ k;
        
        Wp = (W.*P);
        X_1 = Q + Wp; 
        X_2 = Q - Wp;
                               
        X = [X_1 X_2];
    else 
        X = x;
    end        
end
