# Lua Language Server Pludo Addon

This addon aims to add Pluto support to the Lua LSP

## Installation

Here are the steps to get the plugin working. For now, since it's not finished yet, this is a temporary installation just for getting everything working.

- Create a folder in a place of your choosing. This will be where the addon is stored. Name it `LuaAddons` or something of the sort.
- Clone or download the repo, and drag the folder enclosing `config.json`, `plugins.lua`, etc. into the folder you created above. The file structure should be `LuaAddons` -> `pluto` -> `files for addon`
- Open up VSCode, and go to settings. Search for `User Third Party`, and on the sidebar filter by the extension `Lua`.
- Add to this field your `LuaAddons` folder, or whatever you named it.

With that, the addon should be installed. In order to activate it, open up a `.lua` file. Put `-- @pluto_use *` somewhere at the start of the file, then you will be asked if you want to activate the addon.

### Using pluto files

If you want to use `.pluto` open VSCode, go to Settings, and search `files.associations`. Add an item called `.pluto`, with a value of `lua`. With this, the lua extension will load for `.pluto` files.

As it stands, `.pluto` files don't ask to activate the addon unless you add `-- @pluto_use *` right now due to an issue I do not understand, so make sure you add that even though you're in a `.pluto` file.

## Modifying

To modify, open up the plugins file, or any file you are wanting to modify. Make your changes, then, to test them, you need to restart LuaLS. To do this, use the `CMD+SHIFT+P`, or the `CTRL+P` hotkey, and type search for lua restart. It should appear then. Wait for it to restart, and profit.

## Contributing

Make a pull request! Be sure to comment what your regex does, since regex is unreadable, and otherwise it'll take me a long time to decipher :(.