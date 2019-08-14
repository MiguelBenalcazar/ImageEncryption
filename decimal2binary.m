function [ new_Matrix ] = decimal2binary( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[M N]=size(A);
bit_Matrix=de2bi(A,8,'left-msb');
shift_bin=8;
Matrix_size=M*N;
acum=1; acum1=0;


for i=1:Matrix_size
    
    if acum<=M
        new_Matrix(acum,1+acum1:shift_bin+acum1)=bit_Matrix(i,1:shift_bin);
        acum=acum+1;
    else
        acum=1;
        acum1=acum1+shift_bin;
        new_Matrix(acum,1+acum1:shift_bin+acum1)=bit_Matrix(i,1:shift_bin);
        acum=acum+1;
    end
    
end


end

