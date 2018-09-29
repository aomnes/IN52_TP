function optimiserEachDigit(coordEachDigits, image, nb_digits, nb_times)

    % coordEachDigits(num_ligne, 1, i) %xa
    % coordEachDigits(num_ligne, 2, i) %ya
    % 
    % coordEachDigits(num_ligne, 3, i) %xb
    % coordEachDigits(num_ligne, 4, i) %yb
    for num_ligne = 1:nb_digits
        for num_fois = 1:nb_times
            tmp_digit = image(coordEachDigits(num_ligne, 2, num_fois):coordEachDigits(num_ligne, 4, num_fois),coordEachDigits(num_ligne, 1, num_fois):coordEachDigits(num_ligne, 3, num_fois));
            imshow(tmp_digit);
        end
    end

end

