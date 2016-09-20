---
title: "Pack de brosses pour Krita v2"
date: 2016-09-16 14:00
thumb: '/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-art-pen.jpg'
tags:
  - téléchargement
  - bande dessinée
  - making of
  - tutoriels
---

![Krita icon](/website-img/icon-krita.svg)

C'est le moment pour une mise à jour ! Je suis heureux de vous présenter **36 brosses** préréglées pour la peinture numérique que j'ai créer pour et avec **[Krita 3.0.1](https://krita.org/)**, que j'ai utilisé pour [ma dernière BD](/fr/bd/mokatori-ep0-la-fin)... C'est la version 2.

Elles sont libres et gratuites, sous une [Licence Creative Commons Zero](http://creativecommons.org/publicdomain/zero/1.0/deed.fr) !

## Quoi de neuf dans la v2 ?

Tout d'abord, il y a maintenant 2 packs, en fonction de votre stylet : est-ce qu'il supporte la rotation en plus de la pression et l'inclinaison ?

Si vous avez un [Wacom Art Pen](https://www.wacom.com/en-us/store/pens/art-pen) ou équivalent, qui supporte la rotation, vous serez intéressés par le pack "Art Pen" :
[![Nylnook Art Pen Brush pack icon](/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-art-pen.jpg)](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-art.bundle)

Et si vous avez n'importe quel autre "Pen", vous serez intéressés par le pack "Generic Pen", qui émule la rotation sur une partie des brosses :
[![Nylnook Generic Pen Brush pack icon](/img/blog/brush-pack-v2/icon-nylnook-brush-pack-v2-generic-pen.jpg)](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-gen.bundle)
L'émulation est obtenue grâce à de toutes nouvelles fonctions dans Krita : "Drawing Angle Lock" (introduit dans la version 3.0), et "Fuzzy Stroke" (introduit dans la version 3.0.1) !

J'ai aussi :
- ajouté 3 nouvelles brosses ("Aboriginal Dots", "Ink Power Rectangle" et "Clone Tool")
- mis à jour presque toutes les brosses
- enlever 2 brosses qui n'étaient pas si intéressantes et qui ne marchaient plus
- mis à jour les textures et refait certaines
- et les brosses "Basic" utilisent maintenant le mode de fusion "Greater", qui donne de meilleurs résultats quand on repasse un coup de pinceau avec un autre, mais qui ne marche que sur un calque transparent : si vous voulez les utiliser sur un calque opaque comme le fond, il faut de nouveau basculer le mode de fusion à Normal


## Installation

Téléchargez le [Generic Pen Bundle](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-gen.bundle)
ou le [Art Pen Bundle](https://github.com/nylnook/nylnook-krita-brushes/releases/download/v2/nylnook-v2-art.bundle), puis dans Krita, allez dans *Paramètres > Gérer les ressources… > Importer un ensemble/une ressource*, et assurez-vous que l'ensemble (le pack) est dans la colonne « Ensembles activés » à gauche.  
Vous devriez choisir un des packs, et ne pas les installer ou les activer tous les deux, sinon le système de tags de Krita risque d'être perturbé avec les brosses qui sont communes aux deux packs.

## Usage

Je les utilise généralement sur un canevas large (minimum 2K)... Donc ces préréglages pourront paraître gros sur un canevas plus petit.

### Petites Icônes

![Nylnook rotation icon](/img/blog/brush-pack-v2/icon-rotation-crop.png) Les brosses avec une icône de rotation sont faites pour être utilisées avec un stylus **supportant la rotation** comme le [Wacom Art Pen](http://fr.shop.wacom.eu/accessoires/cintiq-21ux-dtk-2100//333) (le meilleur stylus que je connaisse si vous voulez mon avis). Cela permet de faire des pleins et des déliés, qui sont essentiels pour l'encrage.

![Nylnook rotation generic icon](/img/blog/brush-pack-v2/icon-rotation-generic-crop.png) Les brosses avec un G avec une flèche pour « rotation Générique » sont des brosses où la **rotation est émulée** pour pouvoir fonctionner avec n'importe quel stylet, et qui utilisent les fonction "Drawing Angle Lock" et "Fuzzy Stroke". La plupart sont dans le pack générique, mais vous pouvez aussi en trouver deux dans la pack Art Pen quand Fuzzy Stroke est plus intéressant que la rotation controlée.

![Icône de mixage de Nylnook](/img/blog/icon-mix-crop.png) Les brosses avec une icône de goutte mixent leurs couleurs avec la couleur déjà présente sur le canevas... donc elles ont un ressenti "mouillé".

Les brosses utilisant le mixage (mélange) de couleur et la rotation utilisent plus de puissance de calcul que les autres brosses, en particulier quand elles sont combinées à des textures. Mais elles devraient marcher sur n'importe quel ordinateur récent ;)

### Noms

**NB : Comme je ne pouvais pas les traduire, les noms sont en anglais pour être internationaux, mais vous allez voir c'est facile !**

Comme le système d'étiquetage de Krita est parfois capricieux, chaque préréglage de brosse commence par le mot « Nylnook » pour pouvoir les retrouver facilement. Ensuite ils sont triés par type :

**Aboriginal Dots** (pour **Points aborigènes**) : J'ai créé cette brosse spécialement pour imiter le sytle pointilliste aborigène australien pour un projet particulier. Il sufit de dessiner un ligne et le préréglage de brosse peindra des points tout le long dans ce style aborigène.  
![Aboriginal Dots presentation](/img/blog/brush-pack-v2/presentation-aboriginal.jpg)  

**Airbrush** (pour **Aérographe**) est un aérographe texturé pour les ombres et les nuances, c'est plus intéressant avec une texture ;)  
![Airbrush presentation](/img/blog/brush-pack-v2/presentation-airbrush.jpg)

**Basic** (pour **Basiques**) : ces brosses sont les plus simples, et les moins exigeantes pour votre ordinateur. Légèrement bruitées pour permettre un mixage doux entre les couleurs. Elles utilisent maintenant le mode de fusion "Greater".
![Basic presentation](/img/blog/brush-pack-v2/presentation-basic.jpg)  

**Block** (pour **Bloquer**) : Permet de faire de large traits rapidement, autrement dit bloquer. Avec du bruit et pas une texture pour la rendre plus rapide.
![Block presentation](/img/blog/brush-pack-v2/presentation-block.jpg)  

**Clone Tool** (pour **Outil de clonage**) : permet de copier une partie d'une image sur une autre partie. Définiseez le point source avec un Ctrl+clic. Avec la texture de l'aérographe pour un mélange plus aléatoire, moins répétitif.   
![Clone presentation](/img/blog/brush-pack-v2/presentation-clone.jpg)  

**Erase** (pour **Effacer**) : une gomme très dure (efface cette erreur maintenant en un trait), et une douce pour les détails.
![Erase presentation](/img/blog/brush-pack-v2/presentation-erase.jpg)  

**Fill or Erase Shape** (pour **Forme de remplissage ou d'effacement**) : pour remplir rapidement, ou effacer de large zones avec le raccourci clavier "E".
![Fill or Erase Shape presentation](/img/blog/brush-pack-v2/presentation-fill-or-erase.jpg)  

**Ink** (pour **Encre**) : Des brosses pour faire des encrages rapides ou des détails, et des expérimentations pour des encrages plus originaux.
![Ink presentation](/img/blog/brush-pack-v2/presentation-ink.jpg)  

**Ink Power** (pour **Encre puissante**): Les trois meilleures brosses d'encrage, mais elles sont difficiles à utiliser : je recommande l'outil Brosse dynamique pour dessiner avec.   
![Ink Power presentation](/img/blog/brush-pack-v2/presentation-ink-power.jpg)

**Paint** (pour **Peindre**) : trois brosses avec rotation et mixage pour simuler une "vraie" peinture ou un aquarellage.   
![Paint presentation](/img/blog/brush-pack-v2/presentation-paint.jpg)  

**Pencil** (pour **Crayon**) : un simple crayon pour les croquis, très proche de la brosse Pencil 2B installée par défaut, avec quelques régalges de plus pour plus de réalisme   
![Pencil presentation](/img/blog/brush-pack-v2/presentation-pencil.jpg)  

**Poska** : des brosses de petits marqueurs inspirés par les fameux [Posca](http://www.posca.com)s
![Poska presentation](/img/blog/brush-pack-v2/presentation-poska.jpg)

## Compatibilité

Compatible avec Krita **3.0.1** (pas 3.0), et les versions suivies d'un autre chiffre (comme 3.0.2) au moins ;)

## Historique des changements

**26 Septembre 2016**: 36 brosses brushes crafted créées pour et avec Krita 3.0.1, utilisées pour [mes BDs](http://nylnook.com/fr/bd/)... C'est la version 2 !

**7 janvier 2016** : 25 brosses créées pour et avec Krita 2.9, utilisées pour [mes BDs](http://nylnook.com/fr/bd/)... C'est la version 1 !

**24 avril 2015** : 12 brosses que je crée depuis Krita 2.8, et finalisées avec Krita 2.9... Elles marchent, mais il y a encore du travail ! C'est une version beta.

## Licence libre

CC-0 / Public Domain. Créditez *Camille Bissuel* si besoin.

## Remerciements

Ces brosses sont nées grâce à l'inspiration d'autres brosses faites par ces merveilleuses personnes :
- [Timothée Giet](http://timotheegiet.com)
- [David Revoy](http://davidrevoy.com/)
- [Pablo Cazorla](http://www.pcazorla.com/)
- [Wolthera van Hövell](http://wolthera.info/)

## Toutes les sources

Vous pouvez trouver toutes les sources [ici sur Framagit](https://framagit.org/nylnook/nylnook-krita-brushes), donc toutes les brosses individuellement, les icônes, et *etc*...
