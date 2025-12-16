# Dino GD

A pixel-art styled clone of the Chrome Dino game made in Godot 4 for learning purpose

## Assets Used

Following free assets were used in the development of this game. Some of the assets have been modified to suit my purpose.

### Sprites:
- [2d Dino Character - Velociraptor](https://pixramen.itch.io/2d-dino-character-velociraptor)
- [Tiny Dinosaur](https://tonguesurgery.itch.io/tiny-dinosaur)
- [Pixel Cactus Pack](https://otr91000010.itch.io/cactus-packa)
- Dust Sprite Sheet (Sorry! I cannot find the original source 😔)
- [Mountain Dusk Parallax Background](https://ansimuz.itch.io/mountain-dusk-parallax-background)
- [Pixel Planet Generator](https://deep-fold.itch.io/pixel-planet-generator)

### Music:
- Good Night - Lofi Cozy Chill Music (FASSounds)

### Fonts (from Google Fonts):
- [Doto (Rounded)](https://fonts.google.com/specimen/Doto?query=doto)
- [Pixelify Sans](https://fonts.google.com/specimen/Pixelify+Sans)

## Synopsis

I intend to use Godot mainly for 2D games and visualization applications, as I know Unreal quite well for 3D use cases. This was a 2–3 days long learning project that I coded between classes (that I conduct). Despite being a simple replica game, it explores almost all the common concepts of 2D game development, including but not limited to, sprite handling, custom animation state-machines, physics, custom 2D shaders (I love shader programming), input handling, level/screen transition, creating day/night cycles with moving parallax background and spinning planets, save/load of game data, sound effects and music integration, etc. All of the written code is completely organic (😁 purpose was to learn and not produce AI slop). I did not create any complex enemy AI or did not get the change to use 2D particles directly (the dust is a sprite sheet), but I do not think that will hinder my knowledge of the engine, as I can code complex AIs in Unreal and know well how to create my own particle system using raw programming without an engine.

Also, do you know that the Raptor Dino is not moving forward at all? The floor and other moving components, are all translation and shader-based tricks.

## How to run

Just clone the repo, import in Godot 4.5+ (I first developed the project in 4.3 but then upgraded my engine to 4.5). You can then run, debug, and export.