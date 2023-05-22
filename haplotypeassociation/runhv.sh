#!/usr/bin/env bash


haploview="java -Xmx2000m -jar /home/kesoh/bin/Haploview.jar"

# workflow
if [ $# -lt 4 ]; then
   echo """Usage: runhv.sh [mode] [pedfile] [infofile] [chrom] [trackfile <optional>]

           mode:
             LD  --> LD stats only
             LP  --> LD Plot only
             LDP --> LD stats and LD Plot
             AT  --> Association Test only
   """
else

   mode=$1;
   ped=$2;
   info=$3;
   chrom=$4;
   track=$5;
   nperm=100000
   #nperm=$(if [ -z $5 ]; then echo $5; else echo 10000; fi)

   if [[ $(echo $mode | tr [:upper:] [:lower:]) ==  "ld" ]]; 
   then
      $haploview \
         -n \
         -pedfile ${ped} \
         -info ${info} \
         -chromosome ${chrom} \
         -dprime \
         -blockoutput GAB \
         -memory 4000 \
         -check
   elif [[ $(echo $mode | tr [:upper:] [:lower:]) == "lp" ]]; 
   then
      $haploview \
         -n \
         -pedfile ${ped} \
         -info ${info} \
         -chromosome ${chrom} \
         -compressedpng \
         -memory 4000 \
         -ldcolorscheme DEFAULT \
         -check \
         $(if [ $# -eq 5 ]; then echo "-track ${track}"; fi)
         #-track ${track}
   elif [[ $(echo $mode | tr [:upper:] [:lower:]) == "ldp" ]];
   then
      #$haploview \
      #   -n \
      #   -pedfile ${ped} \
      #   -info ${info} \
      #   -chromosome ${chrom} \
      #   -dprime \
      #   -skipcheck

      $haploview \
         -n \
         -pedfile ${ped} \
         -info ${info} \
         -chromosome ${chrom} \
         -compressedpng \
         -dprime \
         -blockoutput \
         -ldcolorscheme DEFAULT \
         -memory 4000 \
         -check \
         $(if [ $# -eq 5 ]; then echo "-track ${track}"; fi)
   elif [[ $(echo $mode | tr [:upper:] [:lower:]) == "at" ]]; 
   then
      $haploview \
         -n \
         -pedfile ${ped} \
         -info ${info} \
         -chromosome ${chrom} \
         -dprime \
         -assocCC \
         -memory 4000 \
         -check \
         -blockoutput GAB \
         -permtests ${nperm}
   else
      echo "Please specify a correct mode!!!";
      echo ""
      echo """Usage: runhv.sh [mode] [pedfile] [infofile] [chrom] [trackfile <optional>]

              mode:
                LD  --> LD stats only
                LP  --> LD Plot only
                LDP --> LD stats and LD Plot
                AT  --> Association Test only
      """
   fi
fi
