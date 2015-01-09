--[[
 * Events.lua
 * https://github.com/it-s/lua-Events
 * Version: 1.0.0
 *
 * Copyright 2015 Eugene Trounev [it-s]
 * Released under the freeware license
]]--

local insert = table.insert
local remove = table.remove
local ipairs = ipairs
local Events = {}

function Events.extend (base)
        
        base = base or {}
        base['_events'] = {}
        
        local function findEventListener(stack, fn)
          for i, event in ipairs(stack) do
                if event == fn then return i end
          end
          return false
        end

        function base:addEventListener(eventType, func)
                if type( func ) ~= "function" then return false end
                if not self._events then self._events = {} end
                if not self._events[eventType] then self._events[eventType] = {} end
                insert( self._events[eventType], func )
                return self
        end
        function base:removeEventListener(eventType, func)
                if type( func ) ~= "function" then return false end
                if not self._events then return false end
                if not self._events[eventType] then return false end
                local i = findEventListener(self._events[eventType], func)
                if not i then return false end
                return remove( self._events[eventType], i )
        end
        function base:removeEventListeners(eventType)
                if not self._events then return end
                if not eventType then
                        self._events = {}
                else
                        if not self._events[eventType] then return false end
                        self._events[eventType] = {}
                end
                return self
        end
        function base:dispatchEvent(eventType, params)
                if not eventType then return false end
                if not self._events then return false end
                local events = self._events[eventType]
                if events and #events > 0 then
                  for i, event in ipairs(events) do
                        if type( event == "function" ) then event(eventType, params) end
                  end
                end
                return self
        end

        return base
end

return Events
