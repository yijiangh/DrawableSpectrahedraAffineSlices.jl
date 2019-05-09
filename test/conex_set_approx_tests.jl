using AbstractPlotting
using Meshing: SignedDistanceField, HyperRectangle, Vec, HomogenousMesh, MarchingTetrahedra

# algebraic dual boundary of the elliptopes
f = x -> (x[1]^2*x[2]^2 + x[1]^2*x[3]^2 + x[2]^2*x[3]^2 - 2*prod(x))

sdf = SignedDistanceField(f, HyperRectangle(Vec(-1, -1, -1), Vec(2, 2, 2)),0.01)

m = HomogenousMesh(sdf, MarchingTetrahedra())

using MeshCat
vis = Visualizer()
open(vis)

setobject!(vis, m,
           MeshPhongMaterial(color=RGBA{Float32}(1, 0, 0, 0.5)))

# Makie
# mesh_scene = Scene()
# mesh!(mesh_scene, m, color=:blue)
# display(mesh_scene)
