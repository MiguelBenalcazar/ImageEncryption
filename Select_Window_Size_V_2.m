function [ m,window_m,residuo_M,last_row_M,n,window_n,residuo_N,last_column_N ] = Select_Window_Size_V_2( Gray_Image )
%m  rounds value in rows
%window_m size of the selected window
%residuo_M if the size of M is not divisible by 2 is equal 1 and copy the last M and it is keep in last_row_M
%n roubd value in columns
%window_n size of the selected window
%residuo_N if the size of N is not divisible by 2 is equal 1 and copy the last N and it is keep in last_column_N
last_row_M=0;last_column_N=0;residuo_M=0;residuo_N=0;

%funciton developed
[M,N]=size(Gray_Image);

%Variable auxiliar to keep operations after divide many times
m=1;n=1;
residuo_M=0;residuo_N=0;


%if the number of rows are not divisible by 2 then one column is taken as a
%remain M=M-1
if mod(M,2)~=0
   M=M-1;
   residuo_M=1;
   last_row_M=Gray_Image(M,:);
end

number=2;    %initial condition to select number to be true
window_m=M;  %Initial condition to window_m

while window_m>10 && number>0
%to check if window_m is divisible to 2 otherwise check if it is divisible
%by 3 otherwise if it is divisible by 5
    if mod(window_m,2)==0
        number=2;
    else
        if mod(window_m,3)==0
            number=3;
        else
            if mod(window_m,5)==0
                number=5;
            else
                number=0;
            end
        end
    end
    % update the windows value
    if number~=0
        window_m=window_m/number;
        m=m*number;
    end
end
    fprintf('Original M %d  \n',M); 
    fprintf('M round number %d window_m %d residual %d\n',m,window_m,residuo_M)

clearvars  number;

%if the number of rows are not divisible by 2 then one column is taken as a
%remain N=N-1
if mod(N,2)~=0
   N=N-1;
   residuo_N=1;
   last_column_N=Gray_Image(:,N);
end

number=2;    %initial condition to select number to be true
window_n=N;  %Initial condition to window_m

while window_n>10 && number>0
%to check if window_m is divisible to 2 otherwise check if it is divisible
%by 3 otherwise if it is divisible by 5
    if mod(window_n,2)==0
        number=2;
    else
        if mod(window_n,3)==0
            number=3;
        else
            if mod(window_n,5)==0
                number=5;
            else
                number=0;
            end
        end
    end
    % update the windows value
    if number~=0
        window_n=window_n/number;
        n=n*number;
    end
end
    fprintf('Original N %d  \n',N); 
    fprintf('N round number %d window_n %d residual %d\n',n,window_n,residuo_N)

end

