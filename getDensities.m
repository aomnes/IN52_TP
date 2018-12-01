function [Rd] = getDensities(coordEachDigitsOpt_Training, nb_digits, nb_time_each_digits, image_training, nb_zone_h)
    Rd = zeros(nb_zone_h^2, nb_time_each_digits, nb_digits);
    for num_ligne = 1:nb_digits
        for num_col = 1:nb_time_each_digits
            im_tmp = image_training(coordEachDigitsOpt_Training(num_ligne, 2, num_col):coordEachDigitsOpt_Training(num_ligne, 4, num_col), coordEachDigitsOpt_Training(num_ligne, 1, num_col):coordEachDigitsOpt_Training(num_ligne, 3, num_col));
%             figure('Name','Image');
%             imshow(im_tmp);
            Rd(:, num_col, num_ligne) = getDensityImage(im_tmp, nb_zone_h);
%             dentyIm = getDensityImage(im_tmp, nb_zone_h);
        end
    end
end
