function [P] = getProfilsTest(coordEachDigitsOpt_Test, nb_ligne, nb_col, image, profils_train, nb_trait)
    %result(proba_each_digits, nb_col, nb_digits);
    P = zeros(10, 10, 10);
    for num_ligne = 1:nb_ligne
        for num_col = 1:nb_col
            im_tmp = image(coordEachDigitsOpt_Test(num_ligne, 2, num_col):coordEachDigitsOpt_Test(num_ligne, 4, num_col), coordEachDigitsOpt_Test(num_ligne, 1, num_col):coordEachDigitsOpt_Test(num_ligne, 3, num_col));
            %figure('Name','Image');
            %imshow(im_tmp);
            tmp = getProfilImage(im_tmp, nb_trait);
            P(:, num_col, num_ligne) = compareEachDigit(tmp, profils_train);
        end
    end
end


function result = compareEachDigit(profils_image_test, profil_image)
    result = zeros(10, 1);
    %parcourir chaque digits
    for testDigit = 1:10
        result(testDigit) = CalculProba(profils_image_test, profil_image, profil_image(:, testDigit));
    end
end

function proba = CalculProba(x, w, wi)
    tmp1 = distance(x, wi);
    tmp2 = exp(-tmp1);
    proba = tmp2 / sum_exp_dist(x, w);
end

function val = distance(x, wi)
    val = sqrt(sum((x-wi).^2));
end

function s = sum_exp_dist(x, w)
    s = 0;
    for i = 1:10
        s = s + exp(-distance(x, w(i)));
    end
end
