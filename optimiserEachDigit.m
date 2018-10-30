function [coordEachDigits] = optimiserEachDigit(coordEachDigits, image, nb_digits, nb_times)

    % coordEachDigits(num_ligne, 1, num_fois) %xa
    % coordEachDigits(num_ligne, 2, num_fois) %ya
    % 
    % coordEachDigits(num_ligne, 3, num_fois) %xb
    % coordEachDigits(num_ligne, 4, num_fois) %yb
    figure('Name','Point image');
    imshow(image);
    for num_ligne = 1:nb_digits
        for num_fois = 1:nb_times
            tmp_digit = image(coordEachDigits(num_ligne, 2, num_fois):coordEachDigits(num_ligne, 4, num_fois),coordEachDigits(num_ligne, 1, num_fois):coordEachDigits(num_ligne, 3, num_fois));
            %imshow(tmp_digit);
            
            h_vertical = histo_horizontale(tmp_digit);
            
            %compte le nombre de ligne en parcourant l'histogramme dès qu'il
            %rencontre un pic recupere l'abscisse, il en sort puis modifie
            %les coordonnee du digit xa, ya et xb, yb.
            col = false; %true pendant qu'on est sur le pic
            %num de la col
            size_im = size(h_vertical);
            tmp_y1 = 1;
            tmp_y2 = size(h_vertical, 1);
            size(tmp_digit)
            for i = 1:size_im(1)
                if h_vertical(i, 1) > 0 && col == false
                    col = true;
                    tmp_y1 = i;
                end
                if h_vertical(i, 1) == 0 && col == true
                    tmp_y2 = i - 1;
                    break;
                end
            end

            %tmp_result = tmp_digit(tmp_y1:tmp_y2,:);
            %imshow(tmp_result);
            %save(tmp_result,num_ligne,num_fois)
            
            coordEachDigits(num_ligne, 2, num_fois) = coordEachDigits(num_ligne, 2, num_fois) + tmp_y1;%ya
            coordEachDigits(num_ligne, 4, num_fois) = coordEachDigits(num_ligne, 4, num_fois) - (size(tmp_digit, 1) - tmp_y2);%yb
            
            hold on
            plot(coordEachDigits(num_ligne, 1, num_fois), coordEachDigits(num_ligne, 2, num_fois), 'g.');
            plot(coordEachDigits(num_ligne, 3, num_fois), coordEachDigits(num_ligne, 4, num_fois), 'r.');           
        end
    end
    
    

end


function  [result] = histo_horizontale(I)
    result = sum(I < 50, 2);
end

function save(tmp_digit,num_ligne, num_fois)
    destinationFolder = '/Users/omnes.antoine/Documents/Etudes/UTBM 2018 - 2019/UV/IN54/TP/Digits_test';
    if ~exist(destinationFolder, 'dir')
      mkdir(destinationFolder);
    end
    baseFileName = sprintf('digit_%d - numero_%d.png', num_ligne - 1, num_fois); % e.g. "1.png"
    fullFileName = fullfile(destinationFolder, baseFileName);
    display(fullFileName);
    imwrite(tmp_digit, fullFileName); % img respresents input image.
end

