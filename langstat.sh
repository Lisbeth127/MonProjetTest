#!/bin/bash

# Ce script a ete place sous Github le 06/01/2019
# pour realiser l'activite du cours Openclassroom Git

# Vérification de la presence du parametre du fichier dictionnaire 
if [ -z $1 ] || [ ! -e $1 ]
then
        echo "erreur de syntaxe : ./langstat.sh [nomDuDico] optionnel -nbMotsDico"
        exit 1
else
        echo "traitement fichier $1"
        # On compte le nombre d'occurrences pour une lettre de l'alphabet et on l'enregistre dans statsDico.txt
        for lettre in {A..Z}
        do
            compteur=`grep $lettre $1 | wc -l`
            echo "$compteur - $lettre" >> statsDico.txt
        done

        # On trie numériquement les stats puis on affiche le résultat
        sort -nr statsDico.txt
fi


if [ $# -ge 2 ] && [ $2 = '-nbMotsDico' ]
then
  # si option -nbMotsDico, on compte le nombre de mots du dictionnaire et on l'affiche
  echo "le nombre de mot du dictionnaire est de : `cat $1 | wc -l`"
  # puis on trie numériquement les stats et on affiche le résultat
  sort -nr statsDico.txt
else
  # on trie numériquement les stats et on affiche le résultat
  sort -nr statsDico.txt
fi

# Suppression du fichier statsDico.txt
rm statsDico.txt
