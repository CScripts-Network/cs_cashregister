Core = exports["cs_lib"]:GetLib()

Citizen.CreateThread(function()
    for k, conf in pairs(Config.Register) do
		exports.ox_target:addBoxZone({
			coords = conf.coords,
			size = conf.size,
			rotation = conf.rotation,
			debug = conf.debug,
			options = {
				{
				onSelect = function()
					local id = GetPlayerServerId(PlayerId())
					local input = lib.inputDialog(Config.Language[Config.Locale]['cash'], {
						{type = 'input', label = Config.Language[Config.Locale]['who_to'], description = 'Id'},
						{type = 'input', label = Config.Language[Config.Locale]['bill_amount']},
					})

					if input then
						TriggerServerEvent("cs_cashregister:CheckCash", input[1], input[2], id, conf.job)
					end
						
				end,
				name = conf.name,
				groups = conf.job,
				icon = 'fa-solid fa-cube',
				label = Config.Language[Config.Locale]['invoice'],
				distance = 2
				},
			},
        })
    end
end)

function CreateRegister(coords, size, rotation, debug, name, job)
	exports.ox_target:addBoxZone({
		coords = coords,
		size = size,
		rotation = rotation,
		debug = debug,
		options = {
			{
			onSelect = function()
				local id = GetPlayerServerId(PlayerId())
				local input = lib.inputDialog(Config.Language[Config.Locale]['cash'], {
					{type = 'input', label = Config.Language[Config.Locale]['who_to'], description = 'Id'},
					{type = 'input', label = Config.Language[Config.Locale]['bill_amount']},
				})
				if input then
					TriggerServerEvent("cs_cashregister:CheckCash", input[1], input[2], id, job)
				end
			end,
			name = name,
			groups = job,
			icon = 'fa-solid fa-cube',
			label = Config.Language[Config.Locale]['invoice'],
			distance = 2
			},
		},
	})
end

RegisterNetEvent("cs_cashregister:ConfirmPayment")
AddEventHandler("cs_cashregister:ConfirmPayment", function(target, payment, id, job)
	local alert = lib.alertDialog({
		header = 'Bill',
		content = Config.Language[Config.Locale]['pay'] ..payment.."$",
		centered = true,
		cancel = true,
	})

	if alert == 'confirm' then
		TriggerServerEvent('cs_cashregister:SendBill', target, payment, id, job)
	end
end)