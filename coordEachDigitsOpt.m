function coordEachDigitsOpt_matrix = coordEachDigitsOpt(image, nb_times_each_digit)
    %on recupere l'histogramme de l'axe des ordonnees
    h_horizontale = histo_horizontale(image);
    % figure('Name','Histogramme Horizontale');
    % plot(result);
    coord_ligne = getCoordV(h_horizontale, image);
    % imshow(image);
    coordEachDigits = getCoordH(coord_ligne, nb_times_each_digit, 10, image);
    %on optimise l'encapsulation des digits
    coordEachDigitsOpt_matrix = optimiserEachDigit(coordEachDigits, image, 10, nb_times_each_digit);
end

function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end