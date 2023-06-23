modifier_searing_fury_effect = class({})

function modifier_searing_fury_effect:IsDebuff()
    return true
end

function modifier_searing_fury_effect:OnCreated()
    self.health_removal = {-15, -20, -30} -- Значения снятия здоровья в секунду для каждого уровня способности
    self.slow_pct = {15, 20, 25} -- Значения замедления в процентах для каждого уровня способности
    self:StartIntervalThink(1)

    local particleName = "particles/units/heroes/hero_axe/axe_beserkers_call.vpcf" -- Путь к партиклу Berserker's Call
    self.particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
end

function modifier_searing_fury_effect:OnDestroy()
    -- Уничтожение эффектов партиклов при окончании действия модификатора
    ParticleManager:DestroyParticle(self.particle, false)
    ParticleManager:ReleaseParticleIndex(self.particle)
end

function modifier_searing_fury_effect:OnIntervalThink()
    local damage = self.health_removal[self:GetAbility():GetLevel()]
    local slow_pct = self.slow_pct[self:GetAbility():GetLevel()]

    local damageTable = {
        victim = self:GetParent(),
        attacker = self:GetCaster(),
        damage = -damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self:GetAbility(),
    }
    ApplyDamage(damageTable)

    self:SetStackCount(slow_pct)
end

function modifier_searing_fury_effect:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
    }
    return funcs
end

function modifier_searing_fury_effect:GetModifierConstantHealthRegen()
    return 0
end

function modifier_searing_fury_effect:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetStackCount()
end