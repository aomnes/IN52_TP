function [proba_result_classifieur1] = classifieur1(coordEachDigitsOpt, image,nb_trait)
    %profils ==> vecteur nb_trait * nb_digits ->10
    profils1 = getProfils(coordEachDigitsOpt, 10, 20, image, nb_trait);
    proba_result_classifieur1 = testClassifieur1(profils1, nb_trait);
end

