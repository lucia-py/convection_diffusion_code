function stiffmat=build_B(Nelem,Nnodes,triang,Bloc,Cloc,Area,beta)
stiffmat=sparse(Nnodes,Nnodes);
for iel=1:Nelem
    for iloc=1:3
        iglob=triang(iel,iloc);
        for jloc=1:3
            jglob=triang(iel,jloc);
            stiffmat(iglob,jglob)=stiffmat(iglob,jglob)+...
                (Bloc(iel,jloc)*beta(1)+Cloc(iel,jloc)*beta(2))*Area(iel)/3;


        end
    end
end


end