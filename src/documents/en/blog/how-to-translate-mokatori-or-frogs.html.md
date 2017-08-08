---
title: "How to translate Mokatori or the Frogs"
date: 2016-10-10 17:30
thumb: '/img/blog/comic-translation/translation-illustration.jpg'
lang_fr: '/fr/blog/comment-traduire-mokatori-ou-grenouilles'
tags:
  - making of
  - graphic novel
  - tutorials
  - geek
---
![Translation illustration](/img/blog/comic-translation/translation-illustration.jpg)

After several generous offering, here is finally a tutorial to translate (or correct, adapt, parody…) [my comics](/en/comics) "[Mokatori](/en/comics/mokatori-ep0-the-end)" or "[Climate Change Explained to Frogs](/en/comics/climate-frogs)"!

It's easy, et depending on your desire and your possibilities to participate, there is three ways to make theses comics polyglots: [for the earthlings](#earthlings), [for the artists](#artists), and [for the geeks](#geeks) ;)   
Of course, the farther you go in your contribution, the less work is left to me!

> **Small legal notice**: By contributing to translate my comics, you put your work under the same free license than the comic, the [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).   

## Translate for Earthlings <a name="earthlings"></a>

![Screenshot Mokatori online translation calc](/img/blog/comic-translation/Mokatori-online-translation-calc.jpg)

It's the easiest way to offer your translation or correction, you don't have anything to install on your computer and there is only three steps:
1. Go to the online translation spreadsheet [of Mokatori](https://ethercalc.org/mokatori-translation) or [of the Frogs](https://ethercalc.org/climate-frogs-translation)
2. The first column is descriptive, and then there is one column by language, and one cell by speech bubble. By reading the comic one hand, and filling the the spreadsheet the other hand, you can translate!   
If you wish, you can work offline or on you favorite spreadsheet software: save the spreadsheet with the small dedicated icon (surrounded by red in the picture above). But don't forget to copy and paste your work back to the online spreadsheet once done.
3. Send me an e-mail at welcome *at* nylnook *point* com to tell me you contributed: Thanks a lot, as soon as possible I'll make a new version of the comic in this new translation!

*Thanks to [Ethercalc.org](https://ethercalc.org/) for the free and anonymous online spreadsheet ;)*

### Bonus: Translate the Website

If you have a little more time, you can also help me translate the keywords of the website in the same language: It works the same way on [this online spreadsheet](https://ethercalc.org/nylnook-website-translation).


## Translate for Artists <a name="artists"></a>

It's a little more complicated, but you will have the pleasure to put your words and your bubbles on the drawing!

You will need:
- a computer (not a tablet or mobile)
- a broadband internet connection at least, not to become impatient ;)
- [Inkscape](https://inkscape.org/en/), the free and open source vector graphics editor, installed on your computer
- to download [sources files of Mokatori](https://framagit.org/nylnook/mokatori/repository/archive.zip?ref=master) or [the Frogs](https://framagit.org/nylnook/climate-frogs-comic/repository/archive.zip?ref=master)
- to download and install [Comili, the font I created for my comics](/en/blog/comili-a-libre-comic-font). There is a second font for the Frogs: [Lets Trace](https://fontlibrary.org/en/font/lets-trace)
- if you want, you can read [how I make my comics](/en/blog/making-a-comic-from-A-to-Z-with-free-software). It will help you to have an overview of the files and the steps, but don't worry, you will make only a small part ;)

Here you are ready!

Translation itself is done in 4 steps:

### 1/ Let other know

To avoid double efforts, the first thing to do is to read comments at the end of this page: if it's not already taken or done, leave a small comment to "book" what you plan to translate (which episode and which language).

### 2/ Make a new folder for the new language

I continue with the Mokatori episode 0 example:

In the source folder of Mokatori, open the *layout* folder, then copy the version you want to translate from, then paste to make a new folder, and rename it with the two letters of the target language ([according to ISO Language Codes](http://www.w3schools.com/tags/ref_language_codes.asp)).

For example here I'm copying the English folder, then I rename it to the German version:
![Screenshot folder copy and rename](/img/blog/comic-translation/folder-copy-and-rename.jpg)

### 3/ Edit all files to translate

Inside the folder you just created, edit all **.svg** files with Inkscape:

![Screenshot Inkscape text edit](/img/blog/comic-translation/inkscape-text-edit.jpg)

Just double click on a text to edit it.

3 tools will be useful:
- the black arrow to select a text or a bubble and move or transform it
- the text tool to keep editing text
- the node tool, the second one, to edit a bubble : click and drag on points or curves to transform it.

![Screenshot Inkscape tools](/img/blog/comic-translation/inkscape-tools.jpg)

If a character is missing in the font for your language, please tell me and I'll add it to my font!

Don't forget to translate the *metadata.sh* file too (containing metadatas!), useful to generate a comic ebook for example. It's a simple text file, you can open and edit it with the Windows notepad, [Notepad++](https://notepad-plus-plus.org), [Gedit](https://wiki.gnome.org/Apps/Gedit), or any other text editor.

An example with Gedit :

![Screenshot metadata text edit](/img/blog/comic-translation/metadata-edit.jpg)

When you translation is ready, you can play with generating a new ebook by following [instructions I give here](/en/blog/making-a-comic-from-A-to-Z-with-free-software), but that's just for fun ;)

### 4/ Send me you translation

One last step left, send me your translation!

![Screenshot translation zip](/img/blog/comic-translation/translation-zip.jpg)

You need to make a zip archive of your folder (right click on the folder > zip), which contain only the *.svg* files and the *metadata.sh* file. It should weight less than 500 Ko. You can send me this zip file joined to an e-mail at welcome *at* nylnook *point* com.   
Finally don't forget to tell me how to name you in your mail, so I can add you to the credits.

I'll just need to generate ebooks or the printed version, and to publish your work, thanks a lot !

### Bonus: Translate the Website

If you have a little more time, you an also help me translate this website in the same language. You can [translate keywords like the Earthling](https://ethercalc.org/nylnook-website-translation), but also copy and paste website pages in your favorite text editor (like [LibreOffice Writer](https://www.libreoffice.org/discover/writer/)) to translate, then send me your translation by e-mail (in a open format like *.odt*, *.rtf*, or *.html* preferably).  
Pages to be translated first are pages describing the comics, and static pages like the home page, [About](/en/about), [Support](/en/support) and [Follow](/en/follow).

## Translate for Geeks <a name="geeks"></a>

![Git logo](/img/blog/comic-translation/git-logo.svg)

Translating like a geek, it's doing everything like the artists, but using **[git](https://git-scm.com)**, the free and open source distributed version control system. It will allow you to contribute directly on source files, keeping the history of each one contribution, without breaking anything!

If you feel like being a *geek*, but you don't know *git*, [you can learn it here](https://try.github.io/), in approximately 15 minutes. [And here is the full documentation](https://git-scm.com/book/en/v2).

Like the artists, you will need:
- a computer (not a tablet or mobile)
- a broadband internet connection at least, not to become impatient ;)
- [Inkscape](https://inkscape.org/en/), the free and open source vector graphics editor, installed on your computer
- to download and install [Comili, the font I created for my comics](/en/blog/comili-a-libre-comic-font). There is a second font for the Frogs: [Lets Trace](https://fontlibrary.org/fr/font/lets-trace)
- if you want, you can read [how I make my comics](/en/blog/making-a-comic-from-A-to-Z-with-free-software). It will help you to have an overview of the files and the steps, but don't worry, you will make only a small part ;)
- and obviously **git**, [downloaded](https://git-scm.com/downloads) and installed on your computer.

At eh moment you are missing the sources files of Mokatori or the Frogs, but precisely you will clone it with git.

The translation itself is done in 7 steps:

### 1/ Let other know

It's not because you are a geek you shouldn't communicate ;p   
To avoid wasted efforts, the first thing to do is to read comments at the end of this page: if it's not already taken or done, leave a small comment to "book" what you plan to translate (which episode and which language).

### 2/ Configure your identity in Git and create a Framagit account

Then you have to configue your identity in Git, so I know it's you!

In a shell under Linux, or with *Git Shell* under Windows and Mac, type:

```
$ git config --global user.name Your Name
$ git config --global user.email your@e-mail.com
```

Then you must [register on Framagit](https://framagit.org/users/sign_in), but don't worry it respect your privacy, and you can use an existing [Github](https://github.com/) or [Gitlab](gitlab.com) account.

Then send me an e-mail at welcome *at* nylnook *point* with your name or pseudo on Framagit so I can add you to the authorized contributors, or mention it in the comments below!

### 3/ Clone sources

Eventually move in a working folder:
```
$ cd My \folder
```
Then clone the Mokatori git repository , hosted by [Framagit](https://framagit.org/):
```
$ git clone https://framagit.org/nylnook/mokatori.git
```
or the Frogs one:
```
$ git clone https://framagit.org/nylnook/climate-frogs-comic.git
```
Then wait until you get all the files.  
For the example, I continue with Episode 0 of Mokatori ;)

### 4/ Make a new folder for the new language

Then go to the *layout* folder:
```
$ cd layout
```
And list the files to see where you are:
```
$ ls
```
You will copy one translation folder (for example the English version) to a new folder with [a new language code](http://www.w3schools.com/tags/ref_language_codes.asp) (for example the German version):
```
$ cp -r ep0\ ebook-en ep0\ ebook-de
```

### 5/ Edit all files to translate

Then, sorry, you will have to move to graphic mode. That is to say you can do everything with a shell text editor if you wish, because *.svg* files are *XML* files, but you won't see anything ;)   
Inside the folder you just created, edit all **.svg** files with Inkscape, translating.

![Screenshot Inkscape text edit](/img/blog/comic-translation/inkscape-text-edit.jpg)

Don't forget to translate the *metadata.sh* file too (containing metadatas!), useful to generate a comic ebook for example. It's a simple text file, written in Bash under Linux.

Finally, don't forget either to edit the *README.md* file at the root of the Mokatori folder (and written in [markdown syntax](http://daringfireball.net/projects/markdown/syntax)), to add your name to contributors!

When you translation is ready, you can play with generating a new ebook by following [instructions I give here](/en/blog/making-a-comic-from-A-to-Z-with-free-software), but that's just for fun ;)

### 6/ Commit locally

Then, save your changes locally, first by checking the changes:
```
$ git status
```
If everything is ready, you can add your changes to git:
```
$ git add .
```
Then commit with a description of what you done:
```
$ git commit -m "a description of my translation for others"
```

### 7/ Send your changes

You should synchronize again with the distant repository in case others added something in the meantime:
```
$ git pull origin master
```
If there is a conflict (two peoples worked on the same file) don't panic, most of the time you just need to accept *merge* and do another *commit*.

Finally, send your changes:
```
$ git push origin master
```
At this last step, Git will ask you to sign in on [Framagit](https://framagit.org/users/sign_in), and I will receive your changes!

I will just have to publish your version, thanks a lot!

### Bonus: Translate the Website

If you're a geek and if you're motivated, you can also translate this website. It's build with [Docpad](http://docpad.org/), [the source code is on Git](https://framagit.org/nylnook/nylnook-website), and the method I use to translate it is explained in details [in this post](/en/blog/docpad-i18n).

Starting with translation of the *.json* language files and the 6 main pages, plus the comics pages, would be huge!

> Whatever the method you used, whatever it's short or long, many thanks for your translations!

<script>
    var disqus_config = function () {
        this.page.identifier = 'unique-comic-translation-comments';
    };
</script>
