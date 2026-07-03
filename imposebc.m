function [stiffmat,rhs]=imposebc(Ndir,dirnod,dirval,stiffmat,rhs,penalty)

%impose dirichlet bcs


for idir=1:Ndir
    iglob=dirnod(idir);
    stiffmat(iglob,iglob)=penalty;
    rhs(iglob)=penalty*dirval(idir);
end
end