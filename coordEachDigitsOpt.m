% Fonction pour obtenir les coordonnées gauche/haut et droite/bas de chaque
% chiffre dans les images.
% Sortie tableau 10 x 4 x nombre répétition
% 4 --> [x1 y1 x2 y2]
function coordEachDigitsOpt_matrix = coordEachDigitsOpt(image, nb_times_each_digit)
    %on recupere l'histogramme de l'axe des ordonnees
    h_horizontale = histo_horizontale(image);

    %on utilise l'histogramme obtenu avant afin de séparer chaque ligne
    coord_ligne = getCoordVertical(h_horizontale, image);
    %on utilise les lignes obtenu avant afin de séparer chaque chiffre de
    %chaque ligne
    coordEachDigits = getCoordHorizontal(coord_ligne, nb_times_each_digit, 10, image);
    
    %on optimise l'encapsulation des chiffres obtenus avant
    coordEachDigitsOpt_matrix = optimiserEachDigit(coordEachDigits, image, 10, nb_times_each_digit);
end

function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
