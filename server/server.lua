Core = exports["cs_lib"]:GetLib()

RegisterServerEvent('cs_cashregister:SendBill')
AddEventHandler('cs_cashregister:SendBill', function(target, payment, id, job)
    local xPlayer = Core.GetId(id)
	local xTarget = Core.GetId(target)
    local payment = tostring(payment)
    if payment ~= nil then
        Core.SubMoney(xTarget, 'bank', payment)
        Core.SocietyAddMoney(job, payment)
        Core.Notification(xPlayer.source, Config.Language[Config.Locale]['paid']..payment.."$")
        Core.Notification(xTarget.source, Config.Language[Config.Locale]['paid_target']..payment.."$")
    end
end)

RegisterServerEvent('cs_cashregister:CheckCash')
AddEventHandler('cs_cashregister:CheckCash', function(target, payment, id, job)
	local xPlayer = Core.GetId(source)
	local xTarget = Core.GetId(target)
    local item = Core.GetTotalMoney(xTarget, 'bank')
    local payment = tostring(payment)

    if item.count >= payment + 1 then 
        TriggerEvent('cs_cashregister:SendPayment', target, payment, id, job)
    else
        Core.Notification(xTarget.source, Config.Language[Config.Locale]['not_enough_cash'])
        Core.Notification(xPlayer.source, Config.Language[Config.Locale]['not_enough_cash_source'])
    end
end)

RegisterNetEvent('cs_cashregister:SendPayment')
AddEventHandler('cs_cashregister:SendPayment', function(target, payment, id, job)
	TriggerClientEvent('cs_cashregister:ConfirmPayment', target, target, payment, id, job)
end)
