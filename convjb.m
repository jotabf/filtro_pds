function y = convjb(x,h)
     n = size(x,2);
     m = size(h,2);
     
     if(rem(n,2) ~= 0)
         l = ceil(log2(n));
         x = [x zeros(1,(2^l)-n)];
         h = [h zeros(1,(2^l)-n)];
     end
     
     X = fftjb(x);
     H = fftjb(h);
     Y = H .* X;    
     y_ = abs(ifft(Y));    
     y = y_(1:n);        
end
