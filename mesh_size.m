function h=mesh_size(Nelem,triang,coord)
for iel=1:Nelem
    nodes=triang(iel,:);
    l1=coord(nodes(1),:);
    l2=coord(nodes(2),:);
    l3=coord(nodes(3),:);
    h=max([norm(l1-l2) norm(l2-l3) norm(l3-l1)]);
end
end