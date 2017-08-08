---
title: "Comment traduire Mokatori ou les grenouilles"
date: 2016-10-10 17:30
thumb: '/img/blog/comic-translation/translation-illustration.jpg'
lang_en: '/en/blog/how-to-translate-mokatori-or-frogs'
tags:
  - making of
  - bande dessinée
  - tutoriels
  - geek
---
![Translation illustration](/img/blog/comic-translation/translation-illustration.jpg)

Après plusieurs propositions généreuses, voici enfin un tutoriel pour traduire (ou corriger, adapter, parodier…) [mes BDs](/fr/bd) «&nbsp;[Mokatori](/fr/bd/mokatori-ep0-la-fin)&nbsp;» ou «&nbsp;[Le changement climatique expliqué aux grenouilles](/fr/bd/climat-grenouilles)&nbsp;» !  

C'est facile, et en fonction de votre envie et de vos possibilités de mettre la main à la pâte, il y a trois façons de rendre ces BDs polyglottes : [pour les terriens](#terriens), [pour les artistes](#artistes), et [pour les geeks](#geeks) ;)  
Bien sûr, plus vous allez loin dans votre contribution, moins ça me demande de travail !

> **Petite note légale** : si vous contribuez à la traduction de mes BDs, vous placez votre travail sous la même licence libre que la BD, la [Licence Creative Commons Attribution - Partage dans les Mêmes Conditions 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/).   

## Traduire pour les terriens <a name="terriens"></a>

![Screenshot Mokatori online translation calc](/img/blog/comic-translation/Mokatori-online-translation-calc.jpg)

C'est la façon la plus simple de proposer votre traduction ou correction, vous n'avez rien à installer sur votre ordinateur et il y a seulement trois étapes :
1. Rendez-vous sur le tableur de traduction en ligne [de Mokatori](https://ethercalc.org/mokatori-translation) ou [des Grenouilles](https://ethercalc.org/climate-frogs-translation)
2. La première colonne est descriptive (en anglais), et ensuite il y a une colonne par langue, et une case par bulle. En lisant la BD d'une part et en remplissant le tableur de l'autre, vous pouvez la traduire !    
Si vous préférez travailler hors-ligne ou sur votre tableur préféré, vous pouvez enregistrer le tableau avec la petite icône prévue à cet effet (entourée en rouge dans l'image ci-dessus), mais n'oubliez pas de copier-coller votre travail dans le tableur en ligne à la fin.
3. Envoyez-moi un mail à welcome *at* nylnook *point* com pour m'informer de votre contribution : merci beaucoup, dès que possible, je créerais une nouvelle version de la BD dans cette nouvelle traduction !

*Merci à [Ethercalc.org](https://ethercalc.org/) pour le tableur en ligne libre et anonyme ;)*

### Bonus : Traduire le site web

Si vous avez un peu plus de temps, vous pouvez aussi m'aider à traduire les mots clés du site web dans la même langue : cela marche selon la même méthode sur [ce tableur en ligne](https://ethercalc.org/nylnook-website-translation).

## Traduire pour les artistes <a name="artistes"></a>

C'est un petit peu plus compliqué, mais vous allez avoir le plaisir de mettre vos mots et vos bulles sur le dessin !

Vous allez avoir besoin :
- d'un ordinateur (pas une tablette ou un mobile)
- d'une connexion internet ADSL au moins pour ne pas vous impatienter ;)
- d'[Inkscape](https://inkscape.org/fr/), le logiciel libre et gratuit de dessin vectoriel, installé sur votre ordinateur
- de télécharger [les fichiers sources de Mokatori](https://framagit.org/nylnook/mokatori/repository/archive.zip?ref=master) ou [des Grenouilles](https://framagit.org/nylnook/climate-frogs-comic/repository/archive.zip?ref=master)
- de télécharger et d'installer [Comili, la police de caractère que j'ai créé pour mes BDs](/fr/blog/comili-une-police-libre-pour-la-bd). Il y a une deuxième police à installer pour les Grenouilles : [Lets Trace](https://fontlibrary.org/fr/font/lets-trace)
- si vous le souhaitez, vous pouvez lire [comment je fais pour créer mes BDs](/fr/blog/faire-une-bd-de-A-a-Z-avec-des-logiciels-libres), ça vous aidera à avoir une vue d'ensemble des fichiers et des étapes, mais rassurez vous, vous n'allez en faire qu'une petite partie ;)

Voilà vous êtes prêt !

La traduction elle-même se fait en 4 étapes :

### 1/ Informer les autres
Pour éviter les efforts en double, la première chose à faire est de lire les commentaires en bas de cette page : si ce n'est pas déjà pris ou déjà fait, laisser un petit commentaire pour «&nbsp;réserver&nbsp;» ce que vous avez l'intention de traduire (quel épisode et quelle langue).

### 2/ Créer un nouveau dossier pour la nouvelle langue

Je continue l'explication avec l'exemple de l'épisode 0 de Mokatori :   

Dans le dossier des fichiers sources de Mokatori, ouvrez le dossier «&nbsp;*layout*&nbsp;» (*mise en page*), puis copier la version à partir de laquelle vous voulez traduire, et coller pour créer un nouveau dossier, en le renommant avec les deux lettres de la langue de destination ([selon le standard ISO des langues](http://www.w3schools.com/tags/ref_language_codes.asp)).

Par exemple ici je copie le dossier en anglais, puis je le renomme pour la version allemande :
![Screenshot folder copy and rename](/img/blog/comic-translation/folder-copy-and-rename.jpg)

### 3/ Modifier tous les fichiers pour traduire

Dans le dossier que vous venez de créer, modifiez tous les fichiers **.svg** de votre dossier avec Inkscape :

![Screenshot Inkscape text edit](/img/blog/comic-translation/inkscape-text-edit.jpg)

Il suffit de double-cliquer sur un texte pour le modifier.

Il y 3 outils qui seront utiles :
- la flèche noire pour sélectionner un texte ou une bulle et les déplacer/transformer
- l'outil texte pour rester sur l'édition de texte
- l'outil nœuds, le deuxième, pour modifier une bulle : cliquez-glissez sur les points ou les courbes pour les transformer.

![Screenshot Inkscape tools](/img/blog/comic-translation/inkscape-tools.jpg)

Si jamais un caractère manque dans la police pour votre langue, dites-le-moi et je l'ajouterais à ma police !

N'oubliez pas de traduire également le fichier *metadata.sh* qui contient les métadonnées, utiles pour générer un ebook de la BD par exemple. C'est un simple fichier texte, que vous pouvez ouvrir et modifier avec le bloc-note de Windows, [Notepad++](https://notepad-plus-plus.org/fr/), [Gedit](https://wiki.gnome.org/Apps/Gedit), ou n'importe quel autre éditeur de texte.  

Voici un exemple avec Gedit :

![Screenshot metadata text edit](/img/blog/comic-translation/metadata-edit.jpg)

Quand votre traduction est terminée, vous pouvez vous amusez à générer un nouvel ebook en suivant [les explications que je donnes ici](/fr/blog/faire-une-bd-de-A-a-Z-avec-des-logiciels-libres), mais c'est juste pour le plaisir ;)

### 4/ M'envoyez votre traduction

Il reste une dernière étape, m'envoyer votre traduction !

![Screenshot translation zip](/img/blog/comic-translation/translation-zip.jpg)

Pour cela il faut créer une archive Zip de votre dossier (clic droit sur le dossier > compresser), qui contient donc seulement les fichiers *.svg* et le fichier *metadata.sh*. Il devrait peser moins de 500 Ko. Vous pouvez m'envoyer cette archive en pièce jointe d'un mail à welcome *at* nylnook *point* com.
Enfin n'oubliez pas de me dire comment vous nommer dans votre mail, que je vous ajoute aux crédits.

Il ne me restera qu'à générer les ebooks ou la version imprimée, et à publier votre travail, merci beaucoup !

### Bonus : Traduire le site web

Si vous avez un peu plus de temps, vous pouvez aussi m'aider à traduire ce site web dans la même langue. Vous pouvez [traduire les mots-clés comme les terriens](https://ethercalc.org/nylnook-website-translation), mais aussi copier et coller des pages du site web dans votre éditeur de texte préféré ([LibreOffice Writer](https://fr.libreoffice.org/discover/writer/) par exemple) pour le traduire et m'envoyer votre traduction par mail (dans un format ouvert comme *.odt*, *.rtf*, ou *.html* de préférence).   
Les pages à traduire en priorité sont les pages de description des BDs, et les pages fixes comme la page d'accueil, [À propos](/fr/a-propos), [Encourager](/fr/encourager) et [Suivre](/fr/suivre).

## Traduire pour les geeks <a name="geeks"></a>

![Git logo](/img/blog/comic-translation/git-logo.svg)

Traduire en étant geek, c'est faire tout comme les artistes, mais en utilisant **[git](https://git-scm.com)**, le logiciel libre de gestion de version décentralisé, ce qui va vous permettre de contribuer directement sur les fichiers sources, en gardant l'historique des contributions respectives de chacun, et sans rien casser !

Si vous vous sentez *geek*, mais que vous ne connaissez pas *git*, [vous pouvez apprendre à l'utiliser ici](https://try.github.io/), en environ un quart d'heure. [Et voici la documentaiton complète](https://git-scm.com/book/fr/v2).

Comme les artistes, vous allez avoir besoin :
- d'un ordinateur (pas une tablette ou un mobile)
- d'une connexion internet ADSL au moins pour ne pas vous impatienter ;)
- d'[Inkscape](https://inkscape.org/fr/), le logiciel libre et gratuit de dessin vectoriel, installé sur votre ordinateur
- de télécharger et d'installer [Comili, la police de caractère que j'ai créé pour mes BDs](/fr/blog/comili-une-police-libre-pour-la-bd). Il y a une deuxième police à installer pour les Grenouilles : [Lets Trace](https://fontlibrary.org/fr/font/lets-trace)
- si vous le souhaitez, vous pouvez lire [comment je fais pour créer mes BDs](/fr/blog/faire-une-bd-de-A-a-Z-avec-des-logiciels-libres), ça vous aidera à avoir une vue d'ensemble des fichiers et des étapes, mais rassurez vous, vous n'allez en faire qu'une petite partie ;)
- et bien sûr de **git**, [téléchargé](https://git-scm.com/downloads) et installé sur votre ordinateur

Il vous manque les fichiers sources de Mokatori ou des grenouilles, mais vous les clonerez via git justement.

La traduction elle-même se fait en 7 étapes :

### 1/ Informer les autres
Ce n'est parce que vous êtes geek qu'il ne faut pas communiquer ;p   
Pour éviter les efforts inutiles, la première chose à faire est de lire les commentaires en bas de cette page : si ce n'est pas déjà pris ou déjà fait, laisser un petit commentaire pour «&nbsp;réserver&nbsp;» ce que vous avez l'intention de traduire (quel épisode et quelle langue).

### 2/ Configurer votre identité dans Git et créer un compte Framagit

Ensuite il faut configurer votre identité dans Git, pour que je sache que c'est vous !

Ouvrez un terminal sur Linux, ou *Git Shell* sur Windows et Mac et tapez :
```
$ git config --global user.name Votre Nom
$ git config --global user.email votre@e-mail.com
```

Ensuite vous devrez [vous inscrire sur Framagit](https://framagit.org/users/sign_in), mais rassurer vous cela respecte votre vie privée, et vous pouvez utiliser un compte [Github](https://github.com/) ou [Gitlab](gitlab.com) existant.

Envoyez-moi ensuite un mail à welcome *at* nylnook *point* com avec votre identifiant pour que je vous ajoute à la liste des contributeurs autorisés, ou indiquez-le dans votre commentaire en bas de cette page !

### 3/ Cloner les sources

Déplacez-vous éventuellement dans un dossier de travail :
```
$ cd Mon \dossier
```
Puis cloner le dépôt git de Mokatori hébergé par [Framagit](https://framagit.org/) :
```
$ git clone https://framagit.org/nylnook/mokatori.git
```
ou celui des grenouilles :
```
$ git clone https://framagit.org/nylnook/climate-frogs-comic.git
```
Puis patienter le temps de recevoir tous les fichiers.
Pour l'exemple je continue avec l'épisode 0 de Mokatori ;)

### 4/ Créer un nouveau dossier pour la nouvelle langue

Ensuite rendez-vous dans le dossier *layout* qui contient la mise en page :
```
$ cd layout
```
puis listez les dossiers pour y voir plus clair :
```
$ ls
```
On va copier le répertoire d'une traduction (par exemple la version anglaise) vers un nouveau dossier avec [un nouveau code de langue](http://www.w3schools.com/tags/ref_language_codes.asp) (par exemple la version allemande) :
```
$ cp -r ep0\ ebook-en ep0\ ebook-de
```

### 5/ Modifier tous les fichiers pour traduire

Ensuite, désolé, il va falloir repasser en mode graphique. Enfin vous pouvez tout faire avec un éditeur de texte en ligne de commande si vous y tenez vraiment, puisque les fichiers *.svg* sont des fichiers *XML*, mais vous ne verrez pas ce que ça donne ;)  
Dans le dossier que vous venez de créer, modifiez tous les fichiers **.svg** de votre dossier avec Inkscape, en traduisant.

![Screenshot Inkscape text edit](/img/blog/comic-translation/inkscape-text-edit.jpg)

N'oubliez pas de traduire également le fichier *metadata.sh* qui contient les métadonnées, utiles pour générer un ebook de la BD par exemple. C'est un simple fichier texte, écrit en Bash sous Linux.  

Enfin n'oubliez pas non plus de modifier le fichier texte *README.md* à la racine du dossier Mokatori (et écrit [en syntaxe markdown](http://daringfireball.net/projects/markdown/syntax)), pour ajouter votre nom aux contributeurs !

Quand votre traduction est terminée, vous pouvez vous amusez à générer un nouvel ebook en suivant [les explications que je donne ici](/fr/blog/faire-une-bd-de-A-a-Z-avec-des-logiciels-libres), mais c'est juste pour le plaisir ;)

### 6/ Commit en local

Ensuite, enregistrer localement les changements que vous avez opérés, tout d'abord on vérifie les modifications :
```
$ git status
```
Si tout va bien on peut ajouter toutes les modifications à git :
```
$ git add .
```
puis faire un commit en décrivant ce que l'on a fait :
```
$ git commit -m "une description de ma traduction pour les autres"
```

### 7/ Envoyer ses modifications
On re-synchronise ensuite avec le dépôt distant au cas où d'autres aient fait des ajouts entre temps :
```
$ git pull origin master
```
S'il y a un conflit (deux personnes ont travaillés sur le même fichier) pas de panique, la plupart du temps il suffit d'accepter le *merge*, et de refaire un *commit*

et finalement on envoit ses modifications :
```
$ git push origin master
```
à ce stade là, Git va vous demander de vous identifier sur [Framagit](https://framagit.org/users/sign_in), et je recevrais vos modifications !

Il ne me restera plus qu'à publier votre version, merci beaucoup !

### Bonus : Traduire le site web

Si vous êtes geeks et si vous êtes motivés, vous pouvez aussi traduire ce site web. Il est construit avec [Docpad](http://docpad.org/), [le code source est sur git](https://framagit.org/nylnook/nylnook-website), et la méthode que j'utilise pour le traduire est expliquée en détail [dans cet article en anglais](/en/blog/docpad-i18n).

Commencer par traduire les fichiers de langues *.json* et les 6 pages principales, plus les pages des BDs, serait déjà énorme !

> Quel que soit la méthode employée, et qu'elles soient longues ou courtes, merci beaucoup pour vos traductions !

<script>
    var disqus_config = function () {
        this.page.identifier = 'unique-comic-translation-comments';
    };
</script>
