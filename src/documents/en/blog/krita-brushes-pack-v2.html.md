---
title: "Krita Brushes Presets Pack v2"
date: 2016-09-16 14:00
thumb: '/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-art-pen.jpg'
lang_fr: '/fr/blog/pack-brosses-krita-v2'
tags:
  - download
  - graphic novel
  - making of
  - tutorials
---

![Krita icon](/website-img/icon-krita.svg)

Time for update ! I'm happy to introduce **36 brushes**  presets for digital painting I crafted for and with **[Krita 3.0.1](https://krita.org/)** , used for [my latest comic](/en/comics/mokatori-ep0-the-end/)... This is version 2.

They are free to use, under a [Creative Commons Zero License](http://creativecommons.org/publicdomain/zero/1.0/deed) !

## What's new in v2 ?

First of all, now there are 2 packs, depending on your stylus : does it support rotation additionally to pressure and tilt ?

If you have a [Wacom Art Pen](https://www.wacom.com/en-us/store/pens/art-pen) or similar, that support rotation, you will be interested by the Art Pen pack:  
[![Nylnook Art Pen Brush pack icon](/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-art-pen.jpg)](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-art.bundle)

And if you have any other Pen, you will be interested by the Generic Pen pack, which emulate rotation on some brushes:   
[![Nylnook Generic Pen Brush pack icon](/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-generic-pen.jpg)](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-gen.bundle)
Emulation is acheived with brand new Krita features : Drawing Angle Lock (introduced in 3.0), and Fuzzy Stroke (introduced in 3.0.1) !

I also :
- added 3 new brushes presets (Aboriginal Dots, Ink Power Rectangle and Clone Tool)
- updated almost every brush
- removed 2 not so interesting brushes that were no longer working
- updated textures and redo some
- and the basic brushes now use the "Greater" blending mode, which give better results when a stroke overlap another stroke, but works only on a transparent layer: if you want to use them on an opaque layer like a background, just switch the blending mode to Normal again


## Installation

Download the [Generic Pen Bundle](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-gen.bundle), or the [Art Pen Bundle](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-art.bundle).   
In Krita, go to *Settings > Manage Resources… > Import Bundle/Resource*, and make sure the bundle is in the *Active Bundles* column on the left.   
You should choose one of the bundle, and do not install or activate both of them, otherwise the Krita tagging system will be confused with brushes that are common to both packs.  

## Usage

I usually use them on a large canvas (mininimum 2K)... so theses presets may look big on a smaller canvas.

### Small Icons

![Nylnook rotation icon](/img/blog/brush-pack-v2/icon-rotation-crop.png) Brushes with a rotation icon for the Art Pen pack are meant to be used with a stylus **supporting rotation** like the [Wacom Art Pen](https://www.wacom.com/en-us/store/pens/art-pen) (the best stylus I know if you want my opinion). This allow to do thick and thin strokes, essentials for inking.

![Nylnook rotation generic icon](/img/blog/brush-pack-v2/icon-rotation-generic-crop.png) Brushes with a G with an arrow icon for "Generic rotation" are brushes with **emulated rotation** which can work with any stylus, and rely on Krita features Drawing Angle Lock and Fuzzy Stroke. Most of them are in the Generic Pen pack, but you can find two in the Art Pen pack when Fuzzy Stroke is more intersting than controlled rotation.

![Nylnook mix icon](/img/blog/brush-pack-v2/icon-mix-crop.png) Brushes with a drop icon mix there colors with the color already on the canvas... so they feel "wet".

Brushes with mixing and rotation use more computing power than other brushes, especially when they are combined with textures. Should work on any recent computer nevertheless ;)

### Naming

As Krita tagging system is sometimes capricious, every brush preset start with "Nylnook" to quickly find them. Then they are sorted by types :   

**Aboriginal Dots** : I created this one specially to mimic australian aboriginal dot painting for a specific projet. Just draw your line and the preset will paint dots along the way in this aboriginal style.  
![Aboriginal Dots presentation](/img/blog/brush-pack-v2/presentation-aboriginal.jpg)  


**Airbrush** is a textured airbrush for shading, it's more interesting with a texture ;)  
![Airbrush presentation](/img/blog/brush-pack-v2/presentation-airbrush.jpg)  


**Basic** Brushes are the simplest, and the less demanding for your computer. Slightly noising to allow soft mixing between colors. Now using the "Greater" Blending mode.   
![Basic presentation](/img/blog/brush-pack-v2/presentation-basic.jpg)  


**Block** allow to do large blocking of colors in speed painting for example. Noise and not texture to make it quicker.   
![Block presentation](/img/blog/brush-pack-v2/presentation-block.jpg)  


**Clone Tool** allow to copy part of an image on another part. Define the source spot with Ctrl+clic. With the airbrush texture for more random mixings, less repetitive.   
![Clone presentation](/img/blog/brush-pack-v2/presentation-clone.jpg)  


**Erase** : One really hard (just erase that mistake now in one stoke) and one soft with a texture for shadings.   
![Erase presentation](/img/blog/brush-pack-v2/presentation-erase.jpg)  


**Fill or Erase Shape**: for quick filling, or quick erasing of large areas with the "E" shortcut.   
![Fill or Erase Shape presentation](/img/blog/brush-pack-v2/presentation-fill-or-erase.jpg)  


**Ink**: Brushes for quick inking or details and some experiments for original inkings.   
![Ink presentation](/img/blog/brush-pack-v2/presentation-ink.jpg)  


**Ink Power**: The three best inking brushes, but they are hard to use : I recommend the Dynamic Brush tool to draw with it.   
![Ink Power presentation](/img/blog/brush-pack-v2/presentation-ink-power.jpg)  


**Paint**: Three brushes with rotation and mixing for "real" painting or watercoloring.
![Paint presentation](/img/blog/brush-pack-v2/presentation-paint.jpg)  


**Pencil**: a simple pencil for sketches, really similar to default Pencil 2B, with addtional settings for more realism   
![Pencil presentation](/img/blog/brush-pack-v2/presentation-pencil.jpg)  


**Poska**: Small markers brushes inspired by the famous [Posca](http://www.posca.com)s   
![Poska presentation](/img/blog/brush-pack-v2/presentation-poska.jpg)  


## Compatibility

Compatible with Krita **3.0.1** (not 3.0), and next point releases at least ;)

## Changelog

**September 16th 2016**: 36 brushes crafted for and with Krita 3.0.1, used for [my comics](http://nylnook.com/en/comics/)... This is version 2 !

**January 7th 2016**: 25 brushes crafted for and with Krita 2.9, used for [my comics](http://nylnook.com/en/comics/)... This is version 1 !

**April 24th 2015**: 12 brushes I craft since Krita 2.8, and finalized with Krita 2.9... They are working, but more work is needed ! This is a beta.

## License

CC-0 / Public Domain. Credit *Camille Bissuel* if needed.

## Thanks

Theses brushes are born with the inspiration of other brushes made by theses great peoples :
- [Timothée Giet](http://timotheegiet.com)
- [David Revoy](http://davidrevoy.com/)
- [Pablo Cazorla](http://www.pcazorla.com/)
- [Wolthera van Hövell](http://wolthera.info/)

## Full Sources

You can find the full sources [here on Framagit](https://framagit.org/nylnook/nylnook-krita-brushes), so each brush individually, icons, and so on...
