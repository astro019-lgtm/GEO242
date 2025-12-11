# GEO242
This is to deposit my code I create for the GEO242 final project.

### What am I doing?

I don't know.

## No, for real.

I am creating a code that will determine the deepest and shallowest I theortically can image with seismic station arrays for ambient noise tomography. This requires getting coordinates from Google Earth, plotting those points to show the array, plotting all the possible combinations of ray paths between stations, calculating the distances of those, and getting my shortest and longest distances. I then calculate the peak sensitivity, maximum sensitivity, lateral, and vertical resolutions for those to get an approximation of the limits of the array design.

## Final Project Folder

In this, you will find three other folders and a bunch of small files. These small files are relevant to my work, but are not relevant if you are using your own data set.\
\
.ipynb_checkpoints: I dunno\
Figures: Folder with figures not created with my code for the project report\
Maps: Folder with the scripts for creating the figures from the code\
Report: Folder which holds the project report files\
AshleyStroup_GEO242final-project.ipynb: this is the major file! This is what does all my calculations and runs figure scripts\
bb_pairs.txt: contains all possible stations pairs coordinates for the broadbands\
bb_row_longest.csv: contains coordinates for the two broadband stations which create the longest distance station pair\
bb_row_shortest.csv: contains coordinates for the two broadband stations which create the shortest distance station pair\
broadbands.csv: contains the coordinates for each broadband station\
broadbands.kml: file used to extract coordinates for broadbands.csv\
elevation.cpt: color file for figures create in notebook - not needed, artifact\
gmt.history: I dunno\
node_pairs.txt: contains all possible stations pairs coordinates for the nodes\
node_row_longest.csv: contains coordinates for the two node stations which create the longest distance station pair\
node_row_shortest.csv: contains coordinates for the two node stations which create the shortest distance station pair\
nodes.csv: contains the coordinates for each node station\
nodess.kml: file used to extract coordinates for nodes.csv\

## Figures

20percent.png: figure which shows the extent of the San Andreas fault system for report\
OV_seismo_map.ps.png: orignal map which shows Owens Valley seismicity for report\
stations.jpg: CalTopo map with broadbands and nodes plotted for report\

## Maps

broadband_map_friend_jup.sh: plots all broadband station pairs lines which works in jupyter notebook\
broadband_map_jup.sh: plots all broadband stations which works in jupyter notebook\
broadband_map_limit_jup.sh: plots all broadband station pairs and the longest and shortest station pairs\
elevation.cpt: color file for figures create in notebook\
gmt.history: I dunno\
nodes_map_friend_jup.sh: plots all node station pairs lines which works in jupyter notebook\
nodes_map_jup.sh: plots all node stations which works in jupyter notebook\
nodes_map_limit_jup.sh: plots all node station pairs and the longest and shortest station pairs\

## Report

Ashley_Stroup_finalproject.aux: I dunno, supporting file for the Latex one?\
Ashley_Stroup_finalproject.bbl: same as above\
Ashley_Stroup_finalproject.blg: same as above\
Ashley_Stroup_finalproject.log: same as above\
Ashley_Stroup_finalproject.pdf: the pdf file of my Latex file. This has all my figures that could not upload to the GitHub due to size\
Ashley_Stroup_finalproject.tex: the file I made!!!\
apa-good.bst: the style of citation I used\
final_project_bib.bib: my citation bibtex file\

# Tah-Dah!


