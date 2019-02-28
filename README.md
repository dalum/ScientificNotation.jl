# ScientificNotation.jl

```julia
julia> ScientificNotation.string(8)
"8.0"

julia> ScientificNotation.string(824682640)
"8.247 × 10⁸"

julia> ScientificNotation.string(0.824682640)
"8.247 × 10⁻¹"

julia> ScientificNotation.string(0.824682640, lower=-1, digits=5)
"0.82468"
```
