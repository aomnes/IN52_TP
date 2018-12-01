function [proba_result_classifieur2] = classifieur2(coordEachDigitsOpt, image, k, nb_zone_h)
    densities1 = getDenties(coordEachDigitsOpt, 10, 20, image, nb_zone_h);
    proba_result_classifieur2 = testClassifieur2(densities1, nb_zone_h, k);
end

