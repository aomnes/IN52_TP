%on utilise l'histogramme en entrée afin de trouver le début et la fin de
%chaque ligne de chiffre
function [coord_ligne] = getCoordVertical(histo, image)
    nb_ligne = 0;
    ligne = false;

    %compte le nombre de ligne en parcourant l'histogramme dès qu'il
    %rencontre un pic +1, il en sort, puis dès qu'il rencontre un autre +1
    for i = 1:size(histo)
        if histo(i) > 0 && ligne == false
            ligne = true;
            nb_ligne = nb_ligne + 1;
        end
        if histo(i) == 0 && ligne == true
            ligne = false;
        end
    end

    %cree un tableau de zeros de taille nb_ligne
    %ce tableau sert à stocker les coordonne
    %[x_0, y_0]...[x_i, y_i]...[x_nb_ligne, y_nb_ligne]
    coord_ligne = zeros(nb_ligne, 2);
    ligne = false;
    
    j = 1; %j -> num de la ligne en cours (0, 1, ..., 9)
    % de la meme facon que la boucle for prcedente.
    for i = 1:size(histo)
        if histo(i) > 0 && ligne == false
            ligne = true;
            coord_ligne(j,1) = i;
        end
        if histo(i) == 0 && ligne == true
            coord_ligne(j,2) = i - 1;
            j = j + 1;
            ligne = false;
        end
    end
    
    
    %affichage du resultat sur l'image
%     figure('Name','Image avec lignes');
%     imshow(image);
%     for i = 1:nb_ligne
%         %info line: line([x1,x2],[y1,y2])
%         line([0,size(image, 2)], [coord_ligne(i,1), coord_ligne(i,1)]);
%         line([0,size(image, 2)], [coord_ligne(i,2), coord_ligne(i,2)]);
%     end
end

