local style = require "core.style"
local common = require "core.common"

style.background = { common.color "{{ colors.surface.default.hex }}" }  -- Docview
style.background2 = { common.color "{{ colors.surface_container.default.hex }}" } -- Treeview
style.background3 = { common.color "{{ colors.surface_container_high.default.hex }}" } -- Command view
style.text = { common.color "{{ colors.on_surface.default.hex }}" }
style.caret = { common.color "{{ colors.primary.default.hex }}" }
style.accent = { common.color "{{ colors.primary.default.hex }}" }
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = { common.color "{{ colors.surface_variant.default.hex }}" }
style.divider = { common.color "{{ colors.surface_container.default.hex }}" } -- Line between nodes
style.selection = { common.color "{{ colors.surface_container_highest.default.hex }}" }
style.line_number = { common.color "{{ colors.on_surface_variant.default.hex }}" }
style.line_number2 = { common.color "{{ colors.primary_fixed.default.hex }}" } -- With cursor
style.line_highlight = { common.color "{{ colors.surface_container_high.default.hex }}" }
style.scrollbar = { common.color "{{ colors.surface_container_high.default.hex }}" }
style.scrollbar2 = { common.color "{{ colors.surface_container_highest.default.hex }}" } -- Hovered
style.scrollbar_track = { common.color "#252529" }
style.nagbar = { common.color "#FF0000" }
style.nagbar_text = { common.color "#FFFFFF" }
style.nagbar_dim = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good = { common.color "#72b886" }
style.warn = { common.color "#FFA94D" }
style.error = { common.color "{{ colors.error.default.hex }}" }
style.modified = { common.color "#1c7c9c" }

style.syntax["normal"] = { common.color "#e1e1e6" }
style.syntax["symbol"] = { common.color "#e1e1e6" }
style.syntax["comment"] = { common.color "#676b6f" }
style.syntax["keyword"] = { common.color "#E58AC9" }  -- local function end if case
style.syntax["keyword2"] = { common.color "#F77483" } -- self int float
style.syntax["number"] = { common.color "#FFA94D" }
style.syntax["literal"] = { common.color "#FFA94D" }  -- true false nil
style.syntax["string"] = { common.color "#f7c95c" }
style.syntax["operator"] = { common.color "#93DDFA" } -- = + - / < >
style.syntax["function"] = { common.color "#93DDFA" }

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
