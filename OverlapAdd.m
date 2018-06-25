function y = OverlapAdd(x,h,N0)
    y = [];
    n = size(x,2);
    m = size(h,2);
    
    x = [x zeros(1,N0-rem(n,N0))];    
    n = size(x,2);
            
    h = [h zeros(1,N0-1)];    
    
    for i = 1 : N0 : n
        xl = [x(i:i+N0-1) zeros(1,m-1)];
        
        if(size(y,2) == 0)
            y = convjb(xl,h);
        else 
            y_1 = convjb(xl,h);
            l = size(y,2);
            for j = m-2:-1:0
                y(l-j) = y(l-j) + y_1(1);
                y_1(1) = [];
            end
            y = [y y_1];        
        end
    end
end    