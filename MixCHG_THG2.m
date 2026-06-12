%==========================================================================
% Mixing THG and CHG
%==========================================================================
% By: Muhammad Zuhdi, Wiwit Suryanto, Sudarmaji
% Corresponding author: Wiwit Suryanto 
% e-mail: ws@ugm.ac.id
% Doctoral Program, Ptysics Department
% Faculty of Mathematic and Natural Sciences
% Gadjah Mada University
%==========================================================================%==========================================================================
% PARAMETER ALPHA
%==========================================================================
 
a1=0.2;
a2=0.4;
a3=0.6;
a4=0.8;
 
%==========================================================================
% ANTI NaN
%==========================================================================
 
max_rad=max(abs(CHG_rad_n(:)));
max_tan=max(abs(CHG_tan_n(:)));
max_thg=max(abs(THG_n(:)));
 
% Avoid deviding by zero
if max_rad == 0
    max_rad=0.1;
end
 
if max_tan == 0
    max_tan=0.1;
end
 
if max_thg == 0
    max_thg=0.1;
end
 
% Normalization
CHG_rad_norm=CHG_rad_n ./ max_rad;
CHG_tan_norm=CHG_tan_n ./ max_tan;
THG_norm    =THG_n     ./ max_thg;
 
%==========================================================================
% Avoid NaN
%==========================================================================
 
CHG_rad_norm(~isfinite(CHG_rad_norm))=0;
CHG_tan_norm(~isfinite(CHG_tan_norm))=0;
THG_norm(~isfinite(THG_norm))        =0;
 
%==========================================================================
% Hybrid of CHG and THG
%==========================================================================
 
Mr1=a1*CHG_rad_norm+(1-a1)*THG_norm;
Mr2=a2*CHG_rad_norm+(1-a2)*THG_norm;
Mr3=a3*CHG_rad_norm+(1-a3)*THG_norm;
Mr4=a4*CHG_rad_norm+(1-a4)*THG_norm;
 
Mt1=a1*CHG_tan_norm+(1-a1)*THG_norm;
Mt2=a2*CHG_tan_norm+(1-a2)*THG_norm;
Mt3=a3*CHG_tan_norm+(1-a3)*THG_norm;
Mt4=a4*CHG_tan_norm+(1-a4)*THG_norm;
 
%==========================================================================
% VISUALIZATION
%========================================================================== 
figure;
 
subplot(2,4,1)
mesh(xgrid,ygrid,Mr1); view(2)
axis image
colorbar
title('Radial \alpha=0.2');
 
subplot(2,4,2)
mesh(xgrid,ygrid,Mr2); view(2)
axis image
colorbar
title('Radial \alpha=0.4');
 
subplot(2,4,3)
mesh(xgrid,ygrid,Mr3); view(2)
axis image
colorbar
title('Radial \alpha=0.6');
 
subplot(2,4,4)
mesh(xgrid,ygrid,Mr4); view(2)
axis image
colorbar
title('Radial \alpha=0.8');
 
subplot(2,4,5)
mesh(xgrid,ygrid,Mt1); view(2)
axis image
colorbar
title('Tangential \beta=0.2');
 
subplot(2,4,6)
mesh(xgrid,ygrid,Mt2); view(2)
axis image
colorbar
title('Tangential \beta=0.4');
 
subplot(2,4,7)
mesh(xgrid,ygrid,Mt3); view(2)
axis image
colorbar
title('Tangential \beta=0.6');
 
subplot(2,4,8)
mesh(xgrid,ygrid,Mt4); view(2)
axis image
colorbar
title('Tangential \beta=0.8');
 
colormap jet;
% colormap jet;
 
