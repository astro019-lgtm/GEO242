#!/bin/bash

#AStroup Lecture 5 activity
#gonna plot a bunch of shit on an Owens Valley map

#create map file
outfile='nodes_friend_map.ps'

#map bounds
xmin=-118.7
xmax=-117.7
ymin=36.1
ymax=37.7

#download and name the dem file
demfile='Maps/OV.i2.dem'

#color palette file
colpal='Maps/elevation.cpt'

#historic fault file
hisfault='Maps/Historical.kml'

#holocene fault file
holfault='Maps/LatestQuaternary.kml'

#get broadband stations
nstations='nodes.csv'

#gradient file
grad=Maps/grad_OV.i2.dem

#make color palette
gmt makecpt -Cearth -T-100/4500/100 -D > $colpal

#download the dem files
#sardem --bbox $xmin $ymin $xmax $ymax --keep-egm --data-source COP -of ENVI -ot int16 -o $demfile

#perpendicular to the grain of the landscape, determines how its illumination
#gmt grdgradient $demfile -Ggrad_$demfile -A225 -Ne0.6

#make the base map
gmt psbasemap -JM5.5i -P -R$xmin/$xmax/$ymin/$ymax -BWeSn -Bxya1f0.5 -K > $outfile

#add in lakes but I don't have any
gmt pscoast -J -R -Dh  -Gburlywood2 -Wfaint -N1/thicker,-- -N2/thin,.- -Slightblue  -O -K >> $outfile

#add elevation and hill shade
gmt grdimage -J -R $demfile -I$grad -C$colpal -O -K >> $outfile

#plot faults
gmt kml2gmt $hisfault | gmt psxy -J -R -Wthin,red -O -K >> $outfile
gmt kml2gmt $holfault | gmt psxy -J -R -Wthin,red -O -K >> $outfile

#get station coordinates
awk -F',' '{print $2,$3}' $nstations | gmt psxy -J -R -Sc0.2 -Gblue -O -K >> $outfile

#get station pairs by looping through all of them and it came out BEAUTIFUL
awk -F',' '{ x[NR]=$2; y[NR]=$3; n=NR } END{ for(i=1;i<=n;i++) for(j=i+1;j<=n;j++) print x[i],y[i] "\n" x[j],y[j] "\n" }' $nstations | gmt psxy -J -R -W0.1p,lightblue -O -K >> $outfile

#extract correct columns
#awk '{if (NR>36) print $9, $8, $21, $20, $24, $23, $26, $1}' $velfile | gmt psvelo -J -R -Se200c/1+f0+n -Gblue -Wthick -O -K >> $outfile

#add focal mechanisms to the map
#gmt psmeca $mecafile -J -R -Sm1c -O -K >> $outfile

#lets add some places
#bishop
echo -118.37 37.37 | gmt psxy -J -R -Sc0.2c -Gpink -Wthin,hotpink -O -K >> $outfile
echo -118.37 37.37 Bishop | gmt pstext -J -R -F+f7p,Helvetica+jBR -Dj0.3 -Gwhite -Wthin,hotpink -O -K >> $outfile
#lone pine
echo -118.0637 36.6063 | gmt psxy -J -R -Sc0.2c -Gpink -Wthin,hotpink -O -K >> $outfile
echo -118.0637 36.6063 Lone Pine | gmt pstext -J -R -F+f7p,Helvetica+jBL -Dj0.3 -Gwhite -Wthin,hotpink -O -K >> $outfile
#mt whitney
echo -118.2923 36.5785 | gmt psxy -J -R -St0.2c -Gpink -Wthin,hotpink -O -K >> $outfile
echo -118.2923 36.5785 Mt. Whitney | gmt pstext -J -R -F+f7p,Helvetica+jBR -Dj0.3 -Gwhite -Wthin,hotpink -O -K >> $outfile
#stovepipe wells
echo -117.15 36.61 | gmt psxy -J -R -Sc0.2c -Gpink -Wthin,hotpink -O -K >> $outfile
echo -117.15 36.61 Stovepipe Wells | gmt pstext -J -R -F+f7p,Helvetica+jBC -Dj0.3 -Gwhite -Wthin,hotpink -O -K >> $outfile
#ridgecrest
echo -117.6718 35.6205 | gmt psxy -J -R -Sc0.2c -Gpink -Wthin,hotpink -O -K >> $outfile
echo -117.6718 35.6205 Ridgecrest | gmt pstext -J -R -F+f7p,Helvetica+jBC -Dj0.3 -Gwhite -Wthin,hotpink -O -K >> $outfile

#create legend
gmt psscale -J -R -C$colpal -Dg-118.6/36.15+jBL+w4c/0.75c+v -Bpa1000f200+l"Elevation(m)" -O -K >> $outfile


#download the dem files
#sardem --bbox $xmin $ymin $xmax $ymax --keep-egm --data-source COP -of ENVI -ot int16 -o $demfile

convert -density 300 -trim $outfile $outfile.png

echo showpage >> $outfile
echo end >> $outfile
