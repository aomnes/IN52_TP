function [Rd] = getProfils(coordEachDigits, nb_ligne, nb_col, image, nb_trait)
    Rd = zeros(nb_trait * 2, nb_ligne);
    for num_ligne = 1:nb_ligne
        tmp = zeros(nb_trait * 2, nb_col);
        for num_col = 1:nb_col
            im_tmp = image(coordEachDigits(num_ligne, 2, num_col):coordEachDigits(num_ligne, 4, num_col), coordEachDigits(num_ligne, 1, num_col):coordEachDigits(num_ligne, 3, num_col));
            %figure('Name','Image');
            %imshow(im_tmp);
            tmp(:, num_col) = getProfilImage(im_tmp, nb_trait);
        end
        Rd(:, num_ligne) = mean(tmp, 2);
    end
end
