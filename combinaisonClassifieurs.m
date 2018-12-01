function [result_somme_normalize, result_produit_normalize] = combinaisonClassifieurs(M1,M2)

    M3_somme = M1 + M2;
    M3_produit = M1 .* M2;
    
    result_somme_normalize = ft(M3_somme);
    result_produit_normalize = ft(M3_produit);
end

function somme_prod = ft(M3)
    somme_prod = zeros(10, 10, 10);
    for nb_digits = 1:10
        tmp = zeros(1,10);
        %+
        for digit = 1:10
            tmp = tmp + M3(digit:digit,:,nb_digits:nb_digits);
        end
        for digit = 1:10
            somme_prod(digit:digit,:,nb_digits:nb_digits) = M3(digit:digit,:,nb_digits:nb_digits)./ tmp;
        end
    end
end



