function [ Matrix_Random_Total ] = Puzzle_V2( Gray_Image,IC_x_R,IC_y_R )
    fprintf('OuzzleV2\n');
    IC_x=IC_x_R;
    IC_y=IC_y_R ;
    [M N]=size(Gray_Image);

    [ m,window_m,residuo_M,last_row_M,n,window_n,residuo_N,last_column_N ] = Select_Window_Size_V_2( Gray_Image );
    %window_m size of window in rows
    %window_n size of window in column

    for j=1:m
        M_start=1+window_m*(j-1);
        M_end=window_m*j;
        Matrix_Aux=Gray_Image(M_start:M_end,:);

        [ Matrix_Position, IC_x_new,IC_y_new  ] = Create_shuffling_matrix( IC_x, IC_y, n );
        IC_x= IC_x_new;
        IC_y= IC_y_new;
        for i=1:n
            aux=Matrix_Position(i);

            offset_N_start_new=1+window_n*(aux-1);
            offset_N_end_new=window_n*(aux);

            offset_N_start=1+window_n*(i-1);
            offset_N_end=window_n*(i);

            Matrix_Random_Aux(:,offset_N_start_new:offset_N_end_new)=Matrix_Aux(:, offset_N_start:offset_N_end);

        end

        Matrix_Random_Total(M_start:M_end,:)=Matrix_Random_Aux;

    end
    IC_x_new=IC_x;
    IC_y_new=IC_y; 
    if residuo_M==1
        Matrix_Random_Total(M,:)=last_row_M; 
    end
    if residuo_N==1
        Matrix_Random_Total(:,N)=last_column_N; 
    end



end

