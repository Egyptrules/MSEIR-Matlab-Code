%{
function f3 = FINALFORSURE(R,I,gamma,mu)
-diff(R)+gamma.*I-mu.*R;
end;
%}
%domain 0-200
%use 

a = chebfun('x',[0,200])
S = a.^3;
DS = diff(S);

I = exp(a);
DI = diff(I);

R = 6.*a.^2;
DR = diff(R);

gamma = 0.003;
mu = 9*a;
b = 2*a;
%Aye = chebfun2(@(x,t)6.*x);  %-- this is for later
Aye = 2.*a.*3; %t=3 in -> chebfun2(@(x,t)2*x.*t)

%sum2(Aye);

Zain = I.*b; % inside integral
Eric = sum(Zain); %integral  --> need to do definite integral between 0 and inf
lambda = gamma*Eric %lambda 

f1 = -DS -S.*lambda.*b-S.*mu
f2 = -DI +lambda.*b.*S-(gamma+mu).*I
f3 = -DR+gamma.*I-mu.*R

f1op=@(S,I,R) -diff(S)-gamma*S.*sum(I.*b).*b-S.*mu
f2op=@(S,I,R) -diff(I)+gamma*sum(I.*b).*b.*S-(gamma+mu).*I
f3op=@(S,I,R) -diff(R)+gamma*I-mu.*R

figure
plot(f1)
figure
plot(f2)
figure
plot(f3)

f1(1)
f2(1)
f3(1)