function [result] = optimizeAccuracy(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array)
    size_array = size(nb_trait_Array);
    result = zeros(1, size_array(2));
    for i = 1:size_array(2)
        result(1,i) = accuracy(classifieur1(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_trait_Array(1, i)));
    end
end