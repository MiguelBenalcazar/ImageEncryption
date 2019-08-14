function [ IC_T] = IC_System( User , password )

User_l=length(User);
Password_l=length(password);

% IC=((255-double(User(1)) )*double(password(Password_l)))/(255*(double(password(1))*double(User(User_l))));
% IC_1=((255-double(User(User_l)) )*double(password(1)))/(255*(double(password(Password_l))*double(User(1))));
IC=((double(User(1)) )*double(password(Password_l)))/(255*(double(password(1))*double(User(User_l))));
IC_1=((double(User(User_l)) )*double(password(1)))/(255*(double(password(Password_l))*double(User(1))));
fprintf('%d , %d \n',IC,IC_1)


User_sha = sha256( User );
User_sha_length=length(User_sha);
Password_sha=sha256(password);
Password_sha_length=length(Password_sha);

 
 for i = 1:User_sha_length
        User_sha_num(i) = double(User_sha(i));
        Password_sha_num(i)=double(Password_sha(i));
 end
 
 [ Matrix_Position, IC_x_new  ] = Create_Random_UserKey( IC,12 ,Password_sha_length);
 [ Matrix_Position_U, IC_x_new_U  ] = Create_Random_UserKey( IC_1,12,User_sha_length);
 for i=1:6
 %for i=1:12
    aux=Matrix_Position(i);
    Data_Password(i)= Password_sha_num(aux); 
    aux_1=Matrix_Position_U(i);
    Data_User(i)= User_sha_num(aux_1); 
 end
 
 
 for i=1:6
%  a=Data_User(2*i)-Data_User(1+2*(i-1)) ;
%  b=Data_Password(1+2*(i-1))+Data_Password(2*i);
a=Data_User(i);
b=Data_Password(i);
 IC_T(i)=abs(a/b);
 
 end






end

