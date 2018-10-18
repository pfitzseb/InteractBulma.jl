const _pkg_root = dirname(dirname(@__FILE__))
const _pkg_deps = joinpath(_pkg_root,"deps")
const _pkg_assets = joinpath(_pkg_root,"assets")

!isdir(_pkg_assets) && mkdir(_pkg_assets)

download("https://github.com/jgthms/bulma/releases/download/0.7.2/bulma-0.7.2.zip", joinpath(_pkg_assets, "bulma.zip"))
