module ScientificNotation

"""
    string(x::Real; base=10, digits=3, lower=0, upper=1, always=false)

Convert a real number `x` into a string in scientific notation, with
base `base`, number of significant digits `digits`.  `lower` and
`upper` sets the bounds (in powers of `base`) at which `x` will be
truncated.

"""
function string(x::Real; tally=0, base=10, digits=3, lower=0, upper=1, always=false)
    if float(base)^lower <= x < float(base)^upper
        return (tally != 0 || always) ? "$(round(x, digits=digits)) × $base$(superscript(tally))" : "$(round(x, digits=digits))"
    elseif x >= float(base)^upper
        string(x/base, tally=tally+1, base=base, digits=digits, lower=lower, upper=upper)
    else
        string(x*base, tally=tally-1, base=base, digits=digits, lower=lower, upper=upper)
    end
end

const SUPERSCRIPTS = Dict(
    '-' => '⁻',
    '0' => '⁰',
    '1' => '¹',
    '2' => '²',
    '3' => '³',
    '4' => '⁴',
    '5' => '⁵',
    '6' => '⁶',
    '7' => '⁷',
    '8' => '⁸',
    '9' => '⁹'
)

superscript(x::Integer) = join(map(c -> SUPERSCRIPTS[c], Base.string(x)))

end # module
