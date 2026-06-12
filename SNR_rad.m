%==========================================================================
% Counting Signal to Noise Ratio of Radial CHG
%==========================================================================
% By: Muhammad Zuhdi, Wiwit Suryanto, Sudarmaji
% Corresponding author: Wiwit Suryanto 
% e-mail: ws@ugm.ac.id
% Doctoral Program, Ptysics Department
% Faculty of Mathematic and Natural Sciences
% Gadjah Mada University
%==========================================================================
%% ==========================================================
% LOAD DATA
% ===========================================================
 
%%%%%load('CHG_rad_data.mat');
% variable name must be:
% CHG_rad
[n,m]=size(g);
 
% Centre of Derivative
%Samalas
xo=xc;
yo=yc;
%xo=round(m/2);   
%yo=round(n/2);
 
 
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
 
 
A=CHG_rad;
% remove NaN
A=A(~isnan(A));
 
%% ==========================================================
% GLOBAL STATISTICS
% ===========================================================
 
mu=mean(A);
sigma=std(A);
 
%% ==========================================================
% DEFINE SIGNAL & NOISE
% ===========================================================
 
k=2;
 
signal_mask=abs(A - mu) > k*sigma;
noise_mask =abs(A - mu) <= k*sigma;
 
signal=A(signal_mask);
noise =A(noise_mask);
 
%% ==========================================================
% COMPUTE RMS SIGNAL
% ===========================================================
 
RMS_signal=sqrt(mean(signal.^2));
 
%% ==========================================================
% COMPUTE NOISE STD
% ===========================================================
 
STD_noise=std(noise);
 
%% ==========================================================
% COMPUTE SNR
% ===========================================================
 
SNR=RMS_signal / STD_noise;
 
SNR_dB=20 * log10(SNR);
 
%% ==========================================================
% DISPLAY
% ===========================================================
 
fprintf('\n');
fprintf('===================================\n');
fprintf('SNR FOR CHG_rad\n');
fprintf('===================================\n');
 
fprintf('\n');
 
fprintf('Mean            =%.6e\n',mu);
fprintf('Std             =%.6e\n',sigma);
 
fprintf('\n');
 
fprintf('Signal samples  =%d\n',length(signal));
fprintf('Noise samples   =%d\n',length(noise));
 
fprintf('\n');
 
fprintf('RMS signal      =%.6e\n',RMS_signal);
fprintf('STD noise       =%.6e\n',STD_noise);
 
fprintf('\n');
 
fprintf('SNR             =%.6f\n',SNR);
fprintf('SNR (dB)        =%.3f dB\n',SNR_dB);
 
fprintf('\n');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
