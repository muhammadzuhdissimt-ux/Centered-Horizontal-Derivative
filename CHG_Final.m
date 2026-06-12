%==============================================================
% Centered Horizontal Gradient
%==========================================================================
% By: Muhammad Zuhdi, Wiwit Suryanto, Sudarmaji
% Corresponding author: Wiwit Suryanto 
% e-mail: ws@ugm.ac.id
% Doctoral Program, Ptysics Department
% Faculty of Mathematic and Natural Sciences
% Gadjah Mada University
%==========================================================================% By: Muhammad Zuhdi
%clear;
%clc;
%load(g)
 
[n,m] =size(g);
 
% Centre of Derivative
%Tambora
%xo=1104;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%yo=870;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%Samalas
%xo=570;
%yo=620;
%xo=round(m/2);   
%yo=round(n/2);
xo=xc;
yo=yc;

 
[x,y]=meshgrid(1:m,1:n);
 
% Position from the center
Xp=x-xo;
Yp=y-yo;
 
R=sqrt(Xp.^2+Yp.^2);
R(R==0)=eps;   
 
% Radial direction
cosT=Xp./R;
sinT=Yp./R;
 
% The differential
dX=zeros(n,m);
dY=zeros(n,m);
 
% interior
for yy=2:n-1;
    for xx=2:m-1;
        dX(yy,xx)=(g(yy,xx+1)-g(yy,xx-1))/2;
        dY(yy,xx)=(g(yy+1,xx)-g(yy-1,xx))/2;
    end
end
 
% edges 
dX(:,1)=g(:,2)-g(:,1);
dX(:,m)=g(:,m)-g(:,m-1);
dY(1,:)=g(2,:)-g(1,:);
dY(n,:)=g(n,:)-g(n-1,:);
 
THG=sqrt(dX.^2+dY.^2);
%THG=dX+dY;
 
%CHG radial direction
 
CHG_rad=dX.*cosT+dY.*sinT;
 
 
% CHG tangensial direction
 
CHG_tan=-dX.*sinT+dY.*cosT;
 
 
% Normalizing by cutting high peaks
lowR=prctile(CHG_rad(:),5);
highR=prctile(CHG_rad(:),95);
 
THG_n=THG;
THG_n(THG>highR)=highR;
THG_n(THG<lowR)=lowR;
 
lowR=prctile(CHG_rad(:),5);
highR=prctile(CHG_rad(:),95);
 
CHG_rad_n=CHG_rad;
CHG_rad_n(CHG_rad>highR)=highR;
CHG_rad_n(CHG_rad<lowR)=lowR;
 
lowT=prctile(CHG_tan(:),5);
highT=prctile(CHG_tan(:),95);
 
CHG_tan_n=CHG_tan;
CHG_tan_n(CHG_tan>highT)=highT;
CHG_tan_n(CHG_tan<lowT)=lowT;
 
 
%% VISUALIZING
 
 figure
 
subplot(2,2,1)
mesh(xgrid,ygrid,g); view(2);
axis image
colorbar
title('gravity g')
 
subplot(2,2,2)
mesh(xgrid,ygrid,THG); view(2);
axis image
colorbar
title('THG')
 
subplot(2,2,3)
mesh(xgrid,ygrid,CHG_rad_n); view(2);
axis image
colorbar
title('CHG rad')
 
subplot(2,2,4)
mesh(xgrid,ygrid,CHG_tan_n); view(2);
 
axis image
colorbar
title('CHG tan')
 
%colormap gray;
colormap jet;
 
sgtitle('THG and CHG')
 
%{
subplot(1,3,1)
imagesc(THG)
axis image
colorbar
title('THG')
 
subplot(1,3,2)
imagesc(CHG_rad_n)
axis image
colorbar
title('CHG rad')
 
subplot(1,3,3)
imagesc(CHG_tan_n)
axis image
colorbar
title('CHG tan')
colormap gray;
%}
