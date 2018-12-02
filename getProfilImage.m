%%%
% Utilisé dans la fonction getProfils.m et getProfilsTest.m retour: matrice size[nb_trait * 2];
%%%
function [profils] = getProfilImage(image, nb_trait)
    profils = zeros(nb_trait, 2);
    %diviser la hauteur en nb_trait partie pour caster en entier
    offset = 5;
    x = uint8(linspace(1 + offset, size(image, 1) - offset, nb_trait));
    for fois = 1:nb_trait
        %recuperer tous les pixels de la ligne
        line = image(x(fois):x(fois), :);
        line = line';
        gaucheDroite = getGaucheDroite(line);
        %normalisation
        sizeLigne = size(line, 1);
        gaucheDroite = gaucheDroite./ sizeLigne;
        %copie resultats
        profils(fois, 1) = gaucheDroite(1);
        profils(fois, 2) = gaucheDroite(2);
    end
    profils = reshape(profils, [], 1);
    %profils ~~~ (g1 g2 ... gn d1 d2 ... dn)'
end

function [result] = getGaucheDroite(line)
result = zeros(2,1);
size_gauche = 0;
size_droite = 0;
    for i = 1:size(line)
        if line(i) ~= 0
            size_gauche = size_gauche + 1;
        else
            break;
        end
    end
    for i = size(line):-1:1
        if line(i) ~= 0
            size_droite = size_droite + 1;
        else
            break;
        end
    end
    result(1) = size_gauche;
    result(2) = size_droite;
end


