#Filtro de média, máscaras 3x3, 15x15, 31x31
%% Startup and Globals
clear all
clc

# Carrega a imagem para a variável I
I = imread('epcot.jpg');

# Transformar a imagem RGB para a escala cinza
# para facilitar a analise
# função do octave (RGB ? NTSC) -> (Padrões de cores)
G = rgb2hsv(I);
# capturando o primeiro canal (V do HSV)
#hsv = sistemas de cores, v significa value, é o valor da luminância
G = G(:,:,3);

#mostra imagem original na escala cinza
figure, imshow (G)
title('Imagem original')

# dar o comando pkg load image no prompt antes, afim de carregar o pacote
#incluindo ruído sal e pimenta na imagem
G1 = imnoise(G, 'salt & pepper', 0.1);
#mostra a imagem com ruido
figure, imshow(G1);
title('Imagem com ruído')

# cria uma máscara com pesos iguais, de tamanho 3x3, 15x15, 31x31 (filtro)
# soma dos pesos deve ser = 1
m1 = ones(3,3)/9;
m2 = ones(15,15)/225;
m3 = ones(31,31)/961;

# faz a convolução da imagem (gray) com a mascara (m)
G2 = conv2(G1,m1);
G3 = conv2(G1,m2);
G4 = conv2(G1,m3);

# mostra a imagem com filtro 3x3
figure, imshow(G2);
title('Mascara 3x3');

# mostra a imagem com filtro 15x15
figure, imshow(G3);
title ('Máscara 15x15');

# mostra a imagem com filtro 31x31
figure, imshow(G4);
title ('Máscara 31x31');