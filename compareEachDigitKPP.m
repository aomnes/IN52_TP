function [result] = compareEachDigitKPP(densityImageTest1, densities_train, k)
    % 10 = nb ligne et 20 = nb col ==> training set
    distance = zeros(10 * 20, 3);
    for L = 1:20
       for H = 1:10
           distance(L * H, 3) = H;
           distance(L * H, 2) = L;
           distance(L * H, 1) = distance(densityImageTest1, densities_train(:, L, H));
       end
    end
    distance_sort = sortrows(distance, 1);
    k_value = distance_sort(k,:);
    for k_bis = 1:k
        
    end
end

function val = distance(x, wi)
    val = sqrt(sum((x-wi).^2));
end