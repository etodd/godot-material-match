# MaterialMatch Godot Plugin

Automatically match imported materials to existing Godot materials within a set of directories. Works with Godot 4.

## Instructions

After installing and enabling the plugin, find the `Material Directories` project setting and add the path of the directory with all your Godot material `.tres` files. The format should be exactly as follows, with no trailing slash:

```
res://MaterialDirectory
```

Then re-import your models. Any materials with matching names will be replaced with a `.tres` material from your directory of choice.
