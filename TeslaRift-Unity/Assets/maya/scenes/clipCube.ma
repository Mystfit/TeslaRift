//Maya ASCII 2014 scene
//Name: clipCube.ma
//Last modified: Fri, May 30, 2014 07:53:01 PM
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
	setAttr ".t" -type "double3" 1.9908091580419343 2.2586682626980461 3.355157118922897 ;
	setAttr ".r" -type "double3" -32.738352729602411 34.999999999999929 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 4.6909864501835798;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
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
createNode transform -n "clipCube1";
createNode mesh -n "clipCube1Shape" -p "clipCube1";
	setAttr -k off ".v";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 180 ".uvst[0].uvsp[0:179]" -type "float2" 0.40624687 0.7812469
		 0.59375316 0.96875322 0.40624687 0.28124687 0.40624687 0.5312469 0.4062469 0.9687531
		 0.37500003 0.96875316 0.375 0.7812469 0.375 0.031246871 0.37500003 0.21875313 0.625
		 0.96875316 0.5937531 0.7812469 0.625 0.7812469 0.5937531 0.031246878 0.375 0.28124687
		 0.37500003 0.46875313 0.4062469 0.25 0.59375316 0.21875313 0.5937531 0.25 0.5937531
		 0.2812469 0.625 0.28124687 0.375 0.5312469 0.4062469 0.5 0.59375316 0.46875316 0.5937531
		 0.5 0.5937531 0.5312469 0.625 0.5312469 0.625 0.71875316 0.4062469 0.75 0.59375316
		 0.71875316 0.4062469 0 0.40624687 0.031246871 0.5937531 0 0.625 0.031246871 0.4062469
		 0.21875313 0.625 0.21875313 0.4062469 0.46875313 0.625 0.46875313 0.37500003 0.71875316
		 0.4062469 0.71875316 0.5937531 0.75000006 0.37500003 0.96875316 0.375 0.7812469 0.40624687
		 0.7812469 0.4062469 0.9687531 0.4062469 0 0.5937531 0 0.5937531 0.031246878 0.40624687
		 0.031246871 0.4062469 0.21875313 0.37500003 0.21875313 0.375 0.031246871 0.59375316
		 0.96875322 0.5937531 0.7812469 0.625 0.7812469 0.625 0.96875316 0.625 0.031246871
		 0.625 0.21875313 0.59375316 0.21875313 0.40624687 0.28124687 0.4062469 0.46875313
		 0.37500003 0.46875313 0.375 0.28124687 0.5937531 0.25 0.4062469 0.25 0.5937531 0.2812469
		 0.625 0.28124687 0.625 0.46875313 0.59375316 0.46875316 0.40624687 0.5312469 0.4062469
		 0.71875316 0.37500003 0.71875316 0.375 0.5312469 0.5937531 0.5 0.4062469 0.5 0.625
		 0.5312469 0.625 0.71875316 0.59375316 0.71875316 0.5937531 0.5312469 0.5937531 0.75000006
		 0.4062469 0.75 0 0 0.99999994 0 0.49999925 0.86602539 8.6620428e-017 0 0.99999994
		 1.7324086e-016 0.99999994 0.23567069 0 0.23567076 0 8.6620435e-017 1 0 1 0.23567075
		 8.6620435e-017 0.2356708 0 8.6620435e-017 1 0 1 0.23567078 7.749632e-009 0.2356708
		 0 0 1 0 1 0.23567079 0 0.23567079 0 0 0.99999994 2.1655107e-016 0.99999994 0.23567082
		 7.7496356e-009 0.23567082 0 0.23567086 0.99999994 0.23567115 1 2.7104517e-007 7.1627085e-008
		 0 8.6620441e-017 0 1 1.2993066e-016 1 0.23567089 0 0.23567089 0 3.6754827e-016 1
		 0 0.5000003 0.86602509 0 0 1 0 1 0.23567089 0 0.23567089 0 0 1 0 0.49999973 0.86602509
		 0 1.8377413e-016 1 0 0.5000003 0.86602491 7.7496294e-009 0 0.99999994 4.1144702e-016
		 1 0.23567076 0 0.23567073 0 0.23567079 1 0.23567083 1 7.2576924e-008 1.7104263e-008
		 0 0 0 1 0 1 0.23567073 0 0.23567073 0 1.7324086e-016 1 0 1 0.23567076 0 0.23567076
		 0 0 1 3.6754848e-016 0.5 0.86602539 0 0 1 1.8377427e-016 0.50000012 0.86602551 0
		 0 1 0 0.49999988 0.86602533 0 0 1 1.8377421e-016 0.5 0.86602527 0.45213488 0.049994469
		 0.049994707 0.049994379 0.049994558 0.95000541 0.45213476 0.95000553 0.50212938 0.95000553
		 0.5021295 0.049994469 0.5021295 0.049994469 0.50212938 0.95000553 0.50205445 0.049994439
		 0.50205445 0.049994439 0.50205427 0.95000541 0.50205427 0.95000541 0.049994558 0.95000541
		 0.049994707 0.049994379 0.45213488 0.049994469 0.45213476 0.95000553 0.45213464 1
		 0.049994439 0.99999988 0.452135 1 -5.9604645e-008 0.95000535 1.1920929e-007 0.049994439
		 -5.9604645e-008 0.95000535 0.049994677 0.99999988 1.1920929e-007 0.049994439 0.45213512
		 0 0.45213476 0 0.049994826 -8.9406967e-008 0.049994469 -8.9406967e-008;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 72 ".pt[0:71]" -type "float3"  1.5 1.5 1.4901161e-008 1.5 
		1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 
		1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 1.4901161e-008 1.5 1.5 0 1.5 
		1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 
		0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 
		1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0 1.5 1.5 0;
	setAttr -s 72 ".vt[0:71]"  -1.73027289 -1.67271042 0.17271046 -1.67271042 -1.73027289 0.17271046
		 -1.67271042 -1.67271042 0.2302729 -1.32728958 -1.73027289 0.17271046 -1.26972711 -1.67271042 0.17271046
		 -1.32728958 -1.67271042 0.2302729 -1.67271042 -1.26972699 0.17271043 -1.73027289 -1.32728958 0.17271043
		 -1.67271042 -1.32728958 0.2302729 -1.26972711 -1.32728958 0.17271046 -1.32728958 -1.26972699 0.17271046
		 -1.32728958 -1.32728958 0.23027295 -1.67271042 -1.32728958 -0.23027293 -1.73027289 -1.32728958 -0.17271045
		 -1.67271042 -1.26972699 -0.17271045 -1.26972711 -1.32728958 -0.17271045 -1.32728958 -1.32728958 -0.23027293
		 -1.32728958 -1.26972699 -0.17271045 -1.67271042 -1.73027289 -0.17271046 -1.73027289 -1.67271042 -0.17271046
		 -1.67271042 -1.67271042 -0.23027293 -1.26972711 -1.67271042 -0.17271045 -1.32728958 -1.73027289 -0.17271046
		 -1.32728958 -1.67271042 -0.23027293 -1.70039415 -1.7671833 0.20039415 -1.7671833 -1.70039415 0.20039415
		 -1.7671833 -1.70039415 -0.20039415 -1.70039415 -1.7671833 -0.20039415 -1.70039415 -1.70039415 0.26718324
		 -1.29960585 -1.7671833 0.20039415 -1.29960585 -1.70039415 0.26718324 -1.70039415 -1.29960585 0.26718324
		 -1.7671833 -1.29960585 0.20039411 -1.2328167 -1.70039415 0.20039415 -1.29960585 -1.7671833 -0.20039415
		 -1.2328167 -1.70039415 -0.20039412 -1.2328167 -1.29960585 0.20039411 -1.29960585 -1.29960585 0.26718324
		 -1.70039415 -1.2328167 0.20039411 -1.70039415 -1.2328167 -0.20039412 -1.7671833 -1.29960585 -0.20039412
		 -1.29960585 -1.2328167 0.20039411 -1.2328167 -1.29960585 -0.20039412 -1.29960585 -1.2328167 -0.20039412
		 -1.70039415 -1.29960585 -0.26718327 -1.70039415 -1.70039415 -0.26718327 -1.29960585 -1.29960585 -0.26718327
		 -1.29960585 -1.70039415 -0.26718327 -1.70867205 -1.26814508 0.20867205 -1.73185492 -1.29132795 0.20867205
		 -1.70867205 -1.29132807 0.23185492 -1.73185492 -1.70867205 0.20867205 -1.70867205 -1.73185492 0.20867205
		 -1.70867193 -1.70867205 0.23185492 -1.26814508 -1.29132795 0.20867205 -1.29132795 -1.26814508 0.20867205
		 -1.29132807 -1.29132795 0.23185492 -1.29132795 -1.73185492 0.20867205 -1.26814508 -1.70867205 0.20867205
		 -1.29132795 -1.70867193 0.23185492 -1.29132807 -1.29132795 -0.23185492 -1.29132795 -1.26814508 -0.20867205
		 -1.26814508 -1.29132795 -0.20867205 -1.29132795 -1.73185492 -0.20867205 -1.29132795 -1.70867193 -0.23185492
		 -1.26814508 -1.70867205 -0.20867205 -1.73185492 -1.29132795 -0.20867205 -1.70867205 -1.26814508 -0.20867205
		 -1.70867205 -1.29132807 -0.23185492 -1.70867205 -1.73185492 -0.20867205 -1.73185492 -1.70867205 -0.20867205
		 -1.70867193 -1.70867205 -0.23185492;
	setAttr -s 171 ".ed";
	setAttr ".ed[0:165]"  18 22 0 22 3 0 3 1 0 1 18 0 5 11 0 11 8 0 8 2 0 2 5 0
		 7 13 0 13 19 0 19 0 0 0 7 0 21 15 0 15 9 0 9 4 0 4 21 0 10 17 0 17 14 0 14 6 0 6 10 0
		 16 23 0 23 20 0 20 12 0 12 16 0 9 11 0 11 10 0 10 9 0 1 24 0 0 25 0 24 25 0 19 26 0
		 26 25 0 18 27 0 26 27 0 24 27 0 2 28 0 28 24 0 3 29 0 29 24 0 5 30 0 29 30 0 28 30 0
		 25 28 0 8 31 0 31 28 0 7 32 0 31 32 0 25 32 0 4 33 0 33 29 0 22 34 0 34 29 0 21 35 0
		 34 35 0 33 35 0 30 33 0 9 36 0 36 33 0 11 37 0 36 37 0 30 37 0 6 38 0 32 38 0 14 39 0
		 39 38 0 13 40 0 39 40 0 32 40 0 38 31 0 37 31 0 10 41 0 37 41 0 38 41 0 41 36 0 15 42 0
		 42 36 0 17 43 0 42 43 0 41 43 0 12 44 0 40 44 0 20 45 0 45 44 0 45 26 0 40 26 0 44 39 0
		 43 39 0 16 46 0 43 46 0 44 46 0 46 42 0 35 42 0 23 47 0 35 47 0 46 47 0 27 45 0 47 45 0
		 47 34 0 27 34 0 4 5 0 11 9 0 2 0 0 7 8 0 19 20 0 12 13 0 15 16 0 23 21 0 9 10 0 17 15 0
		 8 6 0 10 11 0 13 14 0 6 7 0 16 17 0 14 12 0 21 22 0 3 4 0 20 18 0 22 23 0 5 3 0 1 2 0
		 0 1 0 18 19 0 66 70 0 70 51 0 51 49 0 49 66 0 53 59 0 59 56 0 56 50 0 50 53 0 55 61 0
		 61 67 0 67 48 0 48 55 0 69 63 0 63 57 0 57 52 0 52 69 0 58 65 0 65 62 0 62 54 0 54 58 0
		 64 71 0 71 68 0 68 60 0 60 64 0 49 48 0 67 66 0 50 49 0 51 53 0 48 50 0 56 55 0 52 51 0
		 70 69 0 53 52 0 57 59 0 55 54 0 62 61 0 54 56 0 59 58 0 58 57 0 63 65 0 61 60 0 68 67 0
		 60 62 0;
	setAttr ".ed[166:170]" 65 64 0 64 63 0 69 71 0 66 68 0 71 70 0;
	setAttr -s 90 -ch 336 ".fc[0:89]" -type "polyFaces" 
		f 4 29 -32 33 -35
		mu 0 4 43 40 41 42
		f 4 36 -39 40 -42
		mu 0 4 47 44 45 46
		f 4 42 -45 46 -48
		mu 0 4 50 47 48 49
		f 4 49 -52 53 -55
		mu 0 4 54 51 52 53
		f 4 55 -58 59 -61
		mu 0 4 46 55 56 57
		f 4 62 -65 66 -68
		mu 0 4 61 58 59 60
		f 4 68 -70 71 -73
		mu 0 4 63 48 57 62
		f 4 73 -76 77 -79
		mu 0 4 64 65 66 67
		f 4 80 -83 83 -85
		mu 0 4 71 68 69 70
		f 4 85 -87 88 -90
		mu 0 4 73 59 67 72
		f 4 90 -92 93 -95
		mu 0 4 77 74 75 76
		f 4 95 -97 97 -99
		mu 0 4 79 69 76 78
		f 3 -30 -37 -43
		mu 0 3 50 44 47
		f 3 -50 -56 -41
		mu 0 3 45 55 46
		f 3 -63 -47 -69
		mu 0 3 63 49 48
		f 3 -27 -26 -25
		mu 0 3 34 17 16
		f 3 -81 -67 -86
		mu 0 3 73 60 59
		f 3 -91 -89 -78
		mu 0 3 66 72 67
		f 3 -34 -84 -96
		mu 0 3 79 70 69
		f 3 -54 -98 -94
		mu 0 3 75 78 76
		f 4 -11 30 31 -29
		mu 0 4 5 6 41 40
		f 4 -4 27 34 -33
		mu 0 4 0 4 43 42
		f 4 -3 37 38 -28
		mu 0 4 29 31 45 44
		f 4 -8 35 41 -40
		mu 0 4 12 30 47 46
		f 4 -7 43 44 -36
		mu 0 4 30 33 48 47
		f 4 -12 28 47 -46
		mu 0 4 8 7 50 49
		f 4 -2 50 51 -38
		mu 0 4 1 10 52 51
		f 4 -16 48 54 -53
		mu 0 4 11 9 54 53
		f 4 -15 56 57 -49
		mu 0 4 32 34 56 55
		f 4 -5 39 60 -59
		mu 0 4 16 12 46 57
		f 4 -19 63 64 -62
		mu 0 4 2 35 59 58
		f 4 -9 45 67 -66
		mu 0 4 14 13 61 60
		f 4 -6 58 69 -44
		mu 0 4 33 16 57 48
		f 4 -20 61 72 -71
		mu 0 4 17 15 63 62
		f 4 -14 74 75 -57
		mu 0 4 19 36 66 65
		f 4 -17 70 78 -77
		mu 0 4 22 18 64 67
		f 4 -23 81 82 -80
		mu 0 4 3 38 69 68
		f 4 -10 65 84 -31
		mu 0 4 37 20 71 70
		f 4 -18 76 86 -64
		mu 0 4 35 22 67 59
		f 4 -24 79 89 -88
		mu 0 4 23 21 73 72
		f 4 -13 52 91 -75
		mu 0 4 25 26 75 74
		f 4 -21 87 94 -93
		mu 0 4 28 24 77 76
		f 4 -22 92 96 -82
		mu 0 4 38 28 76 69
		f 4 -1 32 98 -51
		mu 0 4 39 27 79 78
		f 3 -74 -72 -60
		mu 0 3 80 81 82
		f 4 14 99 4 100
		mu 0 4 83 84 85 86
		f 4 6 101 11 102
		mu 0 4 87 88 89 90
		f 4 9 103 22 104
		mu 0 4 91 92 93 94
		f 4 12 105 20 106
		mu 0 4 95 96 97 98
		f 4 13 107 16 108
		mu 0 4 99 100 101 102
		f 4 5 109 19 110
		mu 0 4 103 104 105 106
		f 4 8 111 18 112
		mu 0 4 107 108 109 110
		f 3 -110 -103 -113
		mu 0 3 111 112 113
		f 4 23 113 17 114
		mu 0 4 114 115 116 117
		f 3 -115 -112 -105
		mu 0 3 118 119 120
		f 3 -114 -106 -109
		mu 0 3 121 122 123
		f 4 15 115 1 116
		mu 0 4 124 125 126 127
		f 4 21 117 0 118
		mu 0 4 128 129 130 131
		f 4 7 119 2 120
		mu 0 4 132 133 134 135
		f 4 10 121 3 122
		mu 0 4 136 137 138 139
		f 3 -123 -118 -104
		mu 0 3 140 141 142
		f 3 -102 -121 -122
		mu 0 3 143 144 145
		f 3 -117 -120 -100
		mu 0 3 146 147 148
		f 3 -119 -116 -107
		mu 0 3 149 150 151
		f 4 123 124 125 126
		mu 0 4 152 153 154 155
		f 4 131 132 133 134
		mu 0 4 156 157 158 159
		f 4 135 136 137 138
		mu 0 4 160 161 162 163
		f 4 139 140 141 142
		mu 0 4 164 165 166 167
		f 4 147 -134 148 -127
		mu 0 4 155 159 158 152
		f 4 149 -126 150 -131
		mu 0 4 168 155 154 169
		f 4 151 -130 152 -135
		mu 0 4 159 168 170 156
		f 4 153 -125 154 -139
		mu 0 4 171 154 153 172
		f 4 155 -138 156 -128
		mu 0 4 169 171 173 174
		f 4 157 -142 158 -132
		mu 0 4 156 167 166 157
		f 4 159 -129 160 -143
		mu 0 4 167 170 174 164
		f 4 161 -137 162 -140
		mu 0 4 164 173 175 165
		f 4 163 -146 164 -133
		mu 0 4 157 176 177 158
		f 4 165 -141 166 -147
		mu 0 4 176 166 165 178
		f 4 167 -136 168 -144
		mu 0 4 178 175 172 179
		f 4 169 -145 170 -124
		mu 0 4 152 177 179 153
		f 3 -148 -150 -152
		mu 0 3 159 155 168
		f 3 -154 -156 -151
		mu 0 3 154 171 169
		f 3 -158 -153 -160
		mu 0 3 167 156 170
		f 3 -162 -161 -157
		mu 0 3 173 164 174
		f 3 -164 -159 -166
		mu 0 3 176 157 166
		f 3 -168 -167 -163
		mu 0 3 175 178 165
		f 3 -149 -165 -170
		mu 0 3 152 158 177
		f 3 -155 -171 -169
		mu 0 3 172 153 179
		f 4 128 129 130 127
		mu 0 4 174 170 168 169
		f 4 144 145 146 143
		mu 0 4 179 177 176 178;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode shadingEngine -n "cubeFrame_SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 64 ".gn";
createNode materialInfo -n "clipCube:materialInfo1";
createNode lambert -n "cubeFrameMat";
	setAttr ".c" -type "float3" 1 0.87493098 0 ;
createNode shadingEngine -n "cubeFaces_SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 64 ".gn";
createNode materialInfo -n "clipCube:clipMatrix:materialInfo1";
createNode lambert -n "cubeFacesMat";
	setAttr ".c" -type "float3" 0 0.11449838 1 ;
createNode shadingEngine -n "cubeEdges_SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 64 ".gn";
createNode materialInfo -n "materialInfo2";
createNode lambert -n "cubeEdgesMat";
	setAttr ".c" -type "float3" 1 0 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode groupId -n "groupId954";
	setAttr ".ihi" 0;
createNode groupId -n "groupId955";
	setAttr ".ihi" 0;
createNode groupId -n "groupId956";
	setAttr ".ihi" 0;
createNode groupId -n "groupId957";
	setAttr ".ihi" 0;
createNode groupId -n "groupId958";
	setAttr ".ihi" 0;
createNode groupId -n "groupId959";
	setAttr ".ihi" 0;
createNode groupId -n "groupId960";
	setAttr ".ihi" 0;
createNode groupId -n "groupId961";
	setAttr ".ihi" 0;
createNode groupId -n "groupId962";
	setAttr ".ihi" 0;
createNode groupId -n "groupId963";
	setAttr ".ihi" 0;
createNode groupId -n "groupId964";
	setAttr ".ihi" 0;
createNode groupId -n "groupId965";
	setAttr ".ihi" 0;
createNode groupId -n "groupId966";
	setAttr ".ihi" 0;
createNode groupId -n "groupId967";
	setAttr ".ihi" 0;
createNode groupId -n "groupId968";
	setAttr ".ihi" 0;
createNode groupId -n "groupId969";
	setAttr ".ihi" 0;
createNode groupId -n "groupId970";
	setAttr ".ihi" 0;
createNode groupId -n "groupId971";
	setAttr ".ihi" 0;
createNode groupId -n "groupId972";
	setAttr ".ihi" 0;
createNode groupId -n "groupId973";
	setAttr ".ihi" 0;
createNode groupId -n "groupId974";
	setAttr ".ihi" 0;
createNode groupId -n "groupId975";
	setAttr ".ihi" 0;
createNode groupId -n "groupId976";
	setAttr ".ihi" 0;
createNode groupId -n "groupId977";
	setAttr ".ihi" 0;
createNode groupId -n "groupId978";
	setAttr ".ihi" 0;
createNode groupId -n "groupId979";
	setAttr ".ihi" 0;
createNode groupId -n "groupId980";
	setAttr ".ihi" 0;
createNode groupId -n "groupId981";
	setAttr ".ihi" 0;
createNode groupId -n "groupId982";
	setAttr ".ihi" 0;
createNode groupId -n "groupId983";
	setAttr ".ihi" 0;
createNode groupId -n "groupId984";
	setAttr ".ihi" 0;
createNode groupId -n "groupId985";
	setAttr ".ihi" 0;
createNode groupId -n "groupId986";
	setAttr ".ihi" 0;
createNode groupId -n "groupId987";
	setAttr ".ihi" 0;
createNode groupId -n "groupId988";
	setAttr ".ihi" 0;
createNode groupId -n "groupId989";
	setAttr ".ihi" 0;
createNode groupId -n "groupId990";
	setAttr ".ihi" 0;
createNode groupId -n "groupId991";
	setAttr ".ihi" 0;
createNode groupId -n "groupId992";
	setAttr ".ihi" 0;
createNode groupId -n "groupId993";
	setAttr ".ihi" 0;
createNode groupId -n "groupId994";
	setAttr ".ihi" 0;
createNode groupId -n "groupId995";
	setAttr ".ihi" 0;
createNode groupId -n "groupId996";
	setAttr ".ihi" 0;
createNode groupId -n "groupId997";
	setAttr ".ihi" 0;
createNode groupId -n "groupId998";
	setAttr ".ihi" 0;
createNode groupId -n "groupId999";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1000";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1001";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1002";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1003";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1004";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1005";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1006";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1007";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1008";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1009";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1010";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1011";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1012";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1013";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1014";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1015";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1016";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1017";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1018";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1020";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1021";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1022";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1023";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1024";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1025";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1026";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1027";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1028";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1029";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1030";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1031";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1032";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1033";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1034";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1035";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1036";
	setAttr ".ihi" 0;
createNode groupId -n "groupId1019";
	setAttr ".ihi" 0;
createNode groupId -n "groupId862";
	setAttr ".ihi" 0;
createNode groupId -n "groupId951";
	setAttr ".ihi" 0;
createNode groupId -n "groupId891";
	setAttr ".ihi" 0;
createNode groupId -n "groupId920";
	setAttr ".ihi" 0;
createNode groupId -n "groupId863";
	setAttr ".ihi" 0;
createNode groupId -n "groupId952";
	setAttr ".ihi" 0;
createNode groupId -n "groupId892";
	setAttr ".ihi" 0;
createNode groupId -n "groupId921";
	setAttr ".ihi" 0;
createNode groupId -n "groupId864";
	setAttr ".ihi" 0;
createNode groupId -n "groupId950";
	setAttr ".ihi" 0;
createNode groupId -n "groupId893";
	setAttr ".ihi" 0;
createNode groupId -n "groupId922";
	setAttr ".ihi" 0;
createNode groupId -n "groupId865";
	setAttr ".ihi" 0;
createNode groupId -n "groupId953";
	setAttr ".ihi" 0;
createNode groupId -n "groupId894";
	setAttr ".ihi" 0;
createNode groupId -n "groupId923";
	setAttr ".ihi" 0;
createNode groupId -n "groupId866";
	setAttr ".ihi" 0;
createNode groupId -n "groupId949";
	setAttr ".ihi" 0;
createNode groupId -n "groupId895";
	setAttr ".ihi" 0;
createNode groupId -n "groupId924";
	setAttr ".ihi" 0;
createNode groupId -n "groupId867";
	setAttr ".ihi" 0;
createNode groupId -n "groupId896";
	setAttr ".ihi" 0;
createNode groupId -n "groupId925";
	setAttr ".ihi" 0;
createNode groupId -n "groupId868";
	setAttr ".ihi" 0;
createNode groupId -n "groupId897";
	setAttr ".ihi" 0;
createNode groupId -n "groupId926";
	setAttr ".ihi" 0;
createNode groupId -n "groupId869";
	setAttr ".ihi" 0;
createNode groupId -n "groupId898";
	setAttr ".ihi" 0;
createNode groupId -n "groupId927";
	setAttr ".ihi" 0;
createNode groupId -n "groupId870";
	setAttr ".ihi" 0;
createNode groupId -n "groupId899";
	setAttr ".ihi" 0;
createNode groupId -n "groupId928";
	setAttr ".ihi" 0;
createNode groupId -n "groupId871";
	setAttr ".ihi" 0;
createNode groupId -n "groupId900";
	setAttr ".ihi" 0;
createNode groupId -n "groupId929";
	setAttr ".ihi" 0;
createNode groupId -n "groupId872";
	setAttr ".ihi" 0;
createNode groupId -n "groupId901";
	setAttr ".ihi" 0;
createNode groupId -n "groupId930";
	setAttr ".ihi" 0;
createNode groupId -n "groupId873";
	setAttr ".ihi" 0;
createNode groupId -n "groupId902";
	setAttr ".ihi" 0;
createNode groupId -n "groupId931";
	setAttr ".ihi" 0;
createNode groupId -n "groupId874";
	setAttr ".ihi" 0;
createNode groupId -n "groupId593";
	setAttr ".ihi" 0;
createNode groupId -n "groupId903";
	setAttr ".ihi" 0;
createNode groupId -n "groupId932";
	setAttr ".ihi" 0;
createNode groupId -n "groupId875";
	setAttr ".ihi" 0;
createNode groupId -n "groupId594";
	setAttr ".ihi" 0;
createNode groupId -n "groupId904";
	setAttr ".ihi" 0;
createNode groupId -n "groupId933";
	setAttr ".ihi" 0;
createNode groupId -n "groupId876";
	setAttr ".ihi" 0;
createNode groupId -n "groupId847";
	setAttr ".ihi" 0;
createNode groupId -n "groupId905";
	setAttr ".ihi" 0;
createNode groupId -n "groupId934";
	setAttr ".ihi" 0;
createNode groupId -n "groupId877";
	setAttr ".ihi" 0;
createNode groupId -n "groupId848";
	setAttr ".ihi" 0;
createNode groupId -n "groupId906";
	setAttr ".ihi" 0;
createNode groupId -n "groupId935";
	setAttr ".ihi" 0;
createNode groupId -n "groupId878";
	setAttr ".ihi" 0;
createNode groupId -n "groupId849";
	setAttr ".ihi" 0;
createNode groupId -n "groupId907";
	setAttr ".ihi" 0;
createNode groupId -n "groupId936";
	setAttr ".ihi" 0;
createNode groupId -n "groupId879";
	setAttr ".ihi" 0;
createNode groupId -n "groupId850";
	setAttr ".ihi" 0;
createNode groupId -n "groupId908";
	setAttr ".ihi" 0;
createNode groupId -n "groupId937";
	setAttr ".ihi" 0;
createNode groupId -n "groupId880";
	setAttr ".ihi" 0;
createNode groupId -n "groupId851";
	setAttr ".ihi" 0;
createNode groupId -n "groupId909";
	setAttr ".ihi" 0;
createNode groupId -n "groupId938";
	setAttr ".ihi" 0;
createNode groupId -n "groupId881";
	setAttr ".ihi" 0;
createNode groupId -n "groupId852";
	setAttr ".ihi" 0;
createNode groupId -n "groupId910";
	setAttr ".ihi" 0;
createNode groupId -n "groupId939";
	setAttr ".ihi" 0;
createNode groupId -n "groupId882";
	setAttr ".ihi" 0;
createNode groupId -n "groupId853";
	setAttr ".ihi" 0;
createNode groupId -n "groupId911";
	setAttr ".ihi" 0;
createNode groupId -n "groupId940";
	setAttr ".ihi" 0;
createNode groupId -n "groupId883";
	setAttr ".ihi" 0;
createNode groupId -n "groupId854";
	setAttr ".ihi" 0;
createNode groupId -n "groupId912";
	setAttr ".ihi" 0;
createNode groupId -n "groupId941";
	setAttr ".ihi" 0;
createNode groupId -n "groupId884";
	setAttr ".ihi" 0;
createNode groupId -n "groupId855";
	setAttr ".ihi" 0;
createNode groupId -n "groupId913";
	setAttr ".ihi" 0;
createNode groupId -n "groupId942";
	setAttr ".ihi" 0;
createNode groupId -n "groupId885";
	setAttr ".ihi" 0;
createNode groupId -n "groupId856";
	setAttr ".ihi" 0;
createNode groupId -n "groupId914";
	setAttr ".ihi" 0;
createNode groupId -n "groupId943";
	setAttr ".ihi" 0;
createNode groupId -n "groupId886";
	setAttr ".ihi" 0;
createNode groupId -n "groupId857";
	setAttr ".ihi" 0;
createNode groupId -n "groupId915";
	setAttr ".ihi" 0;
createNode groupId -n "groupId944";
	setAttr ".ihi" 0;
createNode groupId -n "groupId887";
	setAttr ".ihi" 0;
createNode groupId -n "groupId858";
	setAttr ".ihi" 0;
createNode groupId -n "groupId916";
	setAttr ".ihi" 0;
createNode groupId -n "groupId945";
	setAttr ".ihi" 0;
createNode groupId -n "groupId888";
	setAttr ".ihi" 0;
createNode groupId -n "groupId859";
	setAttr ".ihi" 0;
createNode groupId -n "groupId917";
	setAttr ".ihi" 0;
createNode groupId -n "groupId946";
	setAttr ".ihi" 0;
createNode groupId -n "groupId889";
	setAttr ".ihi" 0;
createNode groupId -n "groupId860";
	setAttr ".ihi" 0;
createNode groupId -n "groupId918";
	setAttr ".ihi" 0;
createNode groupId -n "groupId947";
	setAttr ".ihi" 0;
createNode groupId -n "groupId890";
	setAttr ".ihi" 0;
createNode groupId -n "groupId861";
	setAttr ".ihi" 0;
createNode groupId -n "groupId919";
	setAttr ".ihi" 0;
createNode groupId -n "groupId948";
	setAttr ".ihi" 0;
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
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -clipTime \"on\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n"
		+ "                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n"
		+ "                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -clipTime \"on\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n"
		+ "                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n"
		+ "                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n"
		+ "                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n"
		+ "                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n"
		+ "                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n"
		+ "                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 1 -size 12 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 20;
	setAttr ".unw" 20;
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
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "cubeFrame_SG.mwc" "clipCube1Shape.iog.og[0].gco";
connectAttr "groupId998.id" "clipCube1Shape.iog.og[0].gid";
connectAttr "cubeFaces_SG.mwc" "clipCube1Shape.iog.og[1].gco";
connectAttr "groupId999.id" "clipCube1Shape.iog.og[1].gid";
connectAttr "cubeEdges_SG.mwc" "clipCube1Shape.iog.og[2].gco";
connectAttr "groupId1000.id" "clipCube1Shape.iog.og[2].gid";
connectAttr "cubeFrameMat.oc" "cubeFrame_SG.ss";
connectAttr "clipCube1Shape.iog.og[0]" "cubeFrame_SG.dsm" -na;
connectAttr "groupId593.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId848.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId851.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId854.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId857.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId860.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId863.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId866.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId869.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId872.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId875.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId878.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId881.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId884.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId887.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId890.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId893.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId896.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId899.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId902.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId905.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId908.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId911.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId914.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId917.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId920.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId923.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId926.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId929.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId932.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId935.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId938.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId941.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId944.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId947.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId950.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId953.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId956.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId959.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId962.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId965.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId968.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId971.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId974.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId977.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId980.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId983.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId986.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId989.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId992.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId995.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId998.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1001.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1004.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1007.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1010.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1013.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1016.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1019.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1022.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1025.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1028.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1031.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId1034.msg" "cubeFrame_SG.gn" -na;
connectAttr "cubeFrame_SG.msg" "clipCube:materialInfo1.sg";
connectAttr "cubeFrameMat.msg" "clipCube:materialInfo1.m";
connectAttr "cubeFacesMat.oc" "cubeFaces_SG.ss";
connectAttr "clipCube1Shape.iog.og[1]" "cubeFaces_SG.dsm" -na;
connectAttr "groupId594.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId849.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId852.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId855.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId858.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId861.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId864.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId867.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId870.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId873.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId876.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId879.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId882.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId885.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId888.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId891.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId894.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId897.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId900.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId903.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId906.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId909.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId912.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId915.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId918.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId921.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId924.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId927.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId930.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId933.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId936.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId939.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId942.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId945.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId948.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId951.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId954.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId957.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId960.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId963.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId966.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId969.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId972.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId975.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId978.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId981.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId984.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId987.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId990.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId993.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId996.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId999.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1002.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1005.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1008.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1011.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1014.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1017.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1020.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1023.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1026.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1029.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1032.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId1035.msg" "cubeFaces_SG.gn" -na;
connectAttr "cubeFaces_SG.msg" "clipCube:clipMatrix:materialInfo1.sg";
connectAttr "cubeFacesMat.msg" "clipCube:clipMatrix:materialInfo1.m";
connectAttr "cubeEdgesMat.oc" "cubeEdges_SG.ss";
connectAttr "groupId847.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId850.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId853.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId856.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId859.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId862.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId865.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId868.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId871.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId874.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId877.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId880.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId883.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId886.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId889.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId892.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId895.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId898.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId901.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId904.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId907.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId910.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId913.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId916.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId919.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId922.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId925.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId928.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId931.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId934.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId937.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId940.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId943.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId946.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId949.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId952.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId955.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId958.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId961.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId964.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId967.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId970.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId973.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId976.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId979.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId982.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId985.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId988.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId991.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId994.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId997.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1000.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1003.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1006.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1009.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1012.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1015.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1018.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1021.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1024.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1027.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1030.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1033.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId1036.msg" "cubeEdges_SG.gn" -na;
connectAttr "clipCube1Shape.iog.og[2]" "cubeEdges_SG.dsm" -na;
connectAttr "cubeEdges_SG.msg" "materialInfo2.sg";
connectAttr "cubeEdgesMat.msg" "materialInfo2.m";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeEdges_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeFrame_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeFaces_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeEdges_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeFrame_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeFaces_SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "cubeEdges_SG.pa" ":renderPartition.st" -na;
connectAttr "cubeFrame_SG.pa" ":renderPartition.st" -na;
connectAttr "cubeFaces_SG.pa" ":renderPartition.st" -na;
connectAttr "cubeEdgesMat.msg" ":defaultShaderList1.s" -na;
connectAttr "cubeFacesMat.msg" ":defaultShaderList1.s" -na;
connectAttr "cubeFrameMat.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of clipCube.ma
