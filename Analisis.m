clc;clear;
I = imread('C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\WW\WW.jpg');
I1 = imread('C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\WW\2.png');


% % n=800;
% % n=2100;
% % m=2500;
% 
% % n=550;
% % m=550;
% 
% %  n=8000;
% %  m=8000;
% 
 % n=3000;
 % m=3000;
% % m=800;
% 

%%____________________________HORIZONTAL___________________________________
        %Similarity of two horizontal adjacent pixels in plain-image
%__________________________________________________________________________

x=1; y=1;b=1;

Gray_I=rgb2gray(I); 
[M,N]=size(Gray_I);

while x<M
    N_aux(1,:)=Gray_I(x,:);
    a=size(N_aux);
while y<a(2)
   
        Matrix_C(b,1)=N_aux(1,y);
        Matrix_C(b,2)=N_aux(1,y+1);
        y=y+1;
        b=b+1;
end 
    x=x+64;
    y=1;
    
end

R = corr2(Matrix_C(:,1),Matrix_C(:,2));


%__________________________________________________________________________
       %Similarity of two horizontal adjacent pixels in cipher-image
%__________________________________________________________________________
x=1; y=1;b=1;
Gray_I1=I1; 
[M,N]=size(Gray_I1);

while x<M
    N_aux(1,:)=Gray_I(x,:);
    a=size(N_aux);
while y<a(2)
   
        Matrix_C_E(b,1)=Gray_I1(1,y);
        Matrix_C_E(b,2)=Gray_I1(1,y+1);
        y=y+1;
        b=b+1;
end 
    x=x+64;
    y=1;
    
end

R1 = corr2(Matrix_C_E(:,1),Matrix_C_E(:,2));
%%_____________________________VERTICAL____________________________________
    %Similarity of two vertical adjacent pixels in plain-image
%__________________________________________________________________________
x=1; y=1;b=1;
B=Gray_I;
[MV,NV]=size(B); 
while y<NV
    M_aux(:,1)=B(:,y);
    a=size(M_aux);
    while x<a(1)
        B1(b,1)=M_aux(x);
        B1(b,2)=M_aux(x+1);
        x=x+1;
        b=b+1;
    end
    x=1;
    y=y+64;
end

R2 = corr2(B1(:,1),B1(:,2));


%__________________________________________________________________________
       %Similarity of two vertical adjacent pixels in cipher-image
%__________________________________________________________________________
x=1; y=1;b=1;xx=1;
BE=I1;
[MV,NV]=size(BE);
while y<NV
    M_auxE(:,1)=BE(:,y);
    a=size(M_aux);
    while x<a(1)
        B1E(b,1)=M_auxE(x);
        B1E(b,2)=M_auxE(x+1);
        x=x+1;
        b=b+1;
    end
    x=1;
    y=y+64;
end

R3 = corr2(B1E(:,1),B1E(:,2));



%% _____________________________DIAGONAL___________________________________
        %Similarity of two diagonal adjacent pixels in plain-image
%__________________________________________________________________________
x=1; y=0;b=1;
C = Gray_I;
[MD,ND]=size(C);
while y<ND
    x1 = diag(C,y);
    a=size(x1);
    while x<a(1)
        M_D(b,1)=x1(x);
        M_D(b,2)=x1(x+1);
        x=x+1;
        b=b+1;
    end
     x=1;
    y=y+64;
end

R4 = corr2(M_D(:,1),M_D(:,2));

%__________________________________________________________________________
       %Similarity of two diagonal adjacent pixels in cipher-image
%__________________________________________________________________________
x=1;y=0;b=1;
CE = I1;
[MD,ND]=size(CE);
while y<ND
    x2 = diag(CE,y);
    a=size(x2);
    while x<a(1)
        M_DE(b,1)=x2(x);
        M_DE(b,2)=x2(x+1);
        x=x+1;
         b=b+1;
    end
    x=1;
    y=y+64;
end
R5 = corr2(M_DE(:,1),M_DE(:,2));

a=size(Matrix_C);
c=size(B1);
e=size(M_D);

if a(1)<c(1)
    n=a(1); 
else 
    n=c(1);  
end
if a(1)<e(1)
    n=a(1); 
else 
    n=e(1);  
end
if e(1)<c(1)
    n=e(1); 
else 
    n=c(1);  
end




figure (1)
subplot(3,2,1);
plot(Matrix_C(1:n,1),Matrix_C(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two horizontal adjacent pixels in plain-image');
subplot(3,2,2);
plot(Matrix_C_E(1:n,1),Matrix_C_E(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two horizontal adjacent pixels in cipher-image');
subplot(3,2,3);
plot(B1(1:n,1),B1(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two vertical adjacent pixels in plain-image');
subplot(3,2,4);
plot(B1E(1:n,1),B1E(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two vertical adjacent pixels in cipher-image');
subplot(3,2,5);
plot(M_D(1:n,1),M_D(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two diagonal adjacent pixels in plain-image');
subplot(3,2,6);
plot(M_DE(1:n,1),M_DE(1:n,2),'.');set(gca,'FontSize',15)
title('Similarity of two diagonal adjacent pixels in cipher-image');
fprintf('                          CORRELATION ANALYSIS                             \n')
fprintf('_________________________________________________________________________\n');
fprintf('       MODEL                 ORIGINAL IMAGE           CIPHERED IMAGE\n');
fprintf('_________________________________________________________________________\n');
fprintf('  HORIZONTAL                 %f                       %f                 \n',R,R1);
fprintf('  VERTICAL                   %f                       %f                 \n',R2,R3);
fprintf('  DIAGONAL                   %f                       %f                 \n',R4,R5);
fprintf('_________________________________________________________________________\n');


%% _____________________________ENTROPY______________________________________________

J = entropy(Gray_I);
J_E = entropy(I1);
fprintf('\n                          ENTROPY                             \n')
fprintf('_________________________________________________________________________\n');
fprintf('                ORIGINAL IMAGE           CIPHERED IMAGE\n');
fprintf('_________________________________________________________________________\n');
fprintf('                %f                       %f                 \n',J,J_E);
fprintf('_________________________________________________________________________\n');
