modifier_searing_fury = class({})

function modifier_searing_fury:IsHidden()
    return true
end

function modifier_searing_fury:IsAura()
    return true
end

function modifier_searing_fury:GetModifierAura()
    return "modifier_searing_fury_effect"
end

function modifier_searing_fury:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_searing_fury:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

function modifier_searing_fury:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

function modifier_searing_fury:GetAuraRadius()
    return self:GetAbility():GetSpecialValueFor("aura_radius")
end