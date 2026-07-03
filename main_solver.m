%% Solve a convection diff eq in 2d, triang mesh,Dirichlet bcs

%input data
meshdir='mesh';
[Nelem,Nnodes,Ndir,triang,coord,dirnod,dirval,source]=input_data(meshdir);
%decreasing values of diffusion coeff in [10^-3,1]
K=0.01;
beta=[1,3]';
tau=1;

%local basis
[Bloc,Cloc,Area]=local_basis(Nelem,triang,coord);

%stiffness matrix
stiffmat=build_stiff(Nelem,Nnodes,triang,Bloc,Cloc,Area,K);
Bmat=build_B(Nelem,Nnodes,triang,Bloc,Cloc,Area,beta);
S=build_sud(Nelem,Nnodes,triang,coord,Bloc,Cloc,Area,K,beta,tau);
H=stiffmat+Bmat;
Hdiff=stiffmat;
%compute rhs
rhs=forcing(Nelem,Nnodes,triang,coord,Area,source);

%boundary conditions
penalty=1e10;
[H,rhs]=imposebc(Ndir,dirnod,dirval,H,rhs,penalty);

%solve the system
restart=10; tol=1e-9; maxit=20;
setup.type='nofill';
setup.milu='off';
[L,U]=ilu(H,setup);
uh=gmres(H,rhs,restart,tol,maxit,L,U);
figure(1)
trisurf(triang,coord(:,1),coord(:,2),uh,'EdgeColor','none');
view(2);
axis equal tight;
colorbar;
colormap(jet);
title('FEM solution u_h');

figure(2)
trisurf(triang,coord(:,1),coord(:,2),uh);
colormap(jet);