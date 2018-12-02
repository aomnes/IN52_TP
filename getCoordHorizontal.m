function [coordEachDigits] = getCoordHorizontal(coord_ligne, nb_col, nb_ligne, image)
    %creer un tableau nombre ligne (10) x 2 x [10 ou 20]
    coord_col = zeros(nb_ligne, 2, nb_col);
    
    coordEachDigits = zeros(nb_ligne, 4, nb_col);
    
    %cette boucle cree un tableau contenant la ligne et utilise ce
    %tableau
    for num_ligne = 1:nb_ligne
        tmp_image_ligne = image(coord_ligne(num_ligne, 1):coord_ligne(num_ligne, 2),:);
        
        %creation de l'histogramme de la ligne
        h_vertical = histo_verticale(tmp_image_ligne);
        
        %compte le nombre de ligne en parcourant l'histogramme dès qu'il
        %rencontre un pic recupere l'abscisse, il en sort, puis dès qu'il
        %rencontre un autre recupere l'abscisse
        col = false; %true pendant qu'on est sur le pic
        %num de la col
        j = 1; %j -> num de la colomne en cours (1, ..., 10) car ou (1, ..., 20)
        for i = 1:size(h_vertical, 2)
            if h_vertical(1, i) > 0 && col == false
                col = true;
                coord_col(num_ligne,1, j) = i;
            end
            if h_vertical(1, i) == 0 && col == true
                coord_col(num_ligne,2, j) = i - 1;
                j = j + 1;
                col = false;
            end
        end
        
        for i = 1:nb_col
           %info line: line([x1,x2],[y1,y2])
%             line([coord_col(num_ligne, 1, i), coord_col(num_ligne, 1, i)],[coord_ligne(num_ligne, 1), coord_ligne(num_ligne, 2)]);
%             line([coord_col(num_ligne, 2, i), coord_col(num_ligne, 2, i)],[coord_ligne(num_ligne, 1), coord_ligne(num_ligne, 2)]);
%             line([coord_col(num_ligne, 1, i), coord_col(num_ligne, 2, i)],[coord_ligne(num_ligne, 1), coord_ligne(num_ligne, 1)]);
%             line([coord_col(num_ligne, 1, i), coord_col(num_ligne, 2, i)],[coord_ligne(num_ligne, 2), coord_ligne(num_ligne, 2)]);
           
           coordEachDigits(num_ligne, 1, i) = coord_col(num_ligne, 1, i); %xa
           coordEachDigits(num_ligne, 2, i) = coord_ligne(num_ligne, 1);%ya
%            scatter(coordEachDigits(num_ligne, 1, i),coordEachDigits(num_ligne, 2, i),'r*');
           
           coordEachDigits(num_ligne, 3, i) = coord_col(num_ligne, 2, i); %xb
           coordEachDigits(num_ligne, 4, i) = coord_ligne(num_ligne, 2); %yb
%           scatter(coordEachDigits(num_ligne, 3, i),coordEachDigits(num_ligne, 4, i),'r*');
        end
    end
%     coordEachDigits
end

function  [result] = histo_verticale(I)
    result = sum(I < 50, 1);
end

