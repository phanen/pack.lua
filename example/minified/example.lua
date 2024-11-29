-- An example of using modules similar to other languages
-- Yet able to package them all together for a single script

local json = require "../lib/json.lua"

print(json.decode("{\"hello\": \"World!\"}"))
