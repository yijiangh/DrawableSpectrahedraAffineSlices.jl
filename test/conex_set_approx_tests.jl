using AbstractPlotting
using Meshing: SignedDistanceField, HyperRectangle, Vec, HomogenousMesh, MarchingTetrahedra

f = x -> sum(sin, 5 * x)

sdf = SignedDistanceField(f, HyperRectangle(Vec(-1, -1, -1), Vec(2, 2, 2)))

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
