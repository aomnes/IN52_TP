function [P] = getDensitiesTest(coordEachDigits, nb_col, nb_ligne, image, densities_train, nb_zone_h, k)
    %==> result(proba_each_digits, nb_col, nb_digits);
    P = zeros(10, nb_col, nb_ligne);
    for num_ligne = 1:nb_ligne
       for num_col = 1:nb_col
          %on recupere l'image du digit en cours et on la stock dans im_tmp
          im_tmp = image(coordEachDigits(num_ligne, 2, num_col):coordEachDigits(num_ligne, 4, num_col), coordEachDigits(num_ligne, 1, num_col):coordEachDigits(num_ligne, 3, num_col)); 
          tmp = getDensityImage(im_tmp, nb_zone_h);
          
          %compare puis stock result
          P(:, num_col, num_ligne) = compareEachDigitKPP(tmp, densities_train, k);
       end
    end
end

