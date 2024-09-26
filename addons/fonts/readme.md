# Fonts
Idk. its two new fonts. One is grafitti style, the other is stencil style. Only afterwards did i discover that `ACE_Stencil` is a thing.

![alt text](/img/readme/fonts.png)

- `shaffilastri`
- `VTKSSMASH`


## [How to use](https://community.bistudio.com/wiki/Procedural_Textures#Text)

`#(rgb,512,512,3)text(0,0,"VTKSSMASH",0.3,"#0000ff7f","#ff0000","VTKSSMASH")`

`#(rgb,512,512,3)text(0,0,"shaffilastri",0.3,"#0000ff7f","#ff0000","shaffilastri")`


### Magic of procedural textures

```sqf
if !(isNil "texture_01") then {
    private _texture = switch (player getVariable ["interpreter", false]) do { 
        case true: { '#(rgb,512,512,3)text(0,0,"shaffilastri",0.3,"#00000000","#690000","they poisioned us")' }; 
        case false: { '#(rgb,512,512,3)text(0,0,"shaffilastri",0.3,"#00000000","#690000","dsenyto us pihoie")' }; 
    }; 

    texture_01 setObjectTexture [0, _texture]; 
};
```
