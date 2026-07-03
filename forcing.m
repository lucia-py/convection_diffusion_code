function rhs=forcing(Nelem,Nnodes,triang,coord,Area,source)
rhs=zeros(Nnodes,1);
for iel=1:Nelem
    for iloc=1:3
     iglob=triang(iel,iloc);
     rhs(iglob)=rhs(iglob)+source(coord(iglob,1),coord(iglob,2))*Area(iel)/3;
    end
end



end