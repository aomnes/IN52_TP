function [result] = getDensityImage(image, nb_zone_h)
    result = zeros(nb_zone_h^2, 1);
    sze = size(image);
    hauteur = sze(1, 1);
    largeur = sze(1, 2);
    largeur_zone = fix(largeur / nb_zone_h);
    hauteur_zone = fix(hauteur / nb_zone_h);
   
    for L = 1:nb_zone_h
        for H = 1:nb_zone_h
            h0 = (H-1) * hauteur_zone + 1;
            h1 = H * hauteur_zone;
            l0 = (L-1) * largeur_zone + 1;
            l1 = L * largeur_zone;
            if (h1 > hauteur)
                h1 = hauteur;
            end
            if (l1 > largeur)
                l1 = largeur;
            end
            tmp_square = image(h0:h1, l0: l1);
%             figure('Name','tmp');
%             imshow(tmp_square);
            sum_zero = sum(tmp_square(:) == 0);
            result(L * H, 1) = sum_zero;
        end
    end
    result = result./(hauteur * largeur); 
end

