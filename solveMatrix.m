function solution = solveMatrix(A,b)

[m,n] = size(A);
if m~=n
        error('The coefficient matrix should be square');
        solution = [];
else
    if abs(det(A))<=eps
        error('The coefficient matrix is singular');   %The coefficient matrix must be nonsingular
        solution = [];
    else
        Y = [A,b];
        %% front-to-back elimination 
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
                Y(i,k:end) = Y(i,k:end) - factor* Y(k,k:end);
            end
        end

        %% back-to-front elimination
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

end
