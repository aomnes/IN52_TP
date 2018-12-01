clear;

image_training = imread('app.tif');
image_test = imread('test.tif');

%INFO fonction: coordEachDigitsOpt(image,nb_times_each_digit)
coordEachDigitsOpt_Test = coordEachDigitsOpt(image_test, 10);
coordEachDigitsOpt_Training = coordEachDigitsOpt(image_training, 20);

%classificateur 1
nb_trait = 13;
proba_result_classifieur1 = classifieur1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait);

%classificateur 2
nb_zone_h = 5;
k = 5;
proba_result_classifieur2 = classifieur2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, k, nb_zone_h);

%combinaison classificateurs 1 et 2
[result_somme, result_produit] = combinaisonClassifieurs(proba_result_classifieur1, proba_result_classifieur2);

%calcul accuracy
acc_somme = accuracy(result_somme);
acc_prod = accuracy(result_produit);
acc_class1 = accuracy(proba_result_classifieur1);
acc_class2 = accuracy(proba_result_classifieur2);


nb_trait_Array = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
results_class1 = optimizeAccuracy(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array);
