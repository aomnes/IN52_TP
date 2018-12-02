function [P] = getProfilsTest(coordEachDigitsOpt_Test, nb_ligne, nb_col, image_test, profils_train, nb_trait)
    %result(proba_each_digits, nb_col, nb_digits);
    P = zeros(10, 10, 10);
    for num_ligne = 1:nb_ligne
        for num_col = 1:nb_col
            %on recupere l'image du digit en cours et on la stock dans im_tmp
            im_tmp = image_test(coordEachDigitsOpt_Test(num_ligne, 2, num_col):coordEachDigitsOpt_Test(num_ligne, 4, num_col), coordEachDigitsOpt_Test(num_ligne, 1, num_col):coordEachDigitsOpt_Test(num_ligne, 3, num_col));
            %profils image TEST == même sortie que la méthode getProfils
            profil_image_test = getProfilImage(im_tmp, nb_trait);
            
            %profil_image_test --> (nb_trait*2) x 1
            %profils_train ---> (nb_trait*2) x 10
            
            %somme des proba :
            %sum(compareEachDigit(profil_image_test, profils_train))
            P(:, num_col, num_ligne) = compareEachDigit(profil_image_test, profils_train);
        end
    end
end

%On calcul les proba par rapport a chaque chiffre dispo (0.1.2.3.4.5.6.7.8.9)
function result = compareEachDigit(profils_image_test, profils_image_train)
    result = zeros(10, 1);
    %parcourir chaque digits
    for testDigit = 1:10
        result(testDigit) = CalculProba(profils_image_test, profils_image_train, profils_image_train(:, testDigit));
    end
end

%on calcul la probabilité selon la formule donnée dans le sujet du tp
function proba = CalculProba(profils_image_test, profil_image, profil_image_____i)
    % profils_image_test et profil_image_____i ==>> [(nb_trait*2) x 1]
    %sum_exp_dist(x,w)
    proba = exp_minus_dist(profils_image_test, profil_image_____i)./ sum_exp_dist(profils_image_test, profil_image);
end

function [result] = exp_minus_dist(profils_image_test, profil_image_____i)
    tmp1 = distance(profils_image_test, profil_image_____i);
    result = exp(-tmp1);
end

function sum = sum_exp_dist(x, w)
    sum = 0;
    for i = 1:10
        sum = sum + exp_minus_dist(x, w(:, i));
    end
end

function val = distance(x, wi)
    val = sqrt(sum((x-wi).^2));
end
