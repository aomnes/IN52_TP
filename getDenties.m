function [Rd] = getDenties(coordEachDigits, nb_ligne, nb_col, image, nb_zone_h)
    Rd = zeros(nb_zone_h^2, nb_col, nb_ligne);
    for num_ligne = 1:nb_ligne
        for num_col = 1:nb_col
            im_tmp = image(coordEachDigits(num_ligne, 2, num_col):coordEachDigits(num_ligne, 4, num_col), coordEachDigits(num_ligne, 1, num_col):coordEachDigits(num_ligne, 3, num_col));
%             figure('Name','Image');
%             imshow(im_tmp);
            Rd(:, num_col, num_ligne) = getDensityImage(im_tmp, nb_zone_h);
%             dentyIm = getDensityImage(im_tmp, nb_zone_h);
        end
    end
end
