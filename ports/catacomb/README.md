## Notes

Source: [Slayer366](https://github.com/Slayer366/CatacombSDL-hh)

Both the floppy disk and GOG versions are compatible.

If you don't own either of the Catacomb games you can get Catacomb (1989) and The Catacomb (a.k.a. Catacomb II) from:
[GOG](https://www.gog.com/en/game/catacombs_pack)

Copy all *.CA2 files into the 'ports/catacomb/' directory.

Files should be uppercase.  If game files are lowercase, the launcher will attempt to convert them to uppercase automatically.

Game files needed:
- catacomb/CGACHARS.CA2
- catacomb/CGAPICS.CA2
- catacomb/DEMO1.CA2
- catacomb/EGACHARS.CA2
- catacomb/EGAPICS.CA2
- catacomb/LEVEL1.CA2 thru catacomb/LEVEL30.CA2
- catacomb/SOUNDS.CA2

## Controls

| Button | Action |
|--|--| 
|Select|Quit|
|Start|Enter|
|A|Fire primary - hold to charge shot|
|B|Fire Bolt (req. Bolt scrolls)|
|X|Use health potion|
|Y|Answer Yes|
|L1|Hold to strafe|
|L2|Quick Save|
|R2|Quick Load|
|R1|Fire Nuke (req. Nuke scrolls)|
|Up|Move Up|
|Down|Move Down|
|Left|Move Left|
|Right|Move Right|
|Left Analog|Move (same as D-Pad)|

## Compile
```shell
git clone https://github.com/Slayer366/CatacombSDL-hh
cd CatacombSDL-hh
cmake . -DCMAKE_BUILD_TYPE=Release
make -j4
```
