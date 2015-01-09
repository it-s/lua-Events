lua-Events
==========

A simple LUA class that adds ability to send and receive events to any LUA table object.

##Adding you your [existing] project
* Add the library to your git project. Clone it, or use it as a submodule:
```bash
  git submodule add git@github.com:it-s/lua-Events.git
```
##Initializing the module
* Include it into your project:
  local luaEvents = require "lua-Events.Events"
* Apply the events management system to an existing LUA object:
```lua
  local object = {
    property = "",
    ...
  }
  object = luaEvents.extend(object)
```
or provide no argumats and Events module will return an empty, event enabled object:
```lua
  local object = luaEvents.extend()
```
or use the power of LUA and create your object on the fly:
```lua
  local object = luaEvents.extend({
    property = "",
    ...
  })
```
##Using the event manager
###Creating an event listener
```lua
  object:addEventListener(identifierString, functionToExecute)
```
* #identifierString# - name of en event to watch for as String
* #functionToExecute# - a function to fire when event is called
```lua
  function fn(params){
    print (params.eventName) -- params object always has 'eventName' element containing the name of the event
  }
```
###Dispatching an event
```lua
  object:dispatchEvent(identifierString, params)
```
####Event params
```lua
  {
    name = "eventName",
    -- this element is required
    someData = ...
  }
```
###Removing an event listener
```lua
  object:removeEventListener(identifierString, functionToExecute)
```
###Remove all event listeners of type
```lua
  object:removeEventListeners(identifierString)
```
###Remove all event listeners
```lua
  object:removeEventListeners()
```
