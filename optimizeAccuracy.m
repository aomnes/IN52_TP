function [result] = optimizeAccuracy(coordEachDigitsOpt, image, nb_trait_Array)
    size_array = size(nb_trait_Array);
    result = zeros(1, size_array(2));
    for i = 1:size_array(2)
        result(1,i) = accuracy(classifieur1(coordEachDigitsOpt, image, nb_trait_Array(1, i)));
    end
end

