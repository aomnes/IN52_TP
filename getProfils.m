function [profils] = getProfils(coordEachDigits, nb_ligne, nb_col, image)
profils = 0;
nb_trait = 10;
for num_ligne = 1:nb_ligne
    for num_col = 1:nb_col
        im_tmp = image(coordEachDigits(num_ligne, 2, num_col):coordEachDigits(num_ligne, 4, num_col), coordEachDigits(num_ligne, 1, num_col):coordEachDigits(num_ligne, 3, num_col));
        %figure('Name','Image');
        %imshow(im_tmp);
        ecart =  size(im_tmp, 1) / nb_trait; 
        x = linspace(0, size(im_tmp, 1), ecart);
        for fois = 1:nb_trait - 1
            line = im_tmp(, :)
        end
        
    end
end



end

