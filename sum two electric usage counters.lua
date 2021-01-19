return {

	on = {
	    timer = { 'every 1 minutes' }
	},
	
   logging = {
            level = domoticz.LOG_ERROR, -- LOG_DEBUG or LOG_ERROR
            marker = "PANA-Totaal: "
        },
	
	execute = function(domoticz, item)
	    
	    local PanaVerbruikS1 = domoticz.devices(143)        -- Pana verbruikS1
	    local PanaBackupS2 = domoticz.devices(144)          -- Pana backupheaterS2
	    local PanaTotaal = domoticz.devices(145)            -- Pana totaal verbruik
	    
	    PanaTotaal.updateElectricity(
            	PanaVerbruikS1.WhActual + PanaBackupS2.WhActual,
            	PanaVerbruikS1.WhTotal + PanaBackupS2.WhTotal
            )
	    
	end
	
}
