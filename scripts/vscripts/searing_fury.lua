searing_fury = class({})

LinkLuaModifier("modifier_searing_fury_effect", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_searing_fury", LUA_MODIFIER_MOTION_NONE)

function searing_fury:GetIntrinsicModifierName()
    return "modifier_searing_fury"
end