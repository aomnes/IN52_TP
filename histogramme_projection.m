clear;

image = imread('app.tif');

%on recupere l'histogramme de l'axe des ordonnees
h_horizontale = histo_horizontale(image);
% figure('Name','Histogramme Horizontale');
% plot(result);
coord_ligne = getCoordV(h_horizontale, image);
% imshow(image);
coordEachDigits = getCoordH(coord_ligne, 20, 10, image);
%on optimise l'encapsulation des digits
coordEachDigitsOpt = optimiserEachDigit(coordEachDigits, image, 10, 20);
nb_trait = 5;
nb_zone_h = 3;
%classificateur 1
%profils ==> vecteur nb_trait * nb_digits ->10
profils1 = getProfils(coordEachDigitsOpt, 10, 20, image, nb_trait);
proba_result_classifieur1 = testClassifieur1(profils1, nb_trait);

%classificateur 2
k = 1;
densities1 = getDenties(coordEachDigitsOpt, 10, 20, image, nb_zone_h);
proba_result_classifieur2 = testClassifieur2(densities1, nb_zone_h, k);

function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
