function stiffmat=build_stiff(Nelem,Nnodes,triang,Bloc,Cloc,Area,K)
stiffmat=sparse(Nnodes,Nnodes);
for iel=1:Nelem
    for iloc=1:3
        iglob=triang(iel,iloc);
        for jloc=1:3
            jglob=triang(iel,jloc);
            stiffmat(iglob,jglob)=stiffmat(iglob,jglob)+...
                (Bloc(iel,iloc)*Bloc(iel,jloc)+Cloc(iel,iloc)*Cloc(iel,jloc))*Area(iel)*K;


        end
    end
end


end