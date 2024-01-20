Config = {}
Config.Locale = 'en'

Config.Register = {
    {
		name = 'Test Shop', -- Your cash register name
        coords = vec3(74.73, -1392.12, 29.64), -- Replace x,y,z with your coordinates
        size = vec3(0.4, 0.2, 0.2),
        rotation = 12, -- heading
        debug = false, -- debug
        job = 'police' -- Job that can use the register
    },
}

Config.Language = {
	['pl'] = {
		['cash'] = 'Kasa',
		['who_to'] = 'Komu chcesz wystawić rachunek?',
		['bill_amount'] = 'Kwota',
		['invoice'] = 'Wystaw rachunek',
		['pay'] = 'Czy chcesz opłacić fakture o wysokości ',
		['paid'] = 'Obywatel opłacił zamówienie o Wysokości: ',
		['paid_target'] = 'Opłaciłeś zamówienie o Wysokości: ',
		['not_enough_cash'] = 'Nie Posiadasz Wystarczającej ilości gotówki',
		['not_enough_cash_source'] = 'Obywatel nie posiada Wystarczającej ilości Gotówki',
	},
	['en'] = {
		['cash'] = 'Cash Register',
		['who_to'] = 'Who do you want to bill to?',
		['bill_amount'] = 'Bill Amount',
		['invoice'] = 'Issue an invoice',
		['pay'] = 'Do you want to pay the invoice amount ',
		['paid'] = 'You have paid for an order amounting to: ',
		['paid_target'] = 'You have paid for an order amounting to: ',
		['not_enough_cash'] = 'You don\'t have enough cash',
		['not_enough_cash_source'] = 'The citizen does not have enough Cash',
	}
}
