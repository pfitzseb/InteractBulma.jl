module InteractBulma

using Reexport
@reexport using InteractBase
using WebIO, Vue, DataStructures, CSSUtil
import InteractBase:
    filepicker,
    autocomplete,
    input, dropdown,
    checkbox,
    toggle,
    textbox,
    button,
    slider,
    togglebuttons,
    tabs,
    radiobuttons,
    radio,
    wrap,
    wdglabel,
    NativeHTML

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

function InteractBase.libraries(::Bulma)
    bulmalibs = InteractBase.isijulia() ?
        ["/pkg/InteractBulma/main.css"] :
        [
            "/pkg/InteractBulma/bulma.min.css",
            "/pkg/InteractBulma/bulma-slider.min.css",
            "/pkg/InteractBulma/bulma-switch.min.css",
            "/pkg/InteractBulma/bulma-checkradio.min.css",
        ]
    vcat("/pkg/InteractBulma/all.js", bulmalibs)
end

InteractBase.settheme!(Bulma())

InteractBase.manipulateinnercontainer(::Bulma, args...) =
    dom"div.interactbulma[style=margin-left:auto; margin-right:auto; display:block;]"(args...)

function InteractBase.manipulateoutercontainer(::Bulma, args...)
    Node(:div,
        Node(:div, className = "column interactbulma")(),
        Node(:div, args..., className = "column is-10 interactbulma"),
        Node(:div, className = "column interactbulma")(),
        className = "columns interactbulma"
    )
end

include("widgets.jl")

end # module
