king_tulip = class({})

function king_tulip:OnSpellStart()
	local caster = self:GetCaster()
	local duration = 12 -- Длительность баффа в секундах

	local modifierName = "modifier_king_tulip_enrage"
	local modifier = caster:FindModifierByName(modifierName)

	if not modifier then
		modifier = caster:AddNewModifier(caster, self, modifierName, {duration = duration})
		if modifier then
			print("Модификатор успешно установлен")
		else
			print("Не удалось установить модификатор")
		end
	else
		print("Модификатор уже существует")
	end
end
