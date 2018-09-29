clear;

image = imread('test.tif');

%on recupere l'histogramme de l'axe des ordonnees
h_horizontale = histo_horizontale(image);
% figure('Name','Histogramme Horizontale');
% plot(result);
coord_ligne = getCoordV(h_horizontale, image);
% imshow(image);
coordEachDigits = getCoordH(coord_ligne, 10, 10, image);


optimiserEachDigit(coordEachDigits, image, 10, 10);


function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
