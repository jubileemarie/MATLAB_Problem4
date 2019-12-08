function ProblemNo4()
H = input('Enter the initial height of the projectile above the ground in meters: ');
Vm= input('Enter magnitude of the velocity in m/s: ');
Angle= input('Angle in degrees with respect to the +x-axis at which the projectile is fired: ');
Ax= input('x-component of the acceleration, considering the sign, in m/s^2: ');
Ay=input('y-component of the acceleration, considering the sign, in m/s^2: ');
if H<0
    error('Invalid! Initial height must be positive')
elseif Vm<=0 
    error('Invalid! Magnitude of Velocity cannot be equal to zero or have negative sign')
elseif (Angle<0)||(Angle>180)
    error('Invalid! Angle must be between 0 to 180 degrees')
elseif Ay == 0
    error('Invalid! Y-component of acceleration cannot be equal to zero')
end

%Velocity
Vx=(Vm.*cosd(Angle));
Vy=(Vm.*sind(Angle));

%ideal using Y=Vy -1/2gt^2 formula 
%Sincee ideal, Ay and Ax are constants
%Ay=-9.8
%Ax=0
g=9.8;
A=-(0.5)*g;
B= Vy;
C=H;
RootsTime=roots([A,B,C]);
PTime=max(RootsTime);
T1=0:0.0001:PTime;
xideal=Vx.*T1;
yideal=H+(Vy.*T1)-((0.5).*g.*(T1.^2));
plot(xideal,yideal,'--r')
hold on,

%non-ideal using Y=Vy -1/2gt^2 formula 
%sincec non ideal, Air resistance will be considered
if Ay>0
a=-0.5*Ay;
b=Vy;
c=H;
rootstime=roots([a,b,c]);
ptime=max(rootstime);
T2=0:0.0001:ptime;
xnonideal=(Vx.*T2)+((0.5).*Ax.*(T2.^2));
ynonideal=H+(Vy.*T2)-((0.5).*Ay.*(T2.^2));
plot(xnonideal,ynonideal,'--b')
xlabel('X-coordinate')
ylabel('Y-coordinate')
legend('Ideal Trajectory','Non Ideal Trajectory');
grid on
title('Projectile Motion')
elseif Ay<0
a=0.5*Ay;
b=Vy;
c=H;
rootstime=roots([a,b,c]);
ptime=max(rootstime);
T2=0:0.0001:ptime;
xnonideal=(Vx.*T2)+((0.5).*Ax.*(T2.^2));
ynonideal=H+(Vy.*T2)+((0.5).*Ay.*(T2.^2));
plot(xnonideal,ynonideal,'--b')
xlabel('X-coordinate')
ylabel('Y-coordinate')
legend('Ideal Trajectory','Non-Ideal Trajectory');
title('Projectile Motion')
grid on
end
end