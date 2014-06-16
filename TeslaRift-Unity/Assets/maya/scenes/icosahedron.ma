//Maya ASCII 2014 scene
//Name: icosahedron.ma
//Last modified: Tue, Jun 10, 2014 08:23:10 PM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.22514831900714141 0.066208523791953813 0.58984328946465392 ;
	setAttr ".r" -type "double3" 173.06164727139915 -521.79999999998404 179.99999999999949 ;
	setAttr ".rp" -type "double3" -1.4060554562488377e-015 -1.9702053939239418e-016 
		3.5527136788005009e-015 ;
	setAttr ".rpt" -type "double3" 1.9608739141297144e-015 -6.4166809689312297e-016 
		-2.5352991581578287e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 0.63676687063463089;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.015345603227615356 0 -0.0012226998805999756 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "icos_mesh";
createNode mesh -n "icos_meshShape" -p "icos_mesh";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.51336699724197388 0.73838192224502563 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dn" yes;
createNode mesh -n "polySurfaceShape1" -p "icos_mesh";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998277053237 0.25088702887296677 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 266 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.090909094 0.17904679 0.17241475
		 0.32847381 0.0094034411 0.32847387 0.17241473 0.33996695 0.090909094 0.48939395 0.0094034327
		 0.33996695 0.81818181 0.48939395 0.73667622 0.33996695 0.89968753 0.33996695 0.73667616
		 0.32847381 0.81818181 0.17904679 0.89968753 0.32847387 0.82758528 0.17330025 0.99059653
		 0.17330025 0.909091 0.32272726 0.37303978 0.33996695 0.53605115 0.33996695 0.45454547
		 0.48939395 0.55485797 0.33996695 0.71786928 0.33996695 0.63636363 0.48939395 0.19122165
		 0.33996695 0.35423294 0.33996689 0.27272725 0.48939395 0.64576715 0.17330028 0.80877835
		 0.17330025 0.72727275 0.32272726 0.55485797 0.32847381 0.63636369 0.17904682 0.71786928
		 0.32847387 0.90909094 0.012380108 0.99059653 0.16180713 0.82758522 0.16180716 0.64576709
		 0.16180713 0.72727269 0.012380108 0.80877835 0.16180716 0.37303981 0.32847387 0.37303981
		 0.32847387 0.45454547 0.17904679 0.45454547 0.17904679 0.53605109 0.32847387 0.46394894
		 0.17330025 0.62696016 0.17330025 0.54545456 0.32272738 0.46394891 0.16180716 0.54545456
		 0.012380138 0.62696016 0.16180713 0.10031252 0.17330022 0.26332384 0.17330025 0.1818182
		 0.32272738 0.27272728 0.17904679 0.35423294 0.32847381 0.19122164 0.32847387 0.18181819
		 0.012380138 0.26332381 0.16180713 0.10031253 0.16180716 0.36363637 0.32272726 0.28213075
		 0.17330028 0.44514203 0.17330025 0.28213075 0.16180716 0.36363637 0.012380138 0.44514206
		 0.16180716 0.0094034402 0.82669985 0.0057227993 0.82195455 0.085186288 0.6762715
		 0.090909101 0.6772728 0.011445602 0.83244634 0.17241476 0.82669973 0.17037258 0.83244634
		 0.89968765 0.83819282 0.90336812 0.84293818 0.82390463 0.98862118 0.81818187 0.98761976
		 0.89764535 0.83244634 0.73667622 0.83819282 0.73871833 0.83244634 0.90336818 0.82195449
		 0.89968765 0.82669985 0.81818187 0.6772728 0.82390457 0.6762715 0.2784501 0.98862118
		 0.27272725 0.98761976 0.35423297 0.83819282 0.35791358 0.84293813 0.63636357 0.98761976
		 0.6306408 0.98862112 0.55117738 0.84293818 0.55485803 0.83819282 0.81245899 0.98862118
		 0.73299557 0.84293813 0.096631899 0.98862112 0.090909101 0.98761976 0.17241475 0.83819282
		 0.17609537 0.84293818 0.72154993 0.82195455 0.71786928 0.82669985 0.63636363 0.6772728
		 0.64208645 0.6762715 0.73667616 0.82669973 0.73299557 0.82195449 0.81245899 0.6762715
		 0.71582717 0.83244634 0.5569002 0.83244628 0.55485803 0.82669973 0.82758522 0.66003317
		 0.82390457 0.65528792 0.90336818 0.50960481 0.90909088 0.51060599 0.82758534 0.67152631
		 0.82962745 0.66577965 0.98855436 0.66577965 0.99059665 0.67152631 0.80673617 0.66577965
		 0.80877841 0.67152631 0.64576715 0.67152631 0.64780921 0.66577965 0.53605115 0.82669985
		 0.53400892 0.83244634 0.37508196 0.83244634 0.37303978 0.82669985 0.54545456 0.82095325
		 0.53973174 0.82195455 0.46026829 0.6762715 0.46394891 0.67152631 0.55117732 0.82195455
		 0.6306408 0.6762715 0.6306408 0.65528786 0.62696022 0.66003317 0.54545456 0.51060599
		 0.55117738 0.50960481 0.62491804 0.66577965 0.62696022 0.67152631 0.46599108 0.66577965
		 0.1932638 0.83244634 0.19122162 0.82669985 0.35423297 0.82669973 0.35219073 0.83244634
		 0.1760954 0.82195455 0.096631899 0.6762715 0.18754099 0.82195455 0.18181822 0.82095325
		 0.26332381 0.67152631 0.26700446 0.6762715 0.10031253 0.66003317 0.096631914 0.65528786
		 0.17609538 0.50960481 0.1818182 0.51060599 0.10031252 0.67152613 0.10235469 0.66577965
		 0.2612817 0.66577965 0.44514197 0.67152631 0.44882268 0.6762715 0.3693592 0.82195449
		 0.3636364 0.82095325 0.44309989 0.66577965 0.28213075 0.67152631 0.28417289 0.66577965
		 0.44882268 0.65528786 0.44514209 0.66003317 0.3636364 0.51060599 0.36935917 0.50960475
		 0.35791358 0.82195455 0.2784501 0.6762715 0.28213075 0.66003317 0.2784501 0.65528786
		 0.35791358 0.50960481 0.90504438 0.83244634 0.9070676 0.83615565 0.82020509 0.99540359
		 0.81615853 0.99540359 0.72929603 0.83615565 0.73131931 0.83244634 0.81615853 0.66948903
		 0.82020509 0.66948903 0.54950112 0.83244628 0.54747784 0.82873702 0.63434035 0.66948909
		 0.63838691 0.66948903 0.17979489 0.82873702 0.1777716 0.83244628 0.088885807 0.66948903
		 0.092932381 0.66948909 0.45049891 0.66577965 0.45252216 0.66948909 0.36565965 0.82873702
		 0.36161309 0.82873702 0.27475056 0.66948903 0.27677384 0.66577965 0.36161307 0.50282234
		 0.36565965 0.50282234 0.17241475 0.82669973 0.090909094 0.6772728 0.0094034411 0.82669979
		 0.090909094 0.98761988 0.17241473 0.83819288 0.0094034318 0.83819282 0.0094034327
		 0.83819288 0.73667622 0.83819288 0.81818181 0.98761988 0.89968753 0.83819288 0.81818181
		 0.6772728 0.73667616 0.82669973 0.89968753 0.82669979 0.99059653 0.67152625 0.82758528
		 0.67152625 0.909091 0.82095325 0.909091 0.82095319 0.37303975 0.83819282 0.53605121
		 0.83819282 0.53605115 0.83819288 0.37303978 0.83819288 0.45454544 0.98761976 0.45454547
		 0.98761988 0.71786928 0.83819282 0.71786928 0.83819288 0.55485797 0.83819288 0.63636363
		 0.98761988 0.19122167 0.83819282 0.35423294 0.83819282 0.19122165 0.83819288 0.27272725
		 0.98761988 0.80877835 0.67152625 0.64576715 0.67152625 0.72727281 0.82095325 0.72727275
		 0.82095319 0.63636369 0.6772728 0.55485797 0.82669973 0.71786928 0.82669979 0.99059665
		 0.66003317 0.99059653 0.66003311 0.90909094 0.51060605 0.82758522 0.66003311 0.64576715
		 0.66003317 0.72727263 0.51060599 0.72727269 0.51060605 0.64576709 0.66003311 0.80877841
		 0.66003317 0.80877835 0.66003311 0.45454544 0.6772728 0.53605109 0.82669979 0.45454547
		 0.6772728 0.37303981 0.82669979 0.62696016 0.67152625 0.46394894 0.67152625 0.54545456
		 0.82095331 0.46394891 0.66003317 0.54545456 0.51060605 0.46394891 0.66003311 0.62696016
		 0.66003311 0.26332384 0.67152625;
	setAttr ".uvst[0].uvsp[250:265]" 0.10031252 0.67152619 0.1818182 0.82095331
		 0.27272728 0.6772728 0.35423294 0.82669973 0.27272728 0.6772728 0.19122164 0.82669979
		 0.26332381 0.66003317 0.26332381 0.66003311 0.18181819 0.51060605 0.10031253 0.66003311
		 0.28213075 0.67152625 0.36363637 0.82095319 0.44514203 0.67152625 0.36363637 0.51060605
		 0.28213075 0.66003311 0.44514206 0.66003311;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 23 ".pt";
	setAttr ".pt[24]" -type "float3" 0 -3.7252903e-009 0 ;
	setAttr ".pt[25]" -type "float3" 0 -3.7252903e-009 0 ;
	setAttr ".pt[26]" -type "float3" 0 -3.7252903e-009 0 ;
	setAttr ".pt[45]" -type "float3" 0 -2.4447218e-009 0 ;
	setAttr -s 120 ".vt[0:119]"  0.0024454631 0.039300263 0.069991469 0.0024454631 -0.039300263 0.069991469
		 0.066034675 -8.3267127e-018 0.045702577 0.0039568432 -0.043257117 0.06754607 0.043257117 -0.06754607 0.0039568432
		 0.06754607 -0.0039568432 0.043257117 0.045702577 -0.066034675 5.851972e-019 0.069991469 -0.0024454631 -0.039300263
		 0.069991469 -0.0024454631 0.039300263 0.069991469 0.0024454631 -0.039300263 0.045702577 0.066034675 -5.851972e-019
		 0.069991469 0.0024454631 0.039300263 0.043257117 0.06754607 0.0039568432 0.0039568432 0.043257117 0.06754607
		 0.06754607 0.0039568432 0.043257117 -0.039300263 -0.069991469 -0.0024454631 1.6648019e-018 -0.045702577 -0.066034675
		 0.039300263 -0.069991469 -0.0024454631 0.0039568432 -0.043257117 -0.06754607 0.06754607 -0.0039568432 -0.043257117
		 0.043257117 -0.06754607 -0.0039568432 -1.6648019e-018 -0.045702577 0.066034675 -0.039300263 -0.069991469 0.0024454631
		 0.039300263 -0.069991469 0.0024454631 0.0039568432 0.043257117 -0.06754607 0.043257117 0.06754607 -0.0039568432
		 0.06754607 0.0039568432 -0.043257117 0.0024454631 -0.039300263 -0.069991469 0.0024454631 0.039300263 -0.069991469
		 0.066034675 8.3267127e-018 -0.045702577 -0.039300263 0.069991469 0.0024454631 1.6648019e-018 0.045702577 0.066034675
		 0.039300263 0.069991469 0.0024454631 -1.6648019e-018 0.045702577 -0.066034675 -0.039300263 0.069991469 -0.0024454631
		 0.039300263 0.069991469 -0.0024454631 -0.046692643 -0.072910607 -0.0042711012 -0.043257117 -0.06754607 -0.0039568432
		 -0.072910607 -0.0042711012 -0.046692643 -0.06754607 -0.0039568432 -0.043257117 -0.0039568432 -0.043257117 -0.06754607
		 -0.066034675 1.0159543e-017 -0.045702577 -0.0024454631 0.039300263 -0.069991469 -0.0024454631 -0.039300263 -0.069991469
		 -0.06754607 0.0039568432 -0.043257117 -0.043257117 0.06754607 -0.0039568432 -0.0039568432 0.043257117 -0.06754607
		 -0.0024454631 0.039300263 0.069991469 -0.066034675 -1.0159543e-017 0.045702577 -0.0024454631 -0.039300263 0.069991469
		 -0.06754607 -0.0039568432 0.043257117 -0.043257117 -0.06754607 0.0039568432 -0.0039568432 -0.043257117 0.06754607
		 -0.043257117 0.06754607 0.0039568432 -0.06754607 0.0039568432 0.043257117 -0.0039568432 0.043257117 0.06754607
		 -0.045702577 -0.066034675 -5.851972e-019 -0.069991469 -0.0024454631 0.039300263 -0.069991469 -0.0024454631 -0.039300263
		 -0.069991469 0.0024454631 0.039300263 -0.045702577 0.066034675 5.851972e-019 -0.069991469 0.0024454631 -0.039300263
		 0.072910607 0.0042711012 0.04669264 0.071279168 -9.9155753e-018 0.04933238 0.072910607 -0.0042711012 0.04669264
		 0.075550318 -0.0026396865 0.04242155 0.075550318 0.0026396867 0.04242155 0.04242155 -0.075550318 0.0026396876
		 0.042421557 -0.075550318 -0.0026396867 0.046692636 -0.072910607 -0.0042711012 0.04933238 -0.071279168 1.2196181e-019
		 0.04669264 -0.072910607 0.0042711012 0.071279168 2.6822097e-010 -0.04933238 0.072910607 0.0042711012 -0.046692636
		 0.075550318 0.0026396867 -0.04242155 0.075550318 -0.0026396869 -0.04242155 0.072910607 -0.0042711012 -0.046692636
		 0.04242155 0.075550318 -0.0026396865 0.04242155 0.075550318 0.0026396865 0.046692647 0.072910607 0.0042711012
		 0.04933238 0.071279168 2.6822097e-010 0.046692636 0.072910607 -0.0042711003 1.1115429e-019 -0.04933238 -0.071279168
		 -0.0042711012 -0.046692636 -0.072910607 -0.0026396867 -0.04242155 -0.075550318 0.0026396867 -0.04242155 -0.075550318
		 0.0042711012 -0.04669264 -0.072910607 -0.0042711012 0.046692636 -0.072910607 -1.0024159e-019 0.04933238 -0.071279168
		 0.0042711012 0.04669264 -0.072910607 0.0026396869 0.04242155 -0.075550318 -0.0026396867 0.04242155 -0.075550318
		 -0.0042711012 -0.046692647 0.072910607 -2.714661e-020 -0.04933238 0.071279168 0.0042711012 -0.04669264 0.072910607
		 0.0026396865 -0.04242155 0.075550318 -0.0026396867 -0.04242155 0.075550318 -1.3004582e-020 0.04933238 0.071279168
		 -0.0042711012 0.04669264 0.072910607 -0.0026396867 0.04242155 0.075550318 0.0026396867 0.04242155 0.075550318
		 0.0042711012 0.04669264 0.072910607 -0.072910607 0.0042711012 -0.04669264 -0.071279168 1.0171307e-017 -0.04933238
		 -0.075550318 -0.0026396867 -0.04242155 -0.075550318 0.0026396867 -0.04242155 -0.04242155 -0.075550318 -0.0026396867
		 -0.04242155 -0.075550318 0.0026396867 -0.04669264 -0.072910607 0.0042711012 -0.04933238 -0.071279168 -1.9505666e-019
		 -0.072910607 -0.0042711012 0.046692647 -0.071279168 2.6822097e-010 0.04933238 -0.072910607 0.0042711012 0.04669264
		 -0.075550318 0.0026396867 0.04242155 -0.075550318 -0.0026396867 0.04242155 -0.04242155 0.075550318 0.0026396867
		 -0.04242155 0.075550318 -0.0026396867 -0.04669264 0.072910607 -0.0042711012 -0.04933238 0.071279168 6.5442543e-020
		 -0.04669264 0.072910607 0.0042711012;
	setAttr -s 240 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 0 0 3 4 0 4 5 0 5 3 0 6 7 0 7 8 0 8 6 0
		 9 10 0 10 11 0 11 9 0 12 13 0 13 14 0 14 12 0 15 16 0 16 17 0 17 15 0 18 19 0 19 20 0
		 20 18 0 21 22 0 22 23 0 23 21 0 24 25 0 25 26 0 26 24 0 27 28 0 28 29 0 29 27 0 30 31 0
		 31 32 0 32 30 0 33 34 0 34 35 0 35 33 0 36 37 0 38 39 0 36 38 0 37 39 0 39 40 0 40 37 0
		 41 42 0 42 43 0 43 41 0 44 45 0 45 46 0 46 44 0 47 48 0 48 49 0 49 47 0 50 51 0 51 52 0
		 52 50 0 53 54 0 54 55 0 55 53 0 56 57 0 57 58 0 58 56 0 59 60 0 60 61 0 61 59 0 100 95 0
		 95 63 0 63 100 0 94 71 0 71 64 0 64 94 0 70 75 0 75 65 0 65 70 0 74 80 0 80 66 0
		 66 74 0 79 101 0 101 62 0 62 79 0 106 82 0 82 68 0 68 106 0 86 76 0 76 69 0 69 86 0
		 93 107 0 107 67 0 67 93 0 89 81 0 81 73 0 73 89 0 85 90 0 90 72 0 72 85 0 115 97 0
		 97 78 0 78 115 0 88 116 0 116 77 0 77 88 0 38 83 0 83 36 0 103 91 0 91 84 0 84 103 0
		 102 117 0 117 87 0 87 102 0 99 111 0 111 96 0 96 99 0 110 108 0 108 92 0 92 110 0
		 119 112 0 112 98 0 98 119 0 109 114 0 114 104 0 104 109 0 113 118 0 118 105 0 105 113 0
		 63 62 0 101 100 0 64 63 0 95 94 0 65 64 0 71 70 0 66 65 0 75 74 0 62 66 0 80 79 0
		 68 67 0 107 106 0 69 68 0 82 86 0 70 69 0 76 75 0 67 71 0 94 93 0 73 72 0 90 89 0
		 74 73 0 81 80 0 72 76 0 86 85 0 78 77 0 116 115 0 79 78 0 97 101 0 77 81 0 89 88 0
		 83 82 0 106 36 0 84 83 0 38 103 0 85 84 0 91 90 0 88 87 0 117 116 0 87 91 0 103 102 0
		 93 92 0 108 107 0 96 95 0 100 99 0;
	setAttr ".ed[166:239]" 92 96 0 111 110 0 98 97 0 115 119 0 99 98 0 112 111 0
		 104 38 0 36 109 0 105 104 0 114 113 0 102 105 0 118 117 0 109 108 0 110 114 0 113 112 0
		 119 118 0 100 0 0 95 1 0 63 2 0 94 3 0 71 4 0 64 5 0 70 6 0 75 7 0 65 8 0 74 9 0
		 80 10 0 66 11 0 79 12 0 101 13 0 62 14 0 106 15 0 82 16 0 68 17 0 86 18 0 76 19 0
		 69 20 0 93 21 0 107 22 0 67 23 0 89 24 0 81 25 0 73 26 0 85 27 0 90 28 0 72 29 0
		 115 30 0 97 31 0 78 32 0 88 33 0 116 34 0 77 35 0 83 40 0 103 41 0 91 42 0 84 43 0
		 102 44 0 117 45 0 87 46 0 99 47 0 111 48 0 96 49 0 110 50 0 108 51 0 92 52 0 119 53 0
		 112 54 0 98 55 0 109 56 0 114 57 0 104 58 0 113 59 0 118 60 0 105 61 0;
	setAttr -s 122 -ch 480 ".fc[0:121]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 3 3 4 5
		mu 0 3 3 4 5
		f 3 6 7 8
		mu 0 3 6 7 8
		f 3 9 10 11
		mu 0 3 9 10 11
		f 3 12 13 14
		mu 0 3 12 13 14
		f 3 15 16 17
		mu 0 3 15 16 17
		f 3 18 19 20
		mu 0 3 18 19 20
		f 3 21 22 23
		mu 0 3 21 22 23
		f 3 24 25 26
		mu 0 3 24 25 26
		f 3 27 28 29
		mu 0 3 27 28 29
		f 3 30 31 32
		mu 0 3 30 31 32
		f 3 33 34 35
		mu 0 3 33 34 35
		f 3 39 40 41
		mu 0 3 37 39 40
		f 3 42 43 44
		mu 0 3 41 42 43
		f 3 45 46 47
		mu 0 3 44 45 46
		f 3 48 49 50
		mu 0 3 47 48 49
		f 3 51 52 53
		mu 0 3 50 51 52
		f 3 54 55 56
		mu 0 3 53 54 55
		f 3 57 58 59
		mu 0 3 56 57 58
		f 3 60 61 62
		mu 0 3 59 60 61
		f 4 38 37 -40 -37
		mu 0 4 36 38 39 37
		f 4 122 -77 123 -66
		mu 0 4 62 63 64 65
		f 4 124 -65 125 -69
		mu 0 4 66 62 67 68
		f 4 126 -68 127 -72
		mu 0 4 69 70 71 72
		f 4 128 -71 129 -75
		mu 0 4 73 69 74 75
		f 4 130 -74 131 -78
		mu 0 4 76 77 78 79
		f 4 132 -86 133 -81
		mu 0 4 80 81 82 83
		f 4 134 -80 135 -84
		mu 0 4 84 85 86 87
		f 4 136 -83 137 -70
		mu 0 4 72 88 89 74
		f 4 138 -67 139 -87
		mu 0 4 90 91 92 93
		f 4 140 -92 141 -90
		mu 0 4 94 95 96 97
		f 4 142 -89 143 -73
		mu 0 4 98 99 100 78
		f 4 144 -82 145 -93
		mu 0 4 95 101 102 103
		f 4 146 -98 147 -96
		mu 0 4 104 105 106 107
		f 4 148 -95 149 -76
		mu 0 4 108 109 110 111
		f 4 150 -88 151 -99
		mu 0 4 112 113 114 115
		f 4 152 -79 153 -101
		mu 0 4 116 117 118 119
		f 4 154 -100 155 -104
		mu 0 4 120 121 122 123
		f 4 156 -103 157 -91
		mu 0 4 103 124 125 96
		f 4 158 -106 159 -97
		mu 0 4 126 127 128 129
		f 4 160 -102 161 -107
		mu 0 4 130 131 123 132
		f 4 162 -112 163 -85
		mu 0 4 133 134 135 136
		f 4 164 -64 165 -110
		mu 0 4 137 67 65 138
		f 4 166 -109 167 -113
		mu 0 4 139 140 141 142
		f 4 168 -94 169 -116
		mu 0 4 143 144 145 146
		f 4 170 -115 171 -108
		mu 0 4 147 148 149 141
		f 4 172 -39 173 -119
		mu 0 4 150 151 152 153
		f 4 174 -118 175 -122
		mu 0 4 154 150 155 156
		f 4 176 -121 177 -105
		mu 0 4 157 158 159 160
		f 4 178 -111 179 -117
		mu 0 4 153 161 162 155
		f 4 180 -114 181 -120
		mu 0 4 163 164 165 159
		f 5 -123 -125 -127 -129 -131
		mu 0 5 166 167 70 69 73
		f 5 -133 -135 -137 -128 -139
		mu 0 5 168 169 88 72 71
		f 5 -141 -143 -130 -138 -145
		mu 0 5 170 171 75 74 89
		f 5 -147 -149 -132 -144 -151
		mu 0 5 172 173 79 78 100
		f 5 -153 -155 -157 -146 -136
		mu 0 5 174 175 124 103 102
		f 5 -159 -152 -142 -158 -161
		mu 0 5 176 177 97 96 125
		f 5 -163 -140 -126 -165 -167
		mu 0 5 178 179 68 67 137
		f 5 -169 -171 -166 -124 -150
		mu 0 5 180 181 138 65 64
		f 5 -162 -156 -173 -175 -177
		mu 0 5 182 183 151 150 154
		f 5 -134 -164 -179 -174 -154
		mu 0 5 184 185 161 153 152
		f 5 -168 -172 -181 -176 -180
		mu 0 5 162 186 187 156 155
		f 5 -148 -160 -178 -182 -170
		mu 0 5 188 189 160 159 165
		f 4 63 183 -1 -183
		mu 0 4 65 67 190 191
		f 4 64 184 -2 -184
		mu 0 4 67 62 192 190
		f 4 65 182 -3 -185
		mu 0 4 62 65 191 192
		f 4 66 186 -4 -186
		mu 0 4 92 91 193 194
		f 4 67 187 -5 -187
		mu 0 4 91 195 196 193
		f 4 68 185 -6 -188
		mu 0 4 195 92 194 196
		f 4 69 189 -7 -189
		mu 0 4 72 74 197 198
		f 4 70 190 -8 -190
		mu 0 4 74 69 199 197
		f 4 71 188 -9 -191
		mu 0 4 69 72 198 199
		f 4 72 192 -10 -192
		mu 0 4 98 78 200 201
		f 4 73 193 -11 -193
		mu 0 4 78 77 202 200
		f 4 74 191 -12 -194
		mu 0 4 77 98 201 202
		f 4 75 195 -13 -195
		mu 0 4 108 111 203 204
		f 4 76 196 -14 -196
		mu 0 4 111 205 206 203
		f 4 77 194 -15 -197
		mu 0 4 205 108 204 206
		f 4 78 198 -16 -198
		mu 0 4 207 208 209 210
		f 4 79 199 -17 -199
		mu 0 4 208 211 212 209
		f 4 80 197 -18 -200
		mu 0 4 211 207 210 212
		f 4 81 201 -19 -201
		mu 0 4 87 213 214 215
		f 4 82 202 -20 -202
		mu 0 4 213 84 216 214
		f 4 83 200 -21 -203
		mu 0 4 84 87 215 216
		f 4 84 204 -22 -204
		mu 0 4 217 82 218 219
		f 4 85 205 -23 -205
		mu 0 4 82 81 220 218
		f 4 86 203 -24 -206
		mu 0 4 81 217 219 220
		f 4 87 207 -25 -207
		mu 0 4 114 113 221 222
		f 4 88 208 -26 -208
		mu 0 4 113 223 224 221
		f 4 89 206 -27 -209
		mu 0 4 223 114 222 224
		f 4 90 210 -28 -210
		mu 0 4 103 96 225 226
		f 4 91 211 -29 -211
		mu 0 4 96 95 227 225
		f 4 92 209 -30 -212
		mu 0 4 95 103 226 227
		f 4 93 213 -31 -213
		mu 0 4 107 228 229 230
		f 4 94 214 -32 -214
		mu 0 4 228 104 231 229
		f 4 95 212 -33 -215
		mu 0 4 104 107 230 231
		f 4 96 216 -34 -216
		mu 0 4 232 233 234 235
		f 4 97 217 -35 -217
		mu 0 4 233 236 237 234
		f 4 98 215 -36 -218
		mu 0 4 236 232 235 237
		f 4 99 218 -41 -38
		mu 0 4 238 116 239 240
		f 4 100 36 -42 -219
		mu 0 4 116 119 241 239
		f 4 101 220 -43 -220
		mu 0 4 123 131 242 243
		f 4 102 221 -44 -221
		mu 0 4 131 120 244 242
		f 4 103 219 -45 -222
		mu 0 4 120 123 243 244
		f 4 104 223 -46 -223
		mu 0 4 245 128 246 247
		f 4 105 224 -47 -224
		mu 0 4 128 127 248 246
		f 4 106 222 -48 -225
		mu 0 4 127 245 247 248
		f 4 107 226 -49 -226
		mu 0 4 147 141 249 250
		f 4 108 227 -50 -227
		mu 0 4 141 140 251 249
		f 4 109 225 -51 -228
		mu 0 4 140 147 250 251
		f 4 110 229 -52 -229
		mu 0 4 252 135 253 254
		f 4 111 230 -53 -230
		mu 0 4 135 134 255 253
		f 4 112 228 -54 -231
		mu 0 4 134 252 254 255
		f 4 113 232 -55 -232
		mu 0 4 146 256 257 258
		f 4 114 233 -56 -233
		mu 0 4 256 143 259 257
		f 4 115 231 -57 -234
		mu 0 4 143 146 258 259
		f 4 116 235 -58 -235
		mu 0 4 153 155 260 261
		f 4 117 236 -59 -236
		mu 0 4 155 150 262 260
		f 4 118 234 -60 -237
		mu 0 4 150 153 261 262
		f 4 119 238 -61 -238
		mu 0 4 163 159 263 264
		f 4 120 239 -62 -239
		mu 0 4 159 158 265 263
		f 4 121 237 -63 -240
		mu 0 4 158 163 264 265;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dn" yes;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n"
		+ "                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n"
		+ "            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n"
		+ "                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n"
		+ "                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n"
		+ "            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 1 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode lambert -n "ico_edges";
	setAttr ".c" -type "float3" 0.958 0.958 0.958 ;
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode lambert -n "ico_faces";
	setAttr ".c" -type "float3" 0 0 0 ;
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode hyperGraphInfo -n "nodeEditorPanel2Info";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -372.48260601843805 -486.47821708076441 ;
	setAttr ".vh" -type "double2" 1043.4145439289098 234.0972646998122 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode lambert -n "lambert4";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode polySphProj -n "polySphProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:20]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -0.0014595687389373779 -0.0014595687389373779 0 ;
	setAttr ".r" 0.14290207624435425;
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 62 ".uvtk[0:61]" -type "float2" -0.069269367 -0.4748342 -0.069269367
		 -0.03715549 -0.26630193 -0.25687838 -0.074470587 -0.012431706 -0.37489265 0.16810341
		 -0.27385795 -0.23607618 -0.39379752 0.1534875 -0.50151223 -0.24402896 -0.28608274
		 -0.24402896 -0.50151223 -0.26970759 -0.39379752 -0.66086221 -0.28608274 -0.26970759
		 -0.37489265 -0.67505616 -0.074470587 -0.49909669 -0.27385795 -0.27765739 -1.052907348
		 0.20721754 -0.72553051 0.003631507 -0.40663356 0.19352517 -0.71312445 -0.012431706
		 -0.51373696 -0.23607618 -0.41270226 0.16810341 -0.062064536 0.003631507 0.26531234
		 0.20721754 -0.38096148 0.19352517 -0.71312445 -0.49909669 -0.41270226 -0.67505616
		 -0.51373696 -0.27765739 -0.71832561 -0.03715549 -0.71832561 -0.4748342 -0.52129298
		 -0.25687838 0.26531234 -0.71311909 -0.062064536 -0.51485169 -0.38096148 -0.69972003
		 -0.72553051 -0.51485169 -1.052907348 -0.71311909 -0.40663356 -0.69972003 0.29935342
		 0.18126293 0.40328044 -0.23566777 0.60768688 -0.011948715 0.41106328 -0.25711101
		 0.6125856 -0.47510508 0.6125856 -0.036894854 0.40328044 -0.27854007 0.29935342 -0.68798178
		 0.60768688 -0.49959356 -0.054313786 -0.47510508 0.1472085 -0.25711101 -0.054313786
		 -0.036894854 0.15499139 -0.23566777 0.25891837 0.18126293 -0.049415119 -0.011948715
		 0.25891837 -0.68798178 0.15499139 -0.27854007 -0.049415119 -0.49959356 0.27913588
		 0.16639091 0.16760644 -0.24386217 0.39066532 -0.24386217 0.16760644 -0.270367 0.27913588
		 -0.67356628 0.39066532 -0.270367 0.29930186 0.18108451 0.40312111 -0.23510194;
createNode polySphProj -n "polySphProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[21:121]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".r" 0.15110063552856445;
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 135 ".uvtk";
	setAttr ".uvtk[62]" -type "float2" -0.40459499 0.23838192 ;
	setAttr ".uvtk[63]" -type "float2" -0.41307783 0.2150234 ;
	setAttr ".uvtk[64]" -type "float2" -0.18971622 -0.031177029 ;
	setAttr ".uvtk[65]" -type "float2" -0.18412721 -0.0039492417 ;
	setAttr ".uvtk[66]" -type "float2" -0.41307783 0.26174024 ;
	setAttr ".uvtk[67]" -type "float2" -0.18412721 0.48071307 ;
	setAttr ".uvtk[68]" -type "float2" -0.18971622 0.50794089 ;
	setAttr ".uvtk[69]" -type "float2" -0.42681417 0.2528148 ;
	setAttr ".uvtk[70]" -type "float2" -0.52642804 0.7119363 ;
	setAttr ".uvtk[71]" -type "float2" -0.54804158 0.69586807 ;
	setAttr ".uvtk[72]" -type "float2" -0.42681417 0.22394931 ;
	setAttr ".uvtk[73]" -type "float2" -0.66926897 0.2528148 ;
	setAttr ".uvtk[74]" -type "float2" -0.66926897 0.22394931 ;
	setAttr ".uvtk[75]" -type "float2" -0.54804158 -0.21910429 ;
	setAttr ".uvtk[76]" -type "float2" -0.52642804 -0.23517245 ;
	setAttr ".uvtk[77]" -type "float2" -0.53331685 0.73991567 ;
	setAttr ".uvtk[78]" -type "float2" 0.18161291 0.73991567 ;
	setAttr ".uvtk[79]" -type "float2" 0.21106261 0.73991567 ;
	setAttr ".uvtk[80]" -type "float2" -0.56965542 0.71193635 ;
	setAttr ".uvtk[81]" -type "float2" 0.5685277 0.52527523 ;
	setAttr ".uvtk[82]" -type "float2" -0.90636712 0.50794089 ;
	setAttr ".uvtk[83]" -type "float2" -0.68300527 0.26174024 ;
	setAttr ".uvtk[84]" -type "float2" -0.17585182 0.52527523 ;
	setAttr ".uvtk[85]" -type "float2" -0.68300527 0.2150234 ;
	setAttr ".uvtk[86]" -type "float2" -0.69148839 0.23838192 ;
	setAttr ".uvtk[87]" -type "float2" -0.91195613 -0.0039492417 ;
	setAttr ".uvtk[88]" -type "float2" -0.90636712 -0.031177029 ;
	setAttr ".uvtk[89]" -type "float2" -0.56965542 -0.23517245 ;
	setAttr ".uvtk[90]" -type "float2" -0.91195613 0.48071307 ;
	setAttr ".uvtk[91]" -type "float2" -0.53331685 -0.26315176 ;
	setAttr ".uvtk[92]" -type "float2" 0.21106261 -0.26315176 ;
	setAttr ".uvtk[93]" -type "float2" 0.18161291 -0.26315176 ;
	setAttr ".uvtk[94]" -type "float2" -0.17585182 -0.048511378 ;
	setAttr ".uvtk[95]" -type "float2" 0.5685277 -0.048511378 ;
	setAttr ".uvtk[96]" -type "float2" 0.55466324 0.50794089 ;
	setAttr ".uvtk[97]" -type "float2" 0.21795112 0.7119363 ;
	setAttr ".uvtk[98]" -type "float2" 0.56025225 0.48071307 ;
	setAttr ".uvtk[99]" -type "float2" 0.33130172 0.26174024 ;
	setAttr ".uvtk[100]" -type "float2" 0.33978447 0.23838192 ;
	setAttr ".uvtk[101]" -type "float2" 0.56025225 -0.0039492417 ;
	setAttr ".uvtk[102]" -type "float2" 0.55466324 -0.031177029 ;
	setAttr ".uvtk[103]" -type "float2" 0.21795112 -0.23517245 ;
	setAttr ".uvtk[104]" -type "float2" 0.33130172 0.2150234 ;
	setAttr ".uvtk[105]" -type "float2" -0.16198775 0.50794089 ;
	setAttr ".uvtk[106]" -type "float2" 0.17472407 0.7119363 ;
	setAttr ".uvtk[107]" -type "float2" -0.1675767 0.48071307 ;
	setAttr ".uvtk[108]" -type "float2" -0.1675767 -0.0039492417 ;
	setAttr ".uvtk[109]" -type "float2" 0.052891042 0.23838192 ;
	setAttr ".uvtk[110]" -type "float2" 0.061374094 0.26174024 ;
	setAttr ".uvtk[111]" -type "float2" -0.16198775 -0.031177029 ;
	setAttr ".uvtk[112]" -type "float2" 0.17472407 -0.23517245 ;
	setAttr ".uvtk[113]" -type "float2" 0.061374124 0.2150234 ;
	setAttr ".uvtk[114]" -type "float2" 0.31756526 0.2528148 ;
	setAttr ".uvtk[115]" -type "float2" 0.19633794 0.69586807 ;
	setAttr ".uvtk[116]" -type "float2" 0.31756526 0.22394931 ;
	setAttr ".uvtk[117]" -type "float2" 0.075110555 0.2528148 ;
	setAttr ".uvtk[118]" -type "float2" 0.075110555 0.22394931 ;
	setAttr ".uvtk[119]" -type "float2" 0.19633794 -0.21910429 ;
	setAttr ".uvtk[120]" -type "float2" -0.18412721 0.48071313 ;
	setAttr ".uvtk[121]" -type "float2" -0.18412721 -0.0039493013 ;
	setAttr ".uvtk[122]" -type "float2" -0.40459523 0.23838192 ;
	setAttr ".uvtk[123]" -type "float2" -0.52642804 0.71193647 ;
	setAttr ".uvtk[124]" -type "float2" -0.18971616 0.50794077 ;
	setAttr ".uvtk[125]" -type "float2" -0.41307783 0.26174021 ;
	setAttr ".uvtk[126]" -type "float2" -0.66926897 0.2528148 ;
	setAttr ".uvtk[127]" -type "float2" -0.54804158 0.69586837 ;
	setAttr ".uvtk[128]" -type "float2" -0.42681444 0.2528148 ;
	setAttr ".uvtk[129]" -type "float2" -0.54804158 -0.21910459 ;
	setAttr ".uvtk[130]" -type "float2" -0.66926897 0.22394931 ;
	setAttr ".uvtk[131]" -type "float2" -0.42681444 0.22394931 ;
	setAttr ".uvtk[132]" -type "float2" -0.18971616 -0.03117691 ;
	setAttr ".uvtk[133]" -type "float2" -0.52642804 -0.23517269 ;
	setAttr ".uvtk[134]" -type "float2" -0.41307783 0.21502346 ;
	setAttr ".uvtk[135]" -type "float2" 0.5685277 0.52527469 ;
	setAttr ".uvtk[136]" -type "float2" 0.21106261 0.73991549 ;
	setAttr ".uvtk[137]" -type "float2" -0.56276655 0.73991549 ;
	setAttr ".uvtk[138]" -type "float2" -0.68300515 0.26174021 ;
	setAttr ".uvtk[139]" -type "float2" -0.90636688 0.50794077 ;
	setAttr ".uvtk[140]" -type "float2" -0.56965542 0.71193647 ;
	setAttr ".uvtk[141]" -type "float2" 0.18161294 0.73991549 ;
	setAttr ".uvtk[142]" -type "float2" -0.17585182 0.52527469 ;
	setAttr ".uvtk[143]" -type "float2" -0.53331685 0.73991549 ;
	setAttr ".uvtk[144]" -type "float2" -0.56965542 -0.23517269 ;
	setAttr ".uvtk[145]" -type "float2" -0.90636688 -0.03117685 ;
	setAttr ".uvtk[146]" -type "float2" -0.68300515 0.21502346 ;
	setAttr ".uvtk[147]" -type "float2" -0.91195613 -0.0039493013 ;
	setAttr ".uvtk[148]" -type "float2" -0.91195613 0.48071313 ;
	setAttr ".uvtk[149]" -type "float2" -0.69148815 0.23838192 ;
	setAttr ".uvtk[150]" -type "float2" -0.17585182 -0.048510902 ;
	setAttr ".uvtk[151]" -type "float2" 0.18161294 -0.26315165 ;
	setAttr ".uvtk[152]" -type "float2" -0.53331685 -0.26315165 ;
	setAttr ".uvtk[153]" -type "float2" 0.21106261 -0.26315165 ;
	setAttr ".uvtk[154]" -type "float2" 0.5685277 -0.048510902 ;
	setAttr ".uvtk[155]" -type "float2" -0.56276655 -0.26315165 ;
	setAttr ".uvtk[156]" -type "float2" 0.5546633 0.50794077 ;
	setAttr ".uvtk[157]" -type "float2" 0.3313016 0.26174021 ;
	setAttr ".uvtk[158]" -type "float2" 0.21795112 0.71193647 ;
	setAttr ".uvtk[159]" -type "float2" 0.56025225 -0.0039493013 ;
	setAttr ".uvtk[160]" -type "float2" 0.33978423 0.23838192 ;
	setAttr ".uvtk[161]" -type "float2" 0.56025225 0.48071313 ;
	setAttr ".uvtk[162]" -type "float2" 0.21795112 -0.23517269 ;
	setAttr ".uvtk[163]" -type "float2" 0.3313016 0.21502346 ;
	setAttr ".uvtk[164]" -type "float2" 0.5546633 -0.03117691 ;
	setAttr ".uvtk[165]" -type "float2" 0.05289134 0.23838192 ;
	setAttr ".uvtk[166]" -type "float2" -0.1675767 -0.0039493013 ;
	setAttr ".uvtk[167]" -type "float2" -0.1675767 0.48071313 ;
	setAttr ".uvtk[168]" -type "float2" 0.1747241 0.71193647 ;
	setAttr ".uvtk[169]" -type "float2" 0.061374184 0.26174021 ;
	setAttr ".uvtk[170]" -type "float2" -0.16198775 0.50794077 ;
	setAttr ".uvtk[171]" -type "float2" 0.061374184 0.21502346 ;
	setAttr ".uvtk[172]" -type "float2" 0.1747241 -0.23517269 ;
	setAttr ".uvtk[173]" -type "float2" -0.16198775 -0.03117691 ;
	setAttr ".uvtk[174]" -type "float2" 0.075110525 0.2528148 ;
	setAttr ".uvtk[175]" -type "float2" 0.19633794 0.69586837 ;
	setAttr ".uvtk[176]" -type "float2" 0.31756526 0.2528148 ;
	setAttr ".uvtk[177]" -type "float2" 0.19633794 -0.21910459 ;
	setAttr ".uvtk[178]" -type "float2" 0.075110525 0.22394931 ;
	setAttr ".uvtk[179]" -type "float2" 0.31756526 0.22394931 ;
	setAttr ".uvtk[180]" -type "float2" -1.2776961 -0.26315176 ;
	setAttr ".uvtk[181]" -type "float2" -1.3071457 -0.26315176 ;
	setAttr ".uvtk[182]" -type "float2" -2.0220759 -0.26315176 ;
	setAttr ".uvtk[183]" -type "float2" -0.92850673 0.48071307 ;
	setAttr ".uvtk[184]" -type "float2" -0.92023128 0.52527523 ;
	setAttr ".uvtk[185]" -type "float2" -0.93409574 0.50794089 ;
	setAttr ".uvtk[186]" -type "float2" -0.92850673 -0.0039492417 ;
	setAttr ".uvtk[187]" -type "float2" -0.93409574 -0.031177029 ;
	setAttr ".uvtk[188]" -type "float2" -0.56276655 0.73991567 ;
	setAttr ".uvtk[189]" -type "float2" -0.92023128 0.52527469 ;
	setAttr ".uvtk[190]" -type "float2" -1.2776961 0.73991567 ;
	setAttr ".uvtk[191]" -type "float2" -1.2776961 0.73991549 ;
	setAttr ".uvtk[192]" -type "float2" -0.56276655 -0.26315176 ;
	setAttr ".uvtk[193]" -type "float2" -1.2776961 -0.26315165 ;
	setAttr ".uvtk[194]" -type "float2" -0.92023128 -0.048511378 ;
	setAttr ".uvtk[195]" -type "float2" -0.92023128 -0.048510902 ;
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode polySoftEdge -n "polySoftEdge1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".a" 0;
createNode polyNormalPerVertex -n "polyNormalPerVertex1";
	setAttr ".uopa" yes;
	setAttr -s 120 ".vn";
	setAttr ".vn[0].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[0].vfnl";
	setAttr ".vn[0].vfnl[0].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[0].vfnl[63].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[0].vfnl[65].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[1].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[1].vfnl";
	setAttr ".vn[1].vfnl[0].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[1].vfnl[63].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[1].vfnl[64].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[2].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[2].vfnl";
	setAttr ".vn[2].vfnl[0].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[2].vfnl[64].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[2].vfnl[65].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[3].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[3].vfnl";
	setAttr ".vn[3].vfnl[1].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[3].vfnl[66].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[3].vfnl[68].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[4].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[4].vfnl";
	setAttr ".vn[4].vfnl[1].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[4].vfnl[66].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[4].vfnl[67].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[5].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[5].vfnl";
	setAttr ".vn[5].vfnl[1].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[5].vfnl[67].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[5].vfnl[68].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[6].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[6].vfnl";
	setAttr ".vn[6].vfnl[2].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[6].vfnl[69].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[6].vfnl[71].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[7].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[7].vfnl";
	setAttr ".vn[7].vfnl[2].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[7].vfnl[69].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[7].vfnl[70].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[8].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[8].vfnl";
	setAttr ".vn[8].vfnl[2].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[8].vfnl[70].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[8].vfnl[71].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[9].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[9].vfnl";
	setAttr ".vn[9].vfnl[3].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[9].vfnl[72].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[9].vfnl[74].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[10].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[10].vfnl";
	setAttr ".vn[10].vfnl[3].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[10].vfnl[72].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[10].vfnl[73].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[11].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[11].vfnl";
	setAttr ".vn[11].vfnl[3].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[11].vfnl[73].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[11].vfnl[74].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[12].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[12].vfnl";
	setAttr ".vn[12].vfnl[4].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[12].vfnl[75].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[12].vfnl[77].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[13].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[13].vfnl";
	setAttr ".vn[13].vfnl[4].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[13].vfnl[75].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[13].vfnl[76].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[14].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[14].vfnl";
	setAttr ".vn[14].vfnl[4].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[14].vfnl[76].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[14].vfnl[77].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[15].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[15].vfnl";
	setAttr ".vn[15].vfnl[5].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[15].vfnl[78].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[15].vfnl[80].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[16].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[16].vfnl";
	setAttr ".vn[16].vfnl[5].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[16].vfnl[78].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[16].vfnl[79].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[17].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[17].vfnl";
	setAttr ".vn[17].vfnl[5].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[17].vfnl[79].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[17].vfnl[80].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[18].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[18].vfnl";
	setAttr ".vn[18].vfnl[6].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[18].vfnl[81].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[18].vfnl[83].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[19].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[19].vfnl";
	setAttr ".vn[19].vfnl[6].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[19].vfnl[81].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[19].vfnl[82].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[20].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[20].vfnl";
	setAttr ".vn[20].vfnl[6].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[20].vfnl[82].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[20].vfnl[83].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[21].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[21].vfnl";
	setAttr ".vn[21].vfnl[7].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[21].vfnl[84].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[21].vfnl[86].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[22].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[22].vfnl";
	setAttr ".vn[22].vfnl[7].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[22].vfnl[84].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[22].vfnl[85].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[23].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[23].vfnl";
	setAttr ".vn[23].vfnl[7].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[23].vfnl[85].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[23].vfnl[86].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[24].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[24].vfnl";
	setAttr ".vn[24].vfnl[8].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[24].vfnl[87].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[24].vfnl[89].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[25].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[25].vfnl";
	setAttr ".vn[25].vfnl[8].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[25].vfnl[87].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[25].vfnl[88].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[26].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[26].vfnl";
	setAttr ".vn[26].vfnl[8].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[26].vfnl[88].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[26].vfnl[89].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[27].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[27].vfnl";
	setAttr ".vn[27].vfnl[9].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[27].vfnl[90].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[27].vfnl[92].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[28].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[28].vfnl";
	setAttr ".vn[28].vfnl[9].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[28].vfnl[90].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[28].vfnl[91].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[29].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[29].vfnl";
	setAttr ".vn[29].vfnl[9].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[29].vfnl[91].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[29].vfnl[92].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[30].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[30].vfnl";
	setAttr ".vn[30].vfnl[10].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[30].vfnl[93].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[30].vfnl[95].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[31].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[31].vfnl";
	setAttr ".vn[31].vfnl[10].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[31].vfnl[93].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[31].vfnl[94].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[32].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[32].vfnl";
	setAttr ".vn[32].vfnl[10].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[32].vfnl[94].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[32].vfnl[95].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[33].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[33].vfnl";
	setAttr ".vn[33].vfnl[11].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[33].vfnl[96].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[33].vfnl[98].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[34].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[34].vfnl";
	setAttr ".vn[34].vfnl[11].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[34].vfnl[96].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[34].vfnl[97].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[35].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[35].vfnl";
	setAttr ".vn[35].vfnl[11].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[35].vfnl[97].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[35].vfnl[98].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[36].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[36].vfnl";
	setAttr ".vn[36].vfnl[20].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[36].vfnl[36].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[36].vfnl[46].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[36].vfnl[60].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[36].vfnl[100].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[37].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[37].vfnl";
	setAttr ".vn[37].vfnl[12].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[37].vfnl[20].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[37].vfnl[100].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[38].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[38].vfnl";
	setAttr ".vn[38].vfnl[20].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[38].vfnl[37].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[38].vfnl[46].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[38].vfnl[59].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[38].vfnl[99].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[39].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[39].vfnl";
	setAttr ".vn[39].vfnl[12].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[39].vfnl[20].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[39].vfnl[99].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[40].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[40].vfnl";
	setAttr ".vn[40].vfnl[12].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[40].vfnl[99].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[40].vfnl[100].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[41].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[41].vfnl";
	setAttr ".vn[41].vfnl[13].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[41].vfnl[101].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[41].vfnl[103].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[42].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[42].vfnl";
	setAttr ".vn[42].vfnl[13].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[42].vfnl[101].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[42].vfnl[102].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[43].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[43].vfnl";
	setAttr ".vn[43].vfnl[13].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[43].vfnl[102].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[43].vfnl[103].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[44].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[44].vfnl";
	setAttr ".vn[44].vfnl[14].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[44].vfnl[104].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[44].vfnl[106].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[45].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[45].vfnl";
	setAttr ".vn[45].vfnl[14].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[45].vfnl[104].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[45].vfnl[105].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[46].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[46].vfnl";
	setAttr ".vn[46].vfnl[14].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[46].vfnl[105].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[46].vfnl[106].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[47].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[47].vfnl";
	setAttr ".vn[47].vfnl[15].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[47].vfnl[107].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[47].vfnl[109].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[48].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[48].vfnl";
	setAttr ".vn[48].vfnl[15].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[48].vfnl[107].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[48].vfnl[108].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[49].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[49].vfnl";
	setAttr ".vn[49].vfnl[15].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[49].vfnl[108].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[49].vfnl[109].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[50].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[50].vfnl";
	setAttr ".vn[50].vfnl[16].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[50].vfnl[110].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[50].vfnl[112].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[51].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[51].vfnl";
	setAttr ".vn[51].vfnl[16].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[51].vfnl[110].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[51].vfnl[111].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[52].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[52].vfnl";
	setAttr ".vn[52].vfnl[16].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[52].vfnl[111].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[52].vfnl[112].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[53].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[53].vfnl";
	setAttr ".vn[53].vfnl[17].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[53].vfnl[113].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[53].vfnl[115].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[54].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[54].vfnl";
	setAttr ".vn[54].vfnl[17].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[54].vfnl[113].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[54].vfnl[114].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[55].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[55].vfnl";
	setAttr ".vn[55].vfnl[17].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[55].vfnl[114].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[55].vfnl[115].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[56].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 3 ".vn[56].vfnl";
	setAttr ".vn[56].vfnl[18].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[56].vfnl[116].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[56].vfnl[118].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[57].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[57].vfnl";
	setAttr ".vn[57].vfnl[18].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[57].vfnl[116].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[57].vfnl[117].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[58].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[58].vfnl";
	setAttr ".vn[58].vfnl[18].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[58].vfnl[117].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[58].vfnl[118].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[59].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[59].vfnl";
	setAttr ".vn[59].vfnl[19].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[59].vfnl[119].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[59].vfnl[121].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[60].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 3 ".vn[60].vfnl";
	setAttr ".vn[60].vfnl[19].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[60].vfnl[119].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[60].vfnl[120].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[61].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 3 ".vn[61].vfnl";
	setAttr ".vn[61].vfnl[19].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[61].vfnl[120].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[61].vfnl[121].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[62].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[62].vfnl";
	setAttr ".vn[62].vfnl[21].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[62].vfnl[25].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[62].vfnl[51].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[62].vfnl[76].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[62].vfnl[77].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[63].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[63].vfnl";
	setAttr ".vn[63].vfnl[21].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[63].vfnl[22].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[63].vfnl[51].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[63].vfnl[64].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[63].vfnl[65].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[64].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[64].vfnl";
	setAttr ".vn[64].vfnl[22].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[64].vfnl[23].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[64].vfnl[51].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[64].vfnl[67].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[64].vfnl[68].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[65].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[65].vfnl";
	setAttr ".vn[65].vfnl[23].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[65].vfnl[24].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[65].vfnl[51].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[65].vfnl[70].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[65].vfnl[71].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[66].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[66].vfnl";
	setAttr ".vn[66].vfnl[24].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[66].vfnl[25].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[66].vfnl[51].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[66].vfnl[73].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[66].vfnl[74].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[67].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[67].vfnl";
	setAttr ".vn[67].vfnl[26].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[67].vfnl[29].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[67].vfnl[52].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[67].vfnl[85].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[67].vfnl[86].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[68].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[68].vfnl";
	setAttr ".vn[68].vfnl[26].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[68].vfnl[27].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[68].vfnl[52].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[68].vfnl[79].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[68].vfnl[80].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[69].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[69].vfnl";
	setAttr ".vn[69].vfnl[27].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[69].vfnl[28].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[69].vfnl[52].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[69].vfnl[82].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[69].vfnl[83].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[70].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[70].vfnl";
	setAttr ".vn[70].vfnl[23].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[70].vfnl[28].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[70].vfnl[52].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[70].vfnl[69].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[70].vfnl[71].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[71].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[71].vfnl";
	setAttr ".vn[71].vfnl[23].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[71].vfnl[29].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[71].vfnl[52].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[71].vfnl[66].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[71].vfnl[67].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[72].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[72].vfnl";
	setAttr ".vn[72].vfnl[30].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[72].vfnl[32].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[72].vfnl[53].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[72].vfnl[91].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[72].vfnl[92].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[73].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[73].vfnl";
	setAttr ".vn[73].vfnl[30].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[73].vfnl[31].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[73].vfnl[53].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[73].vfnl[88].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[73].vfnl[89].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[74].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[74].vfnl";
	setAttr ".vn[74].vfnl[24].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[74].vfnl[31].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[74].vfnl[53].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[74].vfnl[72].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[74].vfnl[74].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[75].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[75].vfnl";
	setAttr ".vn[75].vfnl[24].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[75].vfnl[28].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[75].vfnl[53].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[75].vfnl[69].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[75].vfnl[70].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[76].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[76].vfnl";
	setAttr ".vn[76].vfnl[28].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[76].vfnl[32].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[76].vfnl[53].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[76].vfnl[81].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[76].vfnl[82].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[77].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[77].vfnl";
	setAttr ".vn[77].vfnl[33].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[77].vfnl[35].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[77].vfnl[54].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[77].vfnl[97].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[77].vfnl[98].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[78].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[78].vfnl";
	setAttr ".vn[78].vfnl[33].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[78].vfnl[34].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[78].vfnl[54].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[78].vfnl[94].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[78].vfnl[95].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[79].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[79].vfnl";
	setAttr ".vn[79].vfnl[25].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[79].vfnl[34].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[79].vfnl[54].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[79].vfnl[75].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[79].vfnl[77].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[80].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[80].vfnl";
	setAttr ".vn[80].vfnl[25].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[80].vfnl[31].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[80].vfnl[54].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[80].vfnl[72].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[80].vfnl[73].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[81].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[81].vfnl";
	setAttr ".vn[81].vfnl[31].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[81].vfnl[35].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[81].vfnl[54].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[81].vfnl[87].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[81].vfnl[88].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[82].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[82].vfnl";
	setAttr ".vn[82].vfnl[27].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[82].vfnl[36].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[82].vfnl[55].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[82].vfnl[78].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[82].vfnl[79].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[83].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[83].vfnl";
	setAttr ".vn[83].vfnl[36].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[83].vfnl[37].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[83].vfnl[55].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[83].vfnl[99].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[83].vfnl[100].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[84].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[84].vfnl";
	setAttr ".vn[84].vfnl[37].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[84].vfnl[38].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[84].vfnl[55].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[84].vfnl[102].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[84].vfnl[103].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[85].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[85].vfnl";
	setAttr ".vn[85].vfnl[32].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[85].vfnl[38].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[85].vfnl[55].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[85].vfnl[90].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[85].vfnl[92].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[86].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[86].vfnl";
	setAttr ".vn[86].vfnl[27].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[86].vfnl[32].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[86].vfnl[55].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[86].vfnl[81].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[86].vfnl[83].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[87].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[87].vfnl";
	setAttr ".vn[87].vfnl[39].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[87].vfnl[40].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[87].vfnl[56].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[87].vfnl[105].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[87].vfnl[106].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[88].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[88].vfnl";
	setAttr ".vn[88].vfnl[35].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[88].vfnl[39].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[88].vfnl[56].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[88].vfnl[96].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[88].vfnl[98].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[89].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[89].vfnl";
	setAttr ".vn[89].vfnl[30].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[89].vfnl[35].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[89].vfnl[56].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[89].vfnl[87].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[89].vfnl[89].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[90].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[90].vfnl";
	setAttr ".vn[90].vfnl[30].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[90].vfnl[38].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[90].vfnl[56].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[90].vfnl[90].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[90].vfnl[91].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[91].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[91].vfnl";
	setAttr ".vn[91].vfnl[38].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[91].vfnl[40].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[91].vfnl[56].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[91].vfnl[101].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[91].vfnl[102].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[92].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[92].vfnl";
	setAttr ".vn[92].vfnl[41].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[92].vfnl[43].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[92].vfnl[57].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[92].vfnl[111].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[92].vfnl[112].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[93].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[93].vfnl";
	setAttr ".vn[93].vfnl[29].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[93].vfnl[41].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[93].vfnl[57].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[93].vfnl[84].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[93].vfnl[86].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[94].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[94].vfnl";
	setAttr ".vn[94].vfnl[22].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[94].vfnl[29].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[94].vfnl[57].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[94].vfnl[66].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[94].vfnl[68].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[95].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[95].vfnl";
	setAttr ".vn[95].vfnl[22].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[95].vfnl[42].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[95].vfnl[57].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[95].vfnl[63].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[95].vfnl[64].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[96].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[96].vfnl";
	setAttr ".vn[96].vfnl[42].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[96].vfnl[43].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[96].vfnl[57].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[96].vfnl[108].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[96].vfnl[109].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[97].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[97].vfnl";
	setAttr ".vn[97].vfnl[34].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[97].vfnl[44].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[97].vfnl[58].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[97].vfnl[93].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[97].vfnl[94].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[98].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[98].vfnl";
	setAttr ".vn[98].vfnl[44].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[98].vfnl[45].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[98].vfnl[58].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[98].vfnl[114].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[98].vfnl[115].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[99].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[99].vfnl";
	setAttr ".vn[99].vfnl[42].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[99].vfnl[45].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[99].vfnl[58].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[99].vfnl[107].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[99].vfnl[109].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[100].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[100].vfnl";
	setAttr ".vn[100].vfnl[21].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[100].vfnl[42].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[100].vfnl[58].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[100].vfnl[63].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[100].vfnl[65].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[101].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[101].vfnl";
	setAttr ".vn[101].vfnl[21].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[101].vfnl[34].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[101].vfnl[58].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[101].vfnl[75].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[101].vfnl[76].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[102].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[102].vfnl";
	setAttr ".vn[102].vfnl[40].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[102].vfnl[48].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[102].vfnl[59].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[102].vfnl[104].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[102].vfnl[106].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[103].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[103].vfnl";
	setAttr ".vn[103].vfnl[37].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[103].vfnl[40].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[103].vfnl[59].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[103].vfnl[101].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[103].vfnl[103].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[104].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[104].vfnl";
	setAttr ".vn[104].vfnl[46].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[104].vfnl[47].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[104].vfnl[59].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[104].vfnl[117].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[104].vfnl[118].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[105].nxyz" -type "float3" -0.4999997 0.30901736 -0.80901706 ;
	setAttr -s 5 ".vn[105].vfnl";
	setAttr ".vn[105].vfnl[47].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[105].vfnl[48].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[105].vfnl[59].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[105].vfnl[120].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[105].vfnl[121].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[106].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[106].vfnl";
	setAttr ".vn[106].vfnl[26].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[106].vfnl[36].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[106].vfnl[60].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[106].vfnl[78].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[106].vfnl[80].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[107].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[107].vfnl";
	setAttr ".vn[107].vfnl[26].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[107].vfnl[41].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[107].vfnl[60].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[107].vfnl[84].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[107].vfnl[85].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[108].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[108].vfnl";
	setAttr ".vn[108].vfnl[41].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[108].vfnl[49].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[108].vfnl[60].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[108].vfnl[110].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[108].vfnl[111].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[109].nxyz" -type "float3" 0.30901682 -0.80901688 -0.50000042 ;
	setAttr -s 5 ".vn[109].vfnl";
	setAttr ".vn[109].vfnl[46].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[109].vfnl[49].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[109].vfnl[60].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[109].vfnl[116].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[109].vfnl[118].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[110].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[110].vfnl";
	setAttr ".vn[110].vfnl[43].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[110].vfnl[49].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[110].vfnl[61].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[110].vfnl[110].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[110].vfnl[112].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[111].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[111].vfnl";
	setAttr ".vn[111].vfnl[43].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[111].vfnl[45].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[111].vfnl[61].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[111].vfnl[107].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[111].vfnl[108].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[112].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[112].vfnl";
	setAttr ".vn[112].vfnl[45].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[112].vfnl[50].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[112].vfnl[61].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[112].vfnl[113].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[112].vfnl[114].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[113].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[113].vfnl";
	setAttr ".vn[113].vfnl[47].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[113].vfnl[50].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[113].vfnl[61].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[113].vfnl[119].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[113].vfnl[121].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[114].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[114].vfnl";
	setAttr ".vn[114].vfnl[47].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[114].vfnl[49].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[114].vfnl[61].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[114].vfnl[116].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[114].vfnl[117].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[115].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[115].vfnl";
	setAttr ".vn[115].vfnl[33].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[115].vfnl[44].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[115].vfnl[62].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[115].vfnl[93].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[115].vfnl[95].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[116].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[116].vfnl";
	setAttr ".vn[116].vfnl[33].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[116].vfnl[39].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[116].vfnl[62].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[116].vfnl[96].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[116].vfnl[97].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[117].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[117].vfnl";
	setAttr ".vn[117].vfnl[39].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[117].vfnl[48].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[117].vfnl[62].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[117].vfnl[104].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[117].vfnl[105].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[118].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[118].vfnl";
	setAttr ".vn[118].vfnl[48].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[118].vfnl[50].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[118].vfnl[62].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[118].vfnl[119].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[118].vfnl[120].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[119].nxyz" -type "float3" 4.4722682e-008 0.52573079 0.85065097 ;
	setAttr -s 5 ".vn[119].vfnl";
	setAttr ".vn[119].vfnl[44].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[119].vfnl[50].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[119].vfnl[62].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[119].vfnl[113].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
	setAttr ".vn[119].vfnl[115].fnxy" -type "float3" 1e+020 1e+020 1e+020 ;
createNode polySoftEdge -n "polySoftEdge2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".a" 0;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".ep" 1;
select -ne :defaultResolution;
	setAttr ".w" 640;
	setAttr ".h" 480;
	setAttr ".dar" 1.3333332538604736;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "polySoftEdge2.out" "icos_meshShape.i";
connectAttr "polyTweakUV2.uvtk[0]" "icos_meshShape.uvst[0].uvtw";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "ico_edges.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "ico_edges.msg" "materialInfo1.m";
connectAttr "ico_faces.oc" "lambert3SG.ss";
connectAttr "icos_meshShape.iog" "lambert3SG.dsm" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "ico_faces.msg" "materialInfo2.m";
connectAttr "hyperView1.msg" "nodeEditorPanel2Info.b[0]";
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "lambert4.msg" "materialInfo3.m";
connectAttr "polySurfaceShape1.o" "polySphProj1.ip";
connectAttr "icos_meshShape.wm" "polySphProj1.mp";
connectAttr "polySphProj1.out" "polyTweakUV1.ip";
connectAttr "polyTweakUV1.out" "polySphProj2.ip";
connectAttr "icos_meshShape.wm" "polySphProj2.mp";
connectAttr "polySphProj2.out" "polyTweakUV2.ip";
connectAttr "polyTweakUV2.out" "polySoftEdge1.ip";
connectAttr "icos_meshShape.wm" "polySoftEdge1.mp";
connectAttr "polySoftEdge1.out" "polyNormalPerVertex1.ip";
connectAttr "polyNormalPerVertex1.out" "polySoftEdge2.ip";
connectAttr "icos_meshShape.wm" "polySoftEdge2.mp";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "ico_edges.msg" ":defaultShaderList1.s" -na;
connectAttr "ico_faces.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of icosahedron.ma
