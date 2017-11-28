#!/bin/bash

#Extrae luego el año de la maquina.
#YY=2016
MM=(01 02 03 04 05 06 07 08 09 10 11 12)
DD=(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
HH=(12 18 00 06)

#Extrae la fecha actual del sistema
YY=`date -u +%Y `
YYNext=`date -u +%Y --date='+365 day'`
d=`date -u +%d --date='-2 day'`
m=`date -u +%-m`
mes1=`date -u +%m --date='+30 day'`
mes2=`date -u +%m --date='+60 day'`
mes3=`date -u +%m --date='+90 day'`

#TOMA LA FECHA DEL MES VIGENTE
indicaMES_ORIGINAL=$((m-1))
#ES LA FECHA EN ESTE CASO DEL SEGUNDO MES.
indicaMES=$((m-1))
indicaDIA=$((d-1))
indicaDIA2=08
constante=3

cd /home/arw/cfs/01/
rm *.grb2
#DE ACA HASTA ARRIBA DEBE IR EN TODOS LOS PROGRAMAS



#BLOQUE DEL MIEMBRO UNO
#ESTA FECHA ES CON EL MES A DESCARGAR
FECHA=$YY${MM[indicaMES]}${DD[indicaDIA]}
#ESTA FECHA ES en formato YYYYMMDD(BASE DE DATO)
FLECHA2=$YY${MM[indicaMES_ORIGINAL]}${DD[indicaDIA]}${HH[2]}
#ESTA FECHA ES en formato YYYYMMDD DEL MES VIGENTE
FLECHA3=$YY${MM[indicaMES_ORIGINAL]}${DD[indicaDIA]}
Fechita=$YY${MM[indicaMES_ORIGINAL]}$d
Fechita2=$YY${MM[indicaMES_ORIGINAL]}$d${HH[2]}
let "indicaMESFin=indicaMES_ORIGINAL+4"
FECHAFinal=$YY${MM[indicaMESFin]}${DD[indicaDIA]}


echo "FECHA DE CARPETA EN EL SERVIDOR: "$FECHA
echo "FECHA DE CARPETA EN EL SERVIDOR CON BASE DE DATOS UTC: "$Fechita2
echo "FECHA DE CARPETA EN EL SERVIDOR: "$Fechita
echo "FECHA DE CARPETA EN EL SERVIDOR: "$FECHAfinal

echo "PRIMER MES DE SIMULACION: "$mes1
echo "SEGUNDO MES DE SIMULACION: "$mes2
echo "TERCER MES DE SIMULACION: "$mes3

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================
echo *************************************************Comienzo MES 1************************************
echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 01 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 02 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 03 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 04 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 05 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 06 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 07 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 08 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 09 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 10 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 11 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR PARA CUANDO EL PRIMER MES ES ENERO

if [ $[ $m ] -eq 12 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes1
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes1${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

#done
clear
echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================
echo *************************************************Comienzo MES 2************************************
echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 01 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 02 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 03 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 04 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 05 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 06 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 07 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 08 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 09 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 10 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR PARA CUANDO EL SEGUNDO MES ES ENERO

if [ $[ $m ] -eq 11 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR PARA CUANDO EL SEGUNDO MES ES FEBRERO

if [ $[ $m ] -eq 12 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes2
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes2${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================
echo *************************************************Comienzo MES 3************************************
echo ===================================================================================================
echo ===================================================================================================
echo ===================================================================================================

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 01 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 02 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 03 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 04 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 05 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 06 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 07 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 08 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR 

if [ $[ $m ] -eq 09 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YY
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YY$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR CUANDO EL TERCER MES ES ENERO DEL SIGUIENTE ANIO DEL SIGUIENTE ANIO

if [ $[ $m ] -eq 10 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR PARA CUANDO EL TERCER MES ES FEBRERO DEL SIGUIENTE ANIO

if [ $[ $m ] -eq 11 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMIENZA A VERIFICAR EL MES A DESCARGAR PARA CUANDO EL TERCER MES ES MARZO

if [ $[ $m ] -eq 12 ] ; then
echo ""
echo ""
echo "EL MES A DESCARCAR ES: " $mes3
echo "EL ANIO A DESCARGAR ES:" $YYNext
echo ""
echo ""
for t in `seq 0 30`
do
		for i in `seq 0 3`
		do
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/flxf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		wget http://nomads.ncep.noaa.gov/pub/data/nccf/com/cfs/prod/cfs/cfs.$Fechita/00/6hrly_grib_01/pgbf$YYNext$mes3${DD[t]}${HH[i]}.01.$Fechita2.grb2
		done
done

fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


echo ""
echo ""
echo ""
echo ""
echo TERMINA LA DESCARGA DEL MIEMBRO 1
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
