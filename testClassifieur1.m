function [profils] = testClassifieur1(profils_train, nb_trait)
    image = imread('test.tif');

    %on recupere l'histogramme de l'axe des ordonnees
    h_horizontale = histo_horizontale(image);
    % figure('Name','Histogramme Horizontale');
    % plot(result);
    coord_ligne = getCoordV(h_horizontale, image);
    % imshow(image);
    coordEachDigits = getCoordH(coord_ligne, 10, 10, image);
    %on optimise l'encapsulation des digits
    coordEachDigitsOpt = optimiserEachDigit(coordEachDigits, image, 10, 10);

    profils = getProfilsTest(coordEachDigitsOpt, 10, 10, image, profils_train, nb_trait);    
end

function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
