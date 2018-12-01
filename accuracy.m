function [accuracy] = accuracy(result)
   sum_good = 0;
    for num_digits = 1:10
        for item = 1:10
            [~, index] = max(result(:,item:item,num_digits:num_digits));
            if(index == num_digits)
                sum_good = sum_good + 1;
            end
        end
    end
    accuracy = sum_good./ 100;
end

