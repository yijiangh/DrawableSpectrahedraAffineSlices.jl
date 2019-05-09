using Combinatorics, Polyhedra
using CDDLib

v = vrep(collect(permutations([0, 1, 2, 3])))

p4 = polyhedron(v, CDDLib.Library())

# orthogonal basis for projection hyperplane
v1 = [1, -1,  0,  0]
v2 = [1,  1, -2,  0]
v3 = [1,  1,  1, -3]

p3 = project(p4, [v1 v2 v3])

# using MeshCat
# vis = Visualizer()
# open(vis)
m = Polyhedra.Mesh(p3);
setobject!(vis, m,
           MeshPhongMaterial(color=RGBA{Float32}(1, 0, 0, 0.5)))

# using Makie
# sc = Scene()
# m = Polyhedra.Mesh(p3);
# mesh!(sc, m, color=:blue)
# display(sc)
# wireframe(m)
