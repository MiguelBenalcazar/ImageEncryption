function [ Shu_Matrix,IC_x_new,IC_y_new ] = shufflin_columns( A , IC_x, IC_y)
[M N]=size(A);
for n=1:N
       
             M_aux_y=A(:,n); 
             M_aux_x=M_aux_y';
             
             [ Matrix_Position, IC_x_new,IC_y_new  ] = Create_shuffling_matrix( IC_x, IC_y, M );
             IC_x=IC_x_new;
             IC_y=IC_y_new;
             for m=1:M                                                    %moving in columns                
                 aux=Matrix_Position(m);
                 Shu_Matrix_aux(1,aux)=M_aux_x(1,m); 
             end
             Shu_Matrix(:,n)=Shu_Matrix_aux';
       
     end
end

