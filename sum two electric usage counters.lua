-- Script to sum two electric usage counters in one usage counter
-- Create dummy device in Hardware
-- Add new virtual sensor from dummy device 
-- Choose: Electric (actual + counter)
-- Write down Idx of this new virtual sensor and the IDX of the two existing counters you want to combine and these in lines 20-22

return {

	on = {
	    timer = { 'every 1 minutes' }
	},
	
   logging = {
            level = domoticz.LOG_ERROR, -- LOG_DEBUG or LOG_ERROR
            marker = "Usage-new-Total: "
        },
	
	execute = function(domoticz, item)
	    
	    local UsageS1 = domoticz.devices(143)		-- Usage counter 1|Fill in your Idx!
	    local UsageS2 = domoticz.devices(144)		-- Usage counter 2|Fill in your Idx!
	    local Usage-New-Total = domoticz.devices(145)	-- New Virtual sensor: electric|Fill in your Idx!
	    
	    Usage-New-Total.updateElectricity(
            	UsageS1.WhActual + UsageS2.WhActual,
            	Usage.WhTotal + UsageS2.WhTotal
            )
	    
	end
	
}
