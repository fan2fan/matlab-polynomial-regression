function solution = solveMatrix(A,b)

[m,n] = size(A);
if m~=n
        error('系数矩阵应为方阵');
        solution = [];
else
    if abs(det(A))<=eps
        error('系数矩阵是奇异的');   %所求方程组系数矩阵必须是是非奇异的！
        solution = [];
    else
        Y = [A,b];
        %% 从前往后消
        for k=1:(m-1)
        %     if(abs(Y(k,k))<eps)
            [M,I] = max(abs(Y(k+1:m,k)));
            if (M>abs(Y(k,k)))
                temp = Y(k,:);
                Y(k,:) = Y(k+I,:);
                Y(k+I,:) = temp;
            end
            for i = k+1:m
                factor = Y(i,k)/Y(k,k);
    %             %若ai,k元素已经为0则不用相减
    %             if(abs(factor)>eps)
                Y(i,k:end) = Y(i,k:end) - factor* Y(k,k:end);
    %             end
            end
        end

        %% 从后往前消：
        for k=m:-1:2
            Y(k,:) = Y(k,:)/Y(k,k);
            for j = k-1:-1:1
                factor = Y(j,k);
                Y(j,k:end) = Y(j,k:end) - factor* Y(k,k:end);
            end
        end
        Y(1,:) = Y(1,:)/Y(1,1);
        solution = Y(:,end);
    end
end
% 
end
