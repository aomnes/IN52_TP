function [result] = optimizeAccuracy2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, nb_zone_h_max, k_max)
    result = zeros(k_max, nb_zone_h_max);
    for k = 1:k_max
        for h = 1:nb_zone_h_max
            result(k, h) = accuracy(classifieur2(coordEachDigitsOpt_Training, coordEachDigitsOpt_Test, image_training, image_test, k, h));
        end
    end
end

