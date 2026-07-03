# Convection-Diffusion Code

MATLAB implementation for solving 2D convection-diffusion equations using the finite element method on triangular meshes with Dirichlet boundary conditions.

## Files

- `main_solver.m` - Main solver script
- `local_basis.m` - Compute local basis functions
- `build_stiff.m` - Assemble stiffness matrix
- `build_B.m` - Assemble convection matrix
- `build_sud.m` - Compute SUPG stabilization
- `forcing.m` - Compute forcing vector
- `imposebc.m` - Impose boundary conditions
- `mod_n.m` - Utility function
- `mesh_size.m` - Compute mesh size
- `input_data.m` - Load mesh and boundary data
