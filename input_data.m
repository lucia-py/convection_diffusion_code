function [Nelem,Nnodes,Ndir,triang,coord,dirnod,dirval,source]=input_data(meshdir)

meshtriang=strcat(meshdir,'/mesh.dat');
meshcoord=strcat(meshdir,'/xy.dat');
meshdirnod=strcat(meshdir,'/dirnod.dat');
meshdirval=strcat(meshdir,'/dirval.dat');
%meshcontorno=strcat(meshdir,'/contorno.dat');

triang=load(meshtriang);
coord=load(meshcoord);
dirnod=load(meshdirnod);
dirval=load(meshdirval);
%contorno=load(meshcontorno);
triang=triang(:,1:3);

Nelem=size(triang,1);
Nnodes=size(coord,1);
Ndir=size(dirnod,1);

source=@(x,y) 0;


end