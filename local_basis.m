function [Bloc,Cloc,Area]=local_basis(Nelem,triang,coord)
Bloc=zeros(Nelem,3);
Cloc=zeros(Nelem,3);
Area=zeros(Nelem,1);

for iel=1:Nelem
    nodes=triang(iel,:);
    p1=coord(nodes(1),:);
    p2=coord(nodes(2),:);
    p3=coord(nodes(3),:);

    A= [1 p1; 1 p2; 1 p3];
    detA=abs(det(A));
    Area(iel)=abs(detA)/2;

    for inod=1:3
        n1=mod_n(inod+1,3);
        n2=mod_n(inod+2,3);
        Bloc(iel,inod)=(coord(nodes(n1),2)-coord(nodes(n2),2))/detA;
        Cloc(iel,inod)=(coord(nodes(n2),1)-coord(nodes(n1),1))/detA;

    end
end

end