function [ Matrix_Position, IC_x_new  ] = Create_Random_UserKey( IC_x, M ,data)
    %This function apply the shuffling to one selected matrix
    % IC_x initial condition logistic map x
    %IC_y initial condition logistic map y
    %M number of rows
    %N number of columns

    x(1)=IC_x;
  
                                                                           %variable designed to move in the vector position by position
    acum=0;
    position=1;
    n=1;
    r=3.99;

    while position<=M
        x(n+1) = 4*x(n)*(1-x(n));                                             % x represent the logistic map
       % x(n+1)=r*x(n)*(1-x(n))+(4-r)*sin(pi*x(n))/4;
        l(n)=mod(floor(x(n)*10^15),data)+1;                                       % math module to convert between total_vector
        for i=1:n                                                              % to verify and compare if a number has been already selected
            if l(i)==l(n)                                                      % if the number generated is equal then
                acum=acum+1;                                                   % variable acum add 1
            end
        end
        if acum>1                                                              % if variable acum is greater than 1
            n=n+1;                                                             % calculate a new number
        else
            Matrix_Position(1,position)=l(n);
            Selected_x(position)=x(n);
            n=n+1;
            position=position+1;
        end
        acum=0; 
    end
    
    IC_x_new=Selected_x(position-1); 
end

