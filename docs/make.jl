using Documenter, DrawableSpectrahedraAffineSlices

makedocs(;
    modules=[DrawableSpectrahedraAffineSlices],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/yijiangh/DrawableSpectrahedraAffineSlices.jl/blob/{commit}{path}#L{line}",
    sitename="DrawableSpectrahedraAffineSlices.jl",
    authors="Yijiang Huang",
    assets=[],
)

deploydocs(;
    repo="github.com/yijiangh/DrawableSpectrahedraAffineSlices.jl",
)
