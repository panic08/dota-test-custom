modifier_king_tulip_enrage = class({})

function modifier_king_tulip_enrage:IsHidden()
	return false
end

function modifier_king_tulip_enrage:IsPurgable()
	return true
end

function modifier_king_tulip_enrage:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, -- Бонусный урон
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT -- Бонусная скорость передвижения
	}
end

function modifier_king_tulip_enrage:GetModifierPreAttack_BonusDamage()
	return 15
end

function modifier_king_tulip_enrage:GetModifierMoveSpeedBonus_Constant()
	return 5
end
