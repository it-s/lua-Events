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
###Creating an event listener:
```lua
  object:addEventListener(identifierString, functionToExecute)
```
###Dispatching an event:
```lua
  object:dispatchEvent(params)
```
