function [ Shu_Matrix_1,IC_x_new,IC_y_new ] = shuffling_rows( A ,IC_x,IC_y)

     [M N]=size(A);
     %handle matrix odd rows
     for i=1:M
             M_aux_x=A(i,:);
             [ Matrix_Position, IC_x_new,IC_y_new  ] = Create_shuffling_matrix( IC_x, IC_y, N );
             IC_x=IC_x_new;
             IC_y=IC_y_new;
             for j=1:N               
                 aux=Matrix_Position(j);
                 Shu_Matrix_1(i,aux)=M_aux_x(1,j);
             end
       
     end

end

