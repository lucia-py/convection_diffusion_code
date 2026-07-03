function [S,h]=build_sud(Nelem,Nnodes,triang,coord,Bloc,Cloc,Area,K,beta,tau)
S=sparse(Nnodes,Nnodes);

beta_norm=sqrt(beta(1)^2+beta(2)^2);

for iel=1:Nelem
    
    h=mesh_size(Nelem,triang,coord);

    for iloc=1:3
        iglob=triang(iel,iloc);
        si=beta(1)*Bloc(iel,iloc)+...
            beta(2)*Cloc(iel,iloc);
        
        for jloc=1:3
            jglob=triang(iel,jloc);
            sj=beta(1)*Bloc(iel,jloc)+...
                beta(2)*Cloc(iel,jloc);
            

            S(iglob,jglob)=S(iglob,jglob)+tau*h*Area(iel)*si*sj/(K*beta_norm);
        end
    end
end

end