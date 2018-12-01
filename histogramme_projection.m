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

%classificateur 1
nb_trait = 20;
proba_result_classifieur1 = classifieur1(coordEachDigitsOpt, image, nb_trait);

%classificateur 2
nb_zone_h = 5;
k = 5;
proba_result_classifieur2 = classifieur2(coordEachDigitsOpt, image, k, nb_zone_h); 

%combinaison classificateurs 1 et 2
[result_somme, result_produit] = combinaisonClassifieurs(proba_result_classifieur1, proba_result_classifieur2);

acc_somme = accuracy(result_somme);
acc_prod = accuracy(result_produit);
acc_class1 = accuracy(proba_result_classifieur1);
acc_class2 = accuracy(proba_result_classifieur2);


nb_trait_Array = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
results_class1 = optimizeAccuracy(coordEachDigitsOpt, image, nb_trait_Array);


function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
