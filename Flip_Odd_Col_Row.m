function [ Gray_Image ] = Flip_Odd_Col_Row( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Gray_Image=A;
[M,N]=size(Gray_Image);

for i=1:M
    if mod(i,2)~=0
        Gray_Image(i,:)=255-fliplr(Gray_Image(i,:));
    end
    
end
for i=1:N
    if mod(i,2)~=0
        Gray_Image(:,i)=255-flipud(Gray_Image(:,i));
    end
    
end

end

