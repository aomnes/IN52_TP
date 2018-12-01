function [proba_result_classifieur2] = classifieur2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, k, nb_zone_h)
    nb_digits = 10;
    nb_time_each_digits_Training = 20;
    nb_time_each_digits_Test = 10;
    densities_train = getDensities(coordEachDigitsOpt_Training, nb_digits, nb_time_each_digits_Training, image_training, nb_zone_h);
    proba_result_classifieur2 = getDensitiesTest(coordEachDigitsOpt_Test, nb_digits, nb_time_each_digits_Test, image_test, densities_train, nb_zone_h, k);    
end