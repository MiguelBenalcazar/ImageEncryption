%%-----------------------
clc; clear all;
User = input('User:  ', 's'); 
password = input('Password :  ', 's'); 
[ IC_T] = IC_System( User , password )
%%-------------------------

%Read image and get gray_Image to use in the process
Color_Image=imread('C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\1.jpg');          %import color image I represents a RGB matrix
Gray_Image=rgb2gray(Color_Image);                                                         %Gray_I represent the grey image value of the plain image
Original=Gray_Image;                                                                      %Copy the gray value to a matrix called "Original" 
[M,N]=size(Gray_Image);

tic
%size of the selected moving window 
selected_M=16;
selected_N=16;
selected_M_aux=selected_M;
selected_N_aux=selected_N;

%Initial condition and declaration of different variables
%Initial condition to use in the bit-shuffling process
IC_x=IC_T(1);
IC_y=IC_T(2);
%shufflin rows
IC_x_R=IC_T(3);
IC_y_R=IC_T(4);
%shuffling columns
IC_x_C=IC_T(5);
IC_y_C=IC_T(6);


M_T=0; N_T=0;M_aux=0; N_aux=0; M_extra=0;N_extra=0;

%adaptive row window
if mod(M,selected_M)~=0
    M_T=floor(M/selected_M)+1;
    M_aux=1;
else
    M_T=M/selected_M;
end
%adaptive column window
if mod(N,selected_N)~=0
    N_T=floor(N/selected_N)+1;
    N_aux=1;
else
    N_T=N/selected_N;
end
%%%%%%%%%%%%%%%%%%%%%%%%   PUZZLE    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[ Matrix_total] = Flip_Odd_Col_Row( Gray_Image);
fprintf('past first stage\n')
toc
[ Image_1] = Puzzle_V2( Matrix_total,IC_x,IC_y );
fprintf('finish second stage\n')
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:M_T
  fprintf('ciphering');  
  start_aux_M=1+selected_M*(i-1);
  finish_aux_M=selected_M*(i)-M_extra;
    for j=1:N_T
      start_aux_N=1+selected_N*(j-1);
      finish_aux_N=selected_N*(j)-N_extra;
     %%%%%%%%%%%%%%%%%%%%%%% CHOOSE PART OF IMAGE USING WINDOW %%%%%%%%%%%%%%%%%%%%%%%     
      Window_Gray_Aux= Image_1(start_aux_M:finish_aux_M,start_aux_N: finish_aux_N);
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
      
     [ new_Matrix ] = decimal2binary( Window_Gray_Aux );
     %[M1 N1]=size(new_Matrix);
     [ Shu_Matrix_1 ,IC_x_R_new,IC_y_R_new] = shuffling_rows( new_Matrix ,IC_x_R,IC_y_R);
     IC_x_R=IC_x_R_new;
     IC_y_R=IC_y_R_new;
     [ Shu_Matrix, IC_x_C_new, IC_y_C_new ] = shuffling_columns( Shu_Matrix_1 , IC_x_C, IC_y_C);
     IC_x_C=IC_x_C_new;
     IC_y_C=IC_y_C_new;
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
 
    
     [ Decimal_Matrix ] = Binary2Decimal( Shu_Matrix  );
     
     
     %%%%%%%%%%%%%%%%%%% REORDER IMAGE ORIGINAL POSITION    %%%%%%%%%%%%%%%%%%%
     Window_Gray_Image(start_aux_M:finish_aux_M,start_aux_N: finish_aux_N)=Decimal_Matrix;
   
     
     
        if j==N_T-1 && N_aux==1
            N_extra=selected_N-mod(N,selected_N);
        else
            N_extra=0; 
        end
        
        
    end
    if i==M_T-1 && M_aux==1
       M_extra=selected_M-mod(M,selected_M);
    else
       M_extra=0 ; 
    end
   
    
    fprintf('the round value in column is %d de %d\n',i,M_T) 
end
toc
imB = uint8(Gray_Image);
imB0 = uint8(Matrix_total);
imB1 = uint8(Image_1);
imB2 = uint8(Window_Gray_Image);
figure (1); 
subplot(1,2,1);  imshow(imB); title('Plain-Image');%plot plain image
subplot(1,2,2);  imhist(imB);title('Histogram of Plain-Image');%plot Histogram
figure (2); 
subplot(1,2,1);  imshow(imB0); title('Plain-Image');%plot plain image
subplot(1,2,2);  imhist(imB0);title('Histogram of Plain-Image');%plot Histogram
figure (3); 
subplot(1,2,1);  imshow(imB1); title('Plain-Image');%plot plain image
subplot(1,2,2);  imhist(imB1);title('Histogram of Plain-Image');%plot Histogram
figure (4); 
subplot(1,2,1);  imshow(imB2); title('Plain-Image');%plot plain image
subplot(1,2,2);  imhist(imB2);title('Histogram of Plain-Image');%plot Histogram

imwrite(imB2,'C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\encryp.png')