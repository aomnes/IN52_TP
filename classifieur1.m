function [profils_test] = classifieur1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait)
    %profils ==> vecteur nb_trait * nb_digits ->10
    nb_digits = 10;
    nb_time_each_digits_Training = 20;
    nb_time_each_digits_Test = 10;
    profils_train = getProfils(coordEachDigitsOpt_Training, nb_digits, nb_time_each_digits_Training, image_training, nb_trait);
    profils_test = getProfilsTest(coordEachDigitsOpt_Test, nb_digits, nb_time_each_digits_Test, image_test, profils_train, nb_trait);    
end

