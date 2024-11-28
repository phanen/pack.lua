# pack.lua - A Module Bundler for Lua 5.1

## Overview
**pack.lua** is a simple and efficient module bundler for Lua 5.1. It consolidates a Lua source tree into a single source file, making it easier to manage and embed Lua scripts in projects, such as C libraries.

## Features
- **Supports relative imports:** Easily handle modules using relative paths.
- **Prevents redundant evaluations:** Imported modules are evaluated only once.
- **Works well with LuaRocks and other Lua modules:** While it integrates well with LuaRocks modules, they are **not bundled** into the output.

## Usage
To use **pack.lua**, run:

```bash
pack.lua <toplevel-module>.lua
```

This generates a bundled file named `<toplevel-module>.bundle.lua` in the current directory.

## Requirements
- **Lua 5.1:** Tested and compatible with Lua 5.1.
- **New-style module system:** Only supports the newer Lua module conventions.
- **POSIX systems:** Designed to work on POSIX-compliant systems.

### Important Notes:
- **File extensions:** When using `require`, you **must** include the `.lua` file extension. Any `require` statements without `.lua` will remain unmodified in the bundled output.
- **Circular dependencies:** **pack.lua** does not detect or handle circular dependencies. If your source tree contains such dependencies, the bundling process may result in a stack overflow.

## How It Works
**pack.lua** bundles Lua source code into a single file by wrapping and consolidating the input source tree. 

### Practical Use Case:
1. **Bundle the source:** Use `pack.lua` to create a single Lua file.
2. **Compile with `luac`:** Convert the Lua source to bytecode.
3. **Embed in C/C++:** Use `xxd` to generate a C header file from the compiled bytecode. This allows direct inclusion of Lua code in C/C++ projects.

By embedding the Lua source as bytecode, you can obscure the Lua logic, making it harder to inspect the script in the final executable.

## Limitations
- **No LuaRocks module bundling:** LuaRocks modules are not included in the bundled file and must be managed separately.

---

Enjoy streamlined Lua module management with **pack.lua**!