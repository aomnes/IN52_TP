function [result_somme, result_produit] = optimizeAccuracy(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array, nb_zone_h_max, k_max)
    nb_trait = size(nb_trait_Array);
    result_somme = zeros(k_max, nb_zone_h_max, nb_trait(2));
    result_produit = zeros(k_max, nb_zone_h_max, nb_trait(2));
    for k = 1:k_max
        for h = 1:nb_zone_h_max
            for trait = 1:nb_trait(2)
                proba_result_classifieur1 = classifieur1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array(trait));
                proba_result_classifieur2 = classifieur2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, k, h);
                
                [result_somme_tmp, result_produit_tmp] = combinaisonClassifieurs(proba_result_classifieur1, proba_result_classifieur2);

                result_somme(k, h, trait) = accuracy(result_somme_tmp);
                result_produit(k, h, trait) = accuracy(result_produit_tmp);
            end
        end
    end
end

