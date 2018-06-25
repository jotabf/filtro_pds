function y = OverlapSave(x,h,N0)
    y = [];
    n = size(x,2);
    if(rem(n,N0) ~= 0) 
        x = [x zeros(1,N0-rem(n,N0))];
    end
    
    n = size(x,2);
    m = size(h,2);
    h = [h zeros(1, N0-1)];
    size(h,2);
    
    xl = zeros(1, N0+m-1);
    for i = 1:N0:n
        xl = [xl(end-m+2:end) x(i:i+N0-1)];

        y_ = convjb(xl,h);
        
        y = [y y_(m:end)];
    end
end