function [Rd] = getProfils(coordEachDigitsOpt_Training, nb_digits, nb_time_each_digits, image_training, nb_trait)
    Rd = zeros(nb_trait * 2, nb_digits);
    for num_ligne = 1:nb_digits
        tmp = zeros(nb_trait * 2, nb_time_each_digits);
        for num_col = 1:nb_time_each_digits
            im_tmp = image_training(coordEachDigitsOpt_Training(num_ligne, 2, num_col):coordEachDigitsOpt_Training(num_ligne, 4, num_col), coordEachDigitsOpt_Training(num_ligne, 1, num_col):coordEachDigitsOpt_Training(num_ligne, 3, num_col));
            %figure('Name','image_training');
            %imshow(im_tmp);
            tmp(:, num_col) = getProfilImage(im_tmp, nb_trait);
        end
        Rd(:, num_ligne) = mean(tmp, 2);
    end
end
