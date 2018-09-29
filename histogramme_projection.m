image = imread('app.tif');

%on recupere l'histogramme de l'axe des ordonnees
h_horizontale = histo_horizontale(image);
% figure('Name','Histogramme Horizontale');
% plot(result);
coord_ligne = getCoordV(h_horizontale, image);
% imshow(image);
coord_col = getCoordH(coord_ligne, 20, 10, image);


function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
