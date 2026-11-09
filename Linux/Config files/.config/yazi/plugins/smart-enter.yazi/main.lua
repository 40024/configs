--- @since 25.5.31
--- @sync entry

local function entry(self)
	local hovered = cx.active.current.hovered
	ya.emit(hovered and hovered.cha.is_dir and "enter" or "open", { hovered = true })
end

return { entry = entry }
