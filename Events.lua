local Events = {}

function Events.extend (base)

	base['_events'] = {},

	function base:addEventListener(eventType, func)
		if type( func ) ~= "function" then return false end
		if not self._events then self._events = {} end
		if not self._events[eventType] then self._events[eventType] = {} end
		table.insert( self._events[eventType], func )
		return self
	end
	function base:removeEventListener(eventType, func)
		if type( func ) ~= "function" then return false end
		if not self._events then return false end
		table.remove( self._events[eventType], func )
		return self
	end
	function base:removeEventListeners(eventType)
		if not self._events then return end
		if not eventType then
			self._events = {}
		else
			for key, value in pairs(self._events) do
				self:removeEventListeners(key)
			end
		end
		return self
	end
	function base:dispatchEvent(params)
		if not params then return false end
		if not self._events then return false end
		-- FN.log ("Dispatching event " .. params.name .. " from " .. params.resourceName)
		local events = self._events[params.name]
		if events then
			for i = 1, #events do
				local event = events[i]
				if type( event == "function" ) then event(params) end
			end
		end
		return self
	end

	return base
end

return Events
