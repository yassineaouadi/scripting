#placer le contenu de la commande ps aux dans un fichier en triant les par utilisateur
ps aux --sort -user > utilisateurs.txt
#parser le fichier ulisateurs.txt et mettre le cotenu du premier champ de chaque ligne dans autre fichier
awk 'BEGIN { FS = " " }
    { print  $1 }             
' utilisateurs.txt  > users 
#compter les lignes redoublante ("nombres de process en cours  de chaque utilisateurs)
cat users | uniq -c > processes 
#afficher explicitement le nombre de process en cours de chaque utilisateurs
awk 'BEGIN { FS = " " }
    { print $2 " a " $1 " processus en cours" }             
' processes
# supprimer les fichier aprés affichage du resultat
rm utilisateurs.txt users processes

