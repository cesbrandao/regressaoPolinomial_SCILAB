clear;
clc;

aerogerador = fscanfMat('aerogerador.dat');

x = aerogerador(:,1); //velocidade do vento 
y = aerogerador(:,2); //potência gerada
n = length(x);

plot(x, y, '.'); //plotagem do gráfico dos dados

//GRAU 1 - reta
beta_1 = (sum(x.*y)-(1/n)*sum(y)*sum(x))/(sum(x.^2)-(1/n)*sum(x)^2); //Calculo de beta 1
beta_0 = mean(y)-beta_1*mean(x); //calculo de beta 0
y_chapeu = beta_0 + beta_1*x; //estimativa dos valores
plot(x, y_chapeu, 'y-', 'linewidth', 1.5);

R2 = 1 - sum((y-y_chapeu).^2)/sum((y-mean(y)).^2);  //calculo do R2

printf('Polinomio de Grau 1\n')
printf('R2 = %f\n', R2);
printf('Beta 0 = %f\n', beta_0);
printf('Beta 1 = %f\n', beta_1);

/*
//GRAU 1
poli = [ones(1,n)' x]; //polinômio para os valores de x (matriz)
Beta = inv(poli'*poli)*poli'*y;
y_chapeu = poli*Beta; //preditor
plot(x, y_chapeu, 'y-', 'linewidth', 1.5);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); //cálculo do R2
k = 1; //grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); //cálculo do R2 ajustado

printf('Polinomio de Grau 1\n');
printf('R2 = %f\n', r2);
printf('R2AJ = %f\n', r2aj);
*/
//GRAU 2
poli = [ones(1,n)' x x.^2]; //polinômio para os valores de x (matriz)
Beta = ((poli'*poli)^(-1))*poli'*y;
y_chapeu = poli*Beta; //preditor
plot(x, y_chapeu, 'r-', 'linewidth', 1.5);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); //cálculo do R2
k = 2; //grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); //cálculo do R2 ajustado

printf('\nPolinomio de Grau 2\n');
printf('R2 = %f\n', r2);
printf('R2AJ = %f\n', r2aj);

//GRAU 3
poli = [ones(1,n)' x x.^2 x.^3];
Beta = inv(poli'*poli)*poli'*y;
y_chapeu = poli*Beta;
plot(x, y_chapeu, 'g-', 'linewidth', 1.5);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2);
k = 3;
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1));

printf('\nPolinomio de Grau 3\n');
printf('R2 = %f\n', r2);
printf('R2AJ = %f\n', r2aj);

//GRAU 4
poli = [ones(1,n)' x x.^2 x.^3 x.^4];
Beta = inv(poli'*poli)*poli'*y;
y_chapeu = poli*Beta;
plot(x, y_chapeu, 'm-', 'linewidth', 1.5);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2);
k = 4;
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1));

printf('\nPolinomio de Grau 4\n');
printf('R2 = %f\n', r2);
printf('R2AJ = %f\n', r2aj);

//GRAU 5
poli = [ones(1,n)' x x.^2 x.^3 x.^4 x.^5];
Beta = inv(poli'*poli)*poli'*y;
y_chapeu = poli*Beta;
plot(x, y_chapeu, 'k-', 'linewidth', 1.5);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2);
k = 5;
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1));

printf('\nPolinomio de Grau 5\n');
printf('R2 = %f\n', r2);
printf('R2AJ = %f\n', r2aj);

//LEGENDA
legend(['Base de Dados'], 'Grau 1', 'Grau 2', 'Grau 3', 'Grau 4', 'Grau 5', [2]);
