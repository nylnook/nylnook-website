---
title: 'How to create responsive pictures for every screen ? Meet me at LSM !'
date: 2014-06-11 13:00
thumb: '/img/blog/icon-presentation.png'
tags:
  - geek
  - tutorials
  - teaching
---

I'm giving a conference, which will tell you more on how I'm creating this website on the picture side, at Libre Software Meeting in Montpellier, the 9th of July at 4.30pm, in the building n°6 of the second Montpellier's University.

It will probably be in french, but I may speak english too. To know more, you're welcome to read [the conference description at LSM website](https://2014.rmll.info/conference280?lang=en).

A *pitch* :   
Today, most images are seen on screen. Every monitor has a unique size, definition, ratio and even shape : As design get fluid with web, pictures start to learn to resize, to respond, to crop, to deform...

The Responsive Images Community Group (members of Google, Opera and Mozilla) just published (11th of April 2014), a specification draft for the "picture" HTML element. This element is promise to adoption, and will allow us to display the right picture to the right screen on the web.
This mean we will have to serve not only one image but several of them, for ours interconnected visitors. But, wait... we do not really have the right tools to produce theses pictures !

A first solution would be to use vector images (geometrical), which do not have a resolution, and fit all sizes. That’s a really good solution for icons for example. But for photos and illustrations (bitmap image) ?
Ok, we may be patient, and use our favourite Gimp or Photoshop program to crop each image for each dimension we need... and multiply that with the 30 pictures on our website, to spend 2 days on it... !
Otherwise, we learn some programming, we make a nice script, and batch process all our picture once... but blindly ! So, we obtain portraits crop aside of the face, or full landscapes that fit in 280 pixels.

In fact, there is another solution, coming from the video world : use a "node based" or a "node and graph", or a "flow-based programming" image processing tool. Some free and open source software based on this concept start to appear nowadays (Blender, ButtleOFX, imgflo).
There are many interests with node systems :
- Very flexible : Multiple inputs, operations and/or outputs, updated live
- Editing through history of operation (forget undo/redo)
- Non destructive editing
- Set up your workflow once, reuse to infinity
- No need to know how to write a script
- Good for a single image editing as for many (batch processing)
But :
- Not so usual, need some initial learning

To explain the mechanics, I will use my concrete case : a responsive website with illustrations and wallpapers (nylnook.com)
