clear;
clc;

%putting the starting point of the computation time
tic; 

%defining the variables
global data B Pd 

% The data matrix should have 5 columns, it is designed for 5 unit...
% ...powerplants, it should have the magnitude of the P^2 for the first
% column and so on.
%continued by upper limits and lower limits!
%for the data the number of rows means how many unitis we have which in
%this case is 5.

data=[
0.0003	10      670	100	755
0.00025	10      570	100	555
0.0012	10.7	175	75	560
0.0004	11.2	227	100	700
0.0008	10      460	165	670];

% Loss coefficients matrix B that is given in the question
B = [
  1.4 -1.2 -0.7 -0.1 -0.3
 -1.2  1.5 -1.3  0   -0.5
 -0.7 -1.3  7.6 -0.1 -1.3
 -0.1  0   -0.1  3.4 -0.7
 -0.3 -0.5 -1.3 -0.7  9  ]*10^-4;


%Demand in (MW) that is written in the table according to my birthdate
Pd=1467;


%settings and options for the genetic algorithm
options = gaoptimset;
options = gaoptimset('PopulationSize', 100 ,'Generations', 300 ,'TimeLimit', 10,'StallTimeLimit', 1000,'PlotFcns',  {@gaplotbestf,@gaplotbestindiv});
[x ff]=ga(@MohammadLotfi,5,options);
[F P1 Pl]=MohammadLotfi(x)

%end of the computation time
toc;

%F is the total cost
%P1 is the vectors of the P1 to P5
%Pl is the transmission losss