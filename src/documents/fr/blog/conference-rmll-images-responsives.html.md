---
title: 'Comment créer des images adaptables à tous les écrans ? Retrouvez-moi aux RMLL !'
date: 2014-06-11 13:00
---
Je donnes une conférence, qui vous en dira un peu plus sur comment je créé ce site web, en particulier du coté des images, aux Rencontres Mondiales du Logiciel Libre à Montpellier le 9 juillet, à 16h30, dans le Bâtiment 6 de l'Université Montpellier II...

Pour avoir tous les détails, je vous invite à lire [la description de la conférence sur le site web des RMLL](https://2014.rmll.info/conference280).

Le *pitch* :   
Aujourd’hui, la plupart des images sont vues sur des écrans... qui ont toute sortes de tailles, de définitions, de ratios et même de formes : comme le design se fluidifie via le web, les images commencent à apprendre à s’adapter, à "s’élastifier", à se recadrer, à se déformer...

Le Responsive Images Community Group (des membres de Google, d’Opera et de Mozilla ) vient de publier (le 11 avril 2014) un brouillon de spécification pour l’élément HTML . Cet élément, en bonne voie d’adoption, nous permettra d’afficher la bonne image pour le bon écran sur le web.
Cela veut aussi dire qu’au lieu d’une image, il faudra en préparer plusieurs pour les yeux de nos visiteurs interconnectés. Mais... nous n’avons pas vraiment les outils pour produire ces images !

Une première solution serait d’utiliser des images vectorielles (géométriques), qui n’ont pas de résolution et s’adapte à toutes les tailles. C’est très bien pour des icônes par exemple. Mais pour les photos et les illustrations (les images matricielles) ?
Ok, on pourrait patiemment utiliser notre Gimp ou Photoshop favori pour recadrer chaque image pour chaque dimension dont nous avons besoin... et multiplier ça par les 30 images de notre site web, pour y passer 2 jours... !
Sinon, on apprends un peu de programmation, on se fait un joli script, et on traite toutes nos images d’un coup ... mais en aveugle ! Ainsi on se retrouve avec des portraits cadrés à coté du visage, ou des paysages entiers de 280 pixels de large.

En fait il y a une autre solution, qui vient du monde de la vidéo : utiliser un logiciel de traitement d’image "par nœuds", ou "par nœuds et graphs" ou "basé sur le flux" (flow-based programming). Des logiciels libres basés sur ce concept commencent à apparaître (Blender, ButtleOFX, imgflo).
Il y a beaucoup d’autres avantages aux systèmes de nœuds :
- c’est très souple (plusieurs entrées/sorties, mis à jour en temps réel)
- édition non destructive
- l’historique des opérations est sous nos yeux (plus besoin d’annuler/refaire)
- on définit le flux de travail une seule fois, et on le réutilise à l’infini
- on peut s’en servir pour une seule image pour en traiter des milliers à la fois
- pas besoin de savoir programmer ou scripter
mais :
- ce n’est pas très habituel, il faut un peu de temps pour apprendre à s’en servir

Pour expliquer la mécanique, j’utiliserais l’exemple de mon cas concert : un site web "responsive" d’illustrations et de fonds d’écran (nylnook.com).
