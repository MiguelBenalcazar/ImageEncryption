function [ Decimal_Matrix ] = Binary2Decimal( new_Matrix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
shift_bin=8;
[M N]=size(new_Matrix);
N=N/shift_bin;
Matrix_size=M*N;

acum=1; acum1=0;


for i=1:Matrix_size
    
    if acum<=M
        bit_Matrix(i,1:8)=new_Matrix(acum,1+acum1:8+acum1);
        acum=acum+1;
    else
        acum=1;
        acum1=acum1+8;
        bit_Matrix(i,1:8)=new_Matrix(acum,1+acum1:8+acum1);
        acum=acum+1;
    end
    
end
decimal_Matrix=bi2de(bit_Matrix,'left-msb');

clearvars acum acum1
acum=1; acum1=1;
for i=1:Matrix_size
    
    if acum<=M
        Decimal_Matrix(acum,acum1)=decimal_Matrix(i,1);
        acum=acum+1;
    else
        acum=1;
        acum1=acum1+1;
        Decimal_Matrix(acum,acum1)=decimal_Matrix(i,1);
        acum=acum+1;
        
    end
    
end
end

