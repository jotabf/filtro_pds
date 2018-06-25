N0 = 512;

x = [zeros(1,1000) rectwin(1000).' zeros(1,1000)];
h = [zeros(1,55) rectwin(110).' zeros(1,55)];

% [x,Fs] = audioread('Audio/audio.wav');
% [r,Fr] = audioread('Audio/2kHz Tone.wav');
% 
% for n = 1 : size(x,1)
%    x(n) = x(n) + r(n+200);
% end
% x = x.';
% for n = 0 : 124;
%     h(n+1) = (sin(.325*pi*(n-62))/(pi*(n-62)))*(0.5-0.5*cos((2*pi*n)/124));
%     if(n == 62)
%        l = 0.0001; 
%        h(n+1) = (sin(.325*pi*(n+l-62))/(pi*(n+l-62)))*(0.5-0.5*cos((2*pi*n+l)/124));
%     end
% end

y1 = OverlapAdd(x,h,N0);
y2 = OverlapSave(x,h,N0);

figure 
plot(y1,'g');
ylabel('y[n]');
xlabel('n');
xlim([0 size(y1,2)]);

figure 
plot(y2,'r');
ylabel('y[n]');
xlabel('n');
xlim([0 size(y2,2)]);
