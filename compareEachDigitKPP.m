function [probabilty_class] = compareEachDigitKPP(densityImageTest1, densities_train, k)
    nb_point_classe = zeros(10,1); 
    % 10 = nb ligne et 20 = nb col ==> training set
    table_distance = zeros(10 * 20, 3);
    id_ligne = 0;
    for L = 1:20
       for H = 1:10
           id_ligne = id_ligne + 1;
           table_distance(id_ligne, 3) = H;
           table_distance(id_ligne, 2) = L;
           table_distance(id_ligne, 1) = distance(densityImageTest1, densities_train(:, L, H));
       end
    end
    distance_sort = sortrows(table_distance, 1);
    k_value = distance_sort(1:k,:);
    for k_bis = 1:k
        classe = k_value(k_bis,3);
        nb_point_classe(classe);
        nb_point_classe(classe) = nb_point_classe(classe) + 1; 
    end
    %obtenir les probabilite de chaque classe
    probabilty_class = nb_point_classe./ k;
end

function val = distance(x, wi)
    val = sqrt(sum((x-wi).^2));
end