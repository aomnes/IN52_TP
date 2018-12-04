clear;

image_training = imread('app.tif');
image_test = imread('test.tif');

%INFO fonction: coordEachDigitsOpt(image,nb_times_each_digit)
coordEachDigitsOpt_Test = coordEachDigitsOpt(image_test, 10);
coordEachDigitsOpt_Training = coordEachDigitsOpt(image_training, 20);

%%%%%%%%%classificateur 1
nb_trait = 21;%on separe l'image par ce nombre de trait
proba_result_classifieur1 = classifieur1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait);

%%%%%%%%%classificateur 2
nb_zone_h = 7; %on separe l'image nb_zone_h sur la largeur et nb_zone_h sur la hauteur
k = 4; %nombre de voisins a prendre en compte
proba_result_classifieur2 = classifieur2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, k, nb_zone_h);

%%%%%%%%%combinaison classificateurs 1 et 2
[result_somme, result_produit] = combinaisonClassifieurs(proba_result_classifieur1, proba_result_classifieur2);

%%%%%%%%%calcul accuracy
acc_somme = accuracy(result_somme);
acc_prod = accuracy(result_produit);
acc_class1 = accuracy(proba_result_classifieur1);
acc_class2 = accuracy(proba_result_classifieur2);

%!!!!utilise la methode classifieur1

%nb_trait_Array = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
nb_trait_Array = linspace(1,101,101);
%results_class1 = optimizeAccuracy1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array);
%plot(results_class1);

k_max = 10;
nombre_zone_max = 25;
%results_class2 = optimizeAccuracy2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nombre_zone_max, k_max);
%imagesc(results_class2);


% k_max_bis = 10;
% nombre_zone_max_bis = 25;
% nb_trait_Array_bis = linspace(1,21,21);
% [mat_result_somme, mat_result_produit] = optimizeAccuracy(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array_bis, nombre_zone_max_bis, k_max_bis);
% 
% scatter3(mat_result_somme);
% scatter3(mat_result_produit);

