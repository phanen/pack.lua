-- An example of using modules similar to other languages
-- Yet able to package them all together for a single script

local json = require "modules/json"

print(json.decode("{\"hello\": \"World!\"}"))
