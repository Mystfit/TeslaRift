//Maya ASCII 2014 scene
//Name: clipMatrix.ma
//Last modified: Fri, May 30, 2014 07:21:52 PM
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
	setAttr ".t" -type "double3" -14.742321916139337 10.675498185757402 4.0737295515850462 ;
	setAttr ".r" -type "double3" -36.338352728942596 640.60000000007165 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 19.197700436859321;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "cubeMatrix";
	setAttr ".t" -type "double3" -1.5 -1.5 0 ;
createNode transform -n "clipCube1" -p "cubeMatrix";
createNode mesh -n "clipCubeShape1" -p "clipCube1";
	setAttr -k off ".v";
	setAttr -s 64 ".iog";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[1].og";
	setAttr ".iog[1].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[1].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[1].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[2].og";
	setAttr ".iog[2].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[2].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[2].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[3].og";
	setAttr ".iog[3].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[3].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[3].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[4].og";
	setAttr ".iog[4].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[4].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[4].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[5].og";
	setAttr ".iog[5].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[5].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[5].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[6].og";
	setAttr ".iog[6].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[6].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[6].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[7].og";
	setAttr ".iog[7].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[7].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[7].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[8].og";
	setAttr ".iog[8].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[8].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[8].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[9].og";
	setAttr ".iog[9].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[9].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[9].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[10].og";
	setAttr ".iog[10].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[10].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[10].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[11].og";
	setAttr ".iog[11].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[11].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[11].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[12].og";
	setAttr ".iog[12].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[12].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[12].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[13].og";
	setAttr ".iog[13].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[13].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[13].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[14].og";
	setAttr ".iog[14].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[14].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[14].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[15].og";
	setAttr ".iog[15].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[15].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[15].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[16].og";
	setAttr ".iog[16].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[16].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[16].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[17].og";
	setAttr ".iog[17].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[17].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[17].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[18].og";
	setAttr ".iog[18].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[18].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[18].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[19].og";
	setAttr ".iog[19].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[19].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[19].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[20].og";
	setAttr ".iog[20].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[20].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[20].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[21].og";
	setAttr ".iog[21].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[21].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[21].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[22].og";
	setAttr ".iog[22].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[22].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[22].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[23].og";
	setAttr ".iog[23].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[23].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[23].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[24].og";
	setAttr ".iog[24].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[24].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[24].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[25].og";
	setAttr ".iog[25].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[25].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[25].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[26].og";
	setAttr ".iog[26].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[26].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[26].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[27].og";
	setAttr ".iog[27].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[27].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[27].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[28].og";
	setAttr ".iog[28].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[28].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[28].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[29].og";
	setAttr ".iog[29].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[29].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[29].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[30].og";
	setAttr ".iog[30].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[30].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[30].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[31].og";
	setAttr ".iog[31].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[31].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[31].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[32].og";
	setAttr ".iog[32].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[32].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[32].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[33].og";
	setAttr ".iog[33].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[33].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[33].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[34].og";
	setAttr ".iog[34].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[34].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[34].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[35].og";
	setAttr ".iog[35].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[35].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[35].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[36].og";
	setAttr ".iog[36].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[36].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[36].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[37].og";
	setAttr ".iog[37].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[37].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[37].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[38].og";
	setAttr ".iog[38].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[38].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[38].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[39].og";
	setAttr ".iog[39].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[39].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[39].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[40].og";
	setAttr ".iog[40].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[40].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[40].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[41].og";
	setAttr ".iog[41].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[41].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[41].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[42].og";
	setAttr ".iog[42].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[42].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[42].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[43].og";
	setAttr ".iog[43].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[43].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[43].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[44].og";
	setAttr ".iog[44].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[44].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[44].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[45].og";
	setAttr ".iog[45].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[45].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[45].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[46].og";
	setAttr ".iog[46].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[46].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[46].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[47].og";
	setAttr ".iog[47].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[47].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[47].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[48].og";
	setAttr ".iog[48].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[48].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[48].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[49].og";
	setAttr ".iog[49].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[49].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[49].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[50].og";
	setAttr ".iog[50].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[50].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[50].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[51].og";
	setAttr ".iog[51].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[51].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[51].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[52].og";
	setAttr ".iog[52].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[52].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[52].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[53].og";
	setAttr ".iog[53].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[53].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[53].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[54].og";
	setAttr ".iog[54].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[54].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[54].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[55].og";
	setAttr ".iog[55].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[55].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[55].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[56].og";
	setAttr ".iog[56].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[56].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[56].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[57].og";
	setAttr ".iog[57].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[57].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[57].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[58].og";
	setAttr ".iog[58].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[58].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[58].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[59].og";
	setAttr ".iog[59].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[59].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[59].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[60].og";
	setAttr ".iog[60].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[60].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[60].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[61].og";
	setAttr ".iog[61].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[61].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[61].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[62].og";
	setAttr ".iog[62].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[62].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[62].og[2].gcl" -type "componentList" 1 "f[68:87]";
	setAttr -s 3 ".iog[63].og";
	setAttr ".iog[63].og[0].gcl" -type "componentList" 1 "f[0:63]";
	setAttr ".iog[63].og[1].gcl" -type "componentList" 2 "f[64:67]" "f[88:89]";
	setAttr ".iog[63].og[2].gcl" -type "componentList" 1 "f[68:87]";
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
createNode transform -n "clipCube2" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "clipCube3" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 0 0 ;
createNode transform -n "clipCube4" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "clipCube5" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 1 0 ;
createNode transform -n "clipCube6" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 1 0 ;
createNode transform -n "clipCube7" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 1 0 ;
createNode transform -n "clipCube8" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 1 0 ;
createNode transform -n "clipCube9" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 2 0 ;
createNode transform -n "clipCube10" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 2 0 ;
createNode transform -n "clipCube11" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 2 0 ;
createNode transform -n "clipCube12" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 2 0 ;
createNode transform -n "clipCube13" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 3 0 ;
createNode transform -n "clipCube14" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 3 0 ;
createNode transform -n "clipCube15" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 3 0 ;
createNode transform -n "clipCube16" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 3 0 ;
createNode transform -n "clipCube17" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "clipCube18" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "clipCube19" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 0 1 ;
createNode transform -n "clipCube20" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 0 1 ;
createNode transform -n "clipCube21" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 1 1 ;
createNode transform -n "clipCube22" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 1 1 ;
createNode transform -n "clipCube23" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 1 1 ;
createNode transform -n "clipCube24" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 1 1 ;
createNode transform -n "clipCube25" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 2 1 ;
createNode transform -n "clipCube26" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 2 1 ;
createNode transform -n "clipCube27" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 2 1 ;
createNode transform -n "clipCube28" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 2 1 ;
createNode transform -n "clipCube29" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 3 1 ;
createNode transform -n "clipCube30" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 3 1 ;
createNode transform -n "clipCube31" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 3 1 ;
createNode transform -n "clipCube32" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 3 1 ;
createNode transform -n "clipCube33" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "clipCube34" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 0 2 ;
createNode transform -n "clipCube35" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 0 2 ;
createNode transform -n "clipCube36" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 0 2 ;
createNode transform -n "clipCube37" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 1 2 ;
createNode transform -n "clipCube38" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 1 2 ;
createNode transform -n "clipCube39" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 1 2 ;
createNode transform -n "clipCube40" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 1 2 ;
createNode transform -n "clipCube41" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 2 2 ;
createNode transform -n "clipCube42" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 2 2 ;
createNode transform -n "clipCube43" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 2 2 ;
createNode transform -n "clipCube44" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 2 2 ;
createNode transform -n "clipCube45" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 3 2 ;
createNode transform -n "clipCube46" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 3 2 ;
createNode transform -n "clipCube47" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 3 2 ;
createNode transform -n "clipCube48" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 3 2 ;
createNode transform -n "clipCube49" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 0 3 ;
createNode transform -n "clipCube50" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 0 3 ;
createNode transform -n "clipCube51" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 0 3 ;
createNode transform -n "clipCube52" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 0 3 ;
createNode transform -n "clipCube53" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 1 3 ;
createNode transform -n "clipCube54" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 1 3 ;
createNode transform -n "clipCube55" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 1 3 ;
createNode transform -n "clipCube56" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 1 3 ;
createNode transform -n "clipCube57" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 2 3 ;
createNode transform -n "clipCube58" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 2 3 ;
createNode transform -n "clipCube59" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 2 3 ;
createNode transform -n "clipCube60" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 2 3 ;
createNode transform -n "clipCube61" -p "cubeMatrix";
	setAttr ".t" -type "double3" 0 3 3 ;
createNode transform -n "clipCube62" -p "cubeMatrix";
	setAttr ".t" -type "double3" 1 3 3 ;
createNode transform -n "clipCube63" -p "cubeMatrix";
	setAttr ".t" -type "double3" 2 3 3 ;
createNode transform -n "clipCube64" -p "cubeMatrix";
	setAttr ".t" -type "double3" 3 3 3 ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube2" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube3" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube4" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube5" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube6" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube7" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube8" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube9" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube10" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube11" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube12" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube13" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube14" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube15" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube16" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube17" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube18" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube19" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube20" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube21" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube22" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube23" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube24" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube25" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube26" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube27" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube28" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube29" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube30" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube31" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube32" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube33" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube34" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube35" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube36" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube37" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube38" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube39" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube40" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube41" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube42" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube43" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube44" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube45" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube46" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube47" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube48" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube49" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube50" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube51" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube52" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube53" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube54" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube55" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube56" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube57" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube58" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube59" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube60" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube61" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube62" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube63" ;
parent -s -nc -r -add "|cubeMatrix|clipCube1|clipCubeShape1" "clipCube64" ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 13 ".lnk";
	setAttr -s 13 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode shadingEngine -n "cubeEdges_SG";
	setAttr ".ihi" 0;
	setAttr -s 64 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 211 ".gn";
createNode materialInfo -n "materialInfo2";
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
createNode groupId -n "icosahedron:groupId6";
	setAttr ".ihi" 0;
createNode hyperGraphInfo -n "icosahedron:nodeEditorPanel2Info";
createNode hyperView -n "icosahedron:hyperView1";
	setAttr ".vl" -type "double2" -372.48260601843805 -486.47821708076441 ;
	setAttr ".vh" -type "double2" 1043.4145439289098 234.0972646998122 ;
	setAttr ".dag" no;
createNode hyperLayout -n "icosahedron:hyperLayout1";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode groupId -n "groupId67";
	setAttr ".ihi" 0;
createNode groupId -n "groupId71";
	setAttr ".ihi" 0;
createNode groupId -n "groupId75";
	setAttr ".ihi" 0;
createNode groupId -n "groupId79";
	setAttr ".ihi" 0;
createNode groupId -n "groupId83";
	setAttr ".ihi" 0;
createNode groupId -n "groupId87";
	setAttr ".ihi" 0;
createNode groupId -n "groupId91";
	setAttr ".ihi" 0;
createNode groupId -n "groupId95";
	setAttr ".ihi" 0;
createNode groupId -n "groupId99";
	setAttr ".ihi" 0;
createNode groupId -n "groupId103";
	setAttr ".ihi" 0;
createNode groupId -n "groupId107";
	setAttr ".ihi" 0;
createNode groupId -n "groupId111";
	setAttr ".ihi" 0;
createNode groupId -n "groupId115";
	setAttr ".ihi" 0;
createNode groupId -n "groupId119";
	setAttr ".ihi" 0;
createNode groupId -n "groupId123";
	setAttr ".ihi" 0;
createNode groupId -n "groupId127";
	setAttr ".ihi" 0;
createNode groupId -n "groupId131";
	setAttr ".ihi" 0;
createNode groupId -n "groupId135";
	setAttr ".ihi" 0;
createNode groupId -n "groupId139";
	setAttr ".ihi" 0;
createNode groupId -n "groupId143";
	setAttr ".ihi" 0;
createNode groupId -n "groupId147";
	setAttr ".ihi" 0;
createNode groupId -n "groupId151";
	setAttr ".ihi" 0;
createNode groupId -n "groupId155";
	setAttr ".ihi" 0;
createNode groupId -n "groupId159";
	setAttr ".ihi" 0;
createNode groupId -n "groupId163";
	setAttr ".ihi" 0;
createNode groupId -n "groupId167";
	setAttr ".ihi" 0;
createNode groupId -n "groupId171";
	setAttr ".ihi" 0;
createNode groupId -n "groupId175";
	setAttr ".ihi" 0;
createNode groupId -n "groupId179";
	setAttr ".ihi" 0;
createNode groupId -n "groupId183";
	setAttr ".ihi" 0;
createNode groupId -n "groupId187";
	setAttr ".ihi" 0;
createNode groupId -n "groupId191";
	setAttr ".ihi" 0;
createNode groupId -n "groupId195";
	setAttr ".ihi" 0;
createNode groupId -n "groupId199";
	setAttr ".ihi" 0;
createNode groupId -n "groupId203";
	setAttr ".ihi" 0;
createNode groupId -n "groupId207";
	setAttr ".ihi" 0;
createNode groupId -n "groupId211";
	setAttr ".ihi" 0;
createNode groupId -n "groupId215";
	setAttr ".ihi" 0;
createNode groupId -n "groupId219";
	setAttr ".ihi" 0;
createNode groupId -n "groupId223";
	setAttr ".ihi" 0;
createNode groupId -n "groupId227";
	setAttr ".ihi" 0;
createNode groupId -n "groupId231";
	setAttr ".ihi" 0;
createNode groupId -n "groupId235";
	setAttr ".ihi" 0;
createNode groupId -n "groupId239";
	setAttr ".ihi" 0;
createNode groupId -n "groupId243";
	setAttr ".ihi" 0;
createNode groupId -n "groupId247";
	setAttr ".ihi" 0;
createNode groupId -n "groupId251";
	setAttr ".ihi" 0;
createNode groupId -n "groupId255";
	setAttr ".ihi" 0;
createNode groupId -n "groupId259";
	setAttr ".ihi" 0;
createNode groupId -n "groupId263";
	setAttr ".ihi" 0;
createNode groupId -n "groupId267";
	setAttr ".ihi" 0;
createNode groupId -n "groupId271";
	setAttr ".ihi" 0;
createNode groupId -n "groupId275";
	setAttr ".ihi" 0;
createNode groupId -n "groupId279";
	setAttr ".ihi" 0;
createNode groupId -n "groupId283";
	setAttr ".ihi" 0;
createNode groupId -n "groupId287";
	setAttr ".ihi" 0;
createNode groupId -n "groupId291";
	setAttr ".ihi" 0;
createNode groupId -n "groupId295";
	setAttr ".ihi" 0;
createNode groupId -n "groupId299";
	setAttr ".ihi" 0;
createNode groupId -n "groupId303";
	setAttr ".ihi" 0;
createNode groupId -n "groupId307";
	setAttr ".ihi" 0;
createNode groupId -n "groupId311";
	setAttr ".ihi" 0;
createNode groupId -n "groupId315";
	setAttr ".ihi" 0;
createNode groupId -n "groupId319";
	setAttr ".ihi" 0;
createNode groupId -n "groupId323";
	setAttr ".ihi" 0;
createNode groupId -n "groupId327";
	setAttr ".ihi" 0;
createNode groupId -n "groupId331";
	setAttr ".ihi" 0;
createNode groupId -n "groupId335";
	setAttr ".ihi" 0;
createNode groupId -n "groupId339";
	setAttr ".ihi" 0;
createNode groupId -n "groupId343";
	setAttr ".ihi" 0;
createNode groupId -n "groupId347";
	setAttr ".ihi" 0;
createNode groupId -n "groupId351";
	setAttr ".ihi" 0;
createNode groupId -n "groupId355";
	setAttr ".ihi" 0;
createNode groupId -n "groupId359";
	setAttr ".ihi" 0;
createNode groupId -n "groupId363";
	setAttr ".ihi" 0;
createNode groupId -n "groupId367";
	setAttr ".ihi" 0;
createNode groupId -n "groupId371";
	setAttr ".ihi" 0;
createNode groupId -n "groupId375";
	setAttr ".ihi" 0;
createNode groupId -n "groupId379";
	setAttr ".ihi" 0;
createNode groupId -n "groupId383";
	setAttr ".ihi" 0;
createNode groupId -n "groupId387";
	setAttr ".ihi" 0;
createNode groupId -n "groupId391";
	setAttr ".ihi" 0;
createNode groupId -n "groupId395";
	setAttr ".ihi" 0;
createNode groupId -n "groupId399";
	setAttr ".ihi" 0;
createNode groupId -n "groupId591";
	setAttr ".ihi" 0;
createNode groupId -n "groupId587";
	setAttr ".ihi" 0;
createNode groupId -n "groupId583";
	setAttr ".ihi" 0;
createNode groupId -n "groupId579";
	setAttr ".ihi" 0;
createNode groupId -n "groupId575";
	setAttr ".ihi" 0;
createNode groupId -n "groupId571";
	setAttr ".ihi" 0;
createNode groupId -n "groupId567";
	setAttr ".ihi" 0;
createNode groupId -n "groupId563";
	setAttr ".ihi" 0;
createNode groupId -n "groupId559";
	setAttr ".ihi" 0;
createNode groupId -n "groupId555";
	setAttr ".ihi" 0;
createNode groupId -n "groupId551";
	setAttr ".ihi" 0;
createNode groupId -n "groupId547";
	setAttr ".ihi" 0;
createNode groupId -n "groupId543";
	setAttr ".ihi" 0;
createNode groupId -n "groupId539";
	setAttr ".ihi" 0;
createNode groupId -n "groupId535";
	setAttr ".ihi" 0;
createNode groupId -n "groupId531";
	setAttr ".ihi" 0;
createNode groupId -n "groupId527";
	setAttr ".ihi" 0;
createNode groupId -n "groupId523";
	setAttr ".ihi" 0;
createNode groupId -n "groupId519";
	setAttr ".ihi" 0;
createNode groupId -n "groupId515";
	setAttr ".ihi" 0;
createNode groupId -n "groupId511";
	setAttr ".ihi" 0;
createNode groupId -n "groupId507";
	setAttr ".ihi" 0;
createNode groupId -n "groupId503";
	setAttr ".ihi" 0;
createNode groupId -n "groupId499";
	setAttr ".ihi" 0;
createNode groupId -n "groupId495";
	setAttr ".ihi" 0;
createNode groupId -n "groupId491";
	setAttr ".ihi" 0;
createNode groupId -n "groupId487";
	setAttr ".ihi" 0;
createNode groupId -n "groupId483";
	setAttr ".ihi" 0;
createNode groupId -n "groupId479";
	setAttr ".ihi" 0;
createNode groupId -n "groupId475";
	setAttr ".ihi" 0;
createNode groupId -n "groupId471";
	setAttr ".ihi" 0;
createNode groupId -n "groupId467";
	setAttr ".ihi" 0;
createNode groupId -n "groupId463";
	setAttr ".ihi" 0;
createNode groupId -n "groupId459";
	setAttr ".ihi" 0;
createNode groupId -n "groupId455";
	setAttr ".ihi" 0;
createNode groupId -n "groupId451";
	setAttr ".ihi" 0;
createNode groupId -n "groupId447";
	setAttr ".ihi" 0;
createNode groupId -n "groupId443";
	setAttr ".ihi" 0;
createNode groupId -n "groupId439";
	setAttr ".ihi" 0;
createNode groupId -n "groupId435";
	setAttr ".ihi" 0;
createNode groupId -n "groupId431";
	setAttr ".ihi" 0;
createNode groupId -n "groupId427";
	setAttr ".ihi" 0;
createNode groupId -n "groupId423";
	setAttr ".ihi" 0;
createNode groupId -n "groupId419";
	setAttr ".ihi" 0;
createNode groupId -n "groupId415";
	setAttr ".ihi" 0;
createNode groupId -n "groupId411";
	setAttr ".ihi" 0;
createNode groupId -n "groupId407";
	setAttr ".ihi" 0;
createNode groupId -n "groupId403";
	setAttr ".ihi" 0;
createNode groupId -n "groupId63";
	setAttr ".ihi" 0;
createNode groupId -n "groupId59";
	setAttr ".ihi" 0;
createNode groupId -n "groupId55";
	setAttr ".ihi" 0;
createNode groupId -n "groupId51";
	setAttr ".ihi" 0;
createNode groupId -n "groupId47";
	setAttr ".ihi" 0;
createNode groupId -n "groupId43";
	setAttr ".ihi" 0;
createNode groupId -n "groupId39";
	setAttr ".ihi" 0;
createNode groupId -n "groupId35";
	setAttr ".ihi" 0;
createNode groupId -n "groupId31";
	setAttr ".ihi" 0;
createNode groupId -n "groupId27";
	setAttr ".ihi" 0;
createNode groupId -n "groupId23";
	setAttr ".ihi" 0;
createNode groupId -n "groupId19";
	setAttr ".ihi" 0;
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode shadingEngine -n "cubeFrame_SG";
	setAttr ".ihi" 0;
	setAttr -s 64 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 190 ".gn";
createNode materialInfo -n "clipCube:materialInfo1";
createNode shadingEngine -n "cubeFaces_SG";
	setAttr ".ihi" 0;
	setAttr -s 64 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 337 ".gn";
createNode materialInfo -n "clipCube:clipMatrix:materialInfo1";
createNode groupId -n "clipCube:clipMatrix:icosahedron:groupId6";
	setAttr ".ihi" 0;
createNode hyperGraphInfo -n "clipCube:clipMatrix:icosahedron:nodeEditorPanel2Info";
createNode hyperView -n "clipCube:clipMatrix:icosahedron:hyperView1";
	setAttr ".vl" -type "double2" -372.48260601843805 -486.47821708076441 ;
	setAttr ".vh" -type "double2" 1043.4145439289098 234.0972646998122 ;
	setAttr ".dag" no;
createNode hyperLayout -n "clipCube:clipMatrix:icosahedron:hyperLayout1";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode groupId -n "clipCube:clipMatrix:groupId68";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId72";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId76";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId80";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId84";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId88";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId92";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId96";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId100";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId104";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId108";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId112";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId116";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId120";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId124";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId128";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId132";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId136";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId140";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId144";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId148";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId152";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId156";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId160";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId164";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId168";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId172";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId176";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId180";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId184";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId188";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId192";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId196";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId200";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId204";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId208";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId212";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId216";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId220";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId224";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId228";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId232";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId236";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId240";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId244";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId248";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId252";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId256";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId260";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId264";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId268";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId272";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId276";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId280";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId284";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId288";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId292";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId296";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId300";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId304";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId308";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId312";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId316";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId320";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId324";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId328";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId332";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId336";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId340";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId344";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId348";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId352";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId356";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId360";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId364";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId368";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId372";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId376";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId380";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId384";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId388";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId392";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId396";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId400";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId592";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId588";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId584";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId580";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId576";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId572";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId568";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId564";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId560";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId556";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId552";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId548";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId544";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId540";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId536";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId532";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId528";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId524";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId520";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId516";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId512";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId508";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId504";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId500";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId496";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId492";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId488";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId484";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId480";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId476";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId472";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId468";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId464";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId460";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId456";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId452";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId448";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId444";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId440";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId436";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId432";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId428";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId424";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId420";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId416";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId412";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId408";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId404";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId64";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId60";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId56";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId52";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId48";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId44";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId40";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId36";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId32";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId28";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId24";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId20";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId16";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId12";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId8";
	setAttr ".ihi" 0;
createNode groupId -n "clipCube:clipMatrix:groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId593";
	setAttr ".ihi" 0;
createNode groupId -n "groupId594";
	setAttr ".ihi" 0;
createNode groupId -n "groupId595";
	setAttr ".ihi" 0;
createNode groupId -n "groupId596";
	setAttr ".ihi" 0;
createNode groupId -n "groupId597";
	setAttr ".ihi" 0;
createNode groupId -n "groupId598";
	setAttr ".ihi" 0;
createNode groupId -n "groupId599";
	setAttr ".ihi" 0;
createNode groupId -n "groupId600";
	setAttr ".ihi" 0;
createNode groupId -n "groupId601";
	setAttr ".ihi" 0;
createNode groupId -n "groupId602";
	setAttr ".ihi" 0;
createNode groupId -n "groupId603";
	setAttr ".ihi" 0;
createNode groupId -n "groupId604";
	setAttr ".ihi" 0;
createNode groupId -n "groupId605";
	setAttr ".ihi" 0;
createNode groupId -n "groupId606";
	setAttr ".ihi" 0;
createNode groupId -n "groupId607";
	setAttr ".ihi" 0;
createNode groupId -n "groupId608";
	setAttr ".ihi" 0;
createNode groupId -n "groupId609";
	setAttr ".ihi" 0;
createNode groupId -n "groupId610";
	setAttr ".ihi" 0;
createNode groupId -n "groupId611";
	setAttr ".ihi" 0;
createNode groupId -n "groupId612";
	setAttr ".ihi" 0;
createNode groupId -n "groupId613";
	setAttr ".ihi" 0;
createNode groupId -n "groupId614";
	setAttr ".ihi" 0;
createNode groupId -n "groupId615";
	setAttr ".ihi" 0;
createNode groupId -n "groupId616";
	setAttr ".ihi" 0;
createNode groupId -n "groupId617";
	setAttr ".ihi" 0;
createNode groupId -n "groupId618";
	setAttr ".ihi" 0;
createNode groupId -n "groupId619";
	setAttr ".ihi" 0;
createNode groupId -n "groupId620";
	setAttr ".ihi" 0;
createNode groupId -n "groupId621";
	setAttr ".ihi" 0;
createNode groupId -n "groupId622";
	setAttr ".ihi" 0;
createNode groupId -n "groupId623";
	setAttr ".ihi" 0;
createNode groupId -n "groupId624";
	setAttr ".ihi" 0;
createNode groupId -n "groupId625";
	setAttr ".ihi" 0;
createNode groupId -n "groupId626";
	setAttr ".ihi" 0;
createNode groupId -n "groupId627";
	setAttr ".ihi" 0;
createNode groupId -n "groupId628";
	setAttr ".ihi" 0;
createNode groupId -n "groupId629";
	setAttr ".ihi" 0;
createNode groupId -n "groupId630";
	setAttr ".ihi" 0;
createNode groupId -n "groupId631";
	setAttr ".ihi" 0;
createNode groupId -n "groupId632";
	setAttr ".ihi" 0;
createNode groupId -n "groupId633";
	setAttr ".ihi" 0;
createNode groupId -n "groupId634";
	setAttr ".ihi" 0;
createNode groupId -n "groupId635";
	setAttr ".ihi" 0;
createNode groupId -n "groupId636";
	setAttr ".ihi" 0;
createNode groupId -n "groupId637";
	setAttr ".ihi" 0;
createNode groupId -n "groupId638";
	setAttr ".ihi" 0;
createNode groupId -n "groupId639";
	setAttr ".ihi" 0;
createNode groupId -n "groupId640";
	setAttr ".ihi" 0;
createNode groupId -n "groupId641";
	setAttr ".ihi" 0;
createNode groupId -n "groupId642";
	setAttr ".ihi" 0;
createNode groupId -n "groupId643";
	setAttr ".ihi" 0;
createNode groupId -n "groupId644";
	setAttr ".ihi" 0;
createNode groupId -n "groupId645";
	setAttr ".ihi" 0;
createNode groupId -n "groupId646";
	setAttr ".ihi" 0;
createNode groupId -n "groupId647";
	setAttr ".ihi" 0;
createNode groupId -n "groupId648";
	setAttr ".ihi" 0;
createNode groupId -n "groupId649";
	setAttr ".ihi" 0;
createNode groupId -n "groupId650";
	setAttr ".ihi" 0;
createNode groupId -n "groupId651";
	setAttr ".ihi" 0;
createNode groupId -n "groupId652";
	setAttr ".ihi" 0;
createNode groupId -n "groupId653";
	setAttr ".ihi" 0;
createNode groupId -n "groupId654";
	setAttr ".ihi" 0;
createNode groupId -n "groupId655";
	setAttr ".ihi" 0;
createNode groupId -n "groupId656";
	setAttr ".ihi" 0;
createNode groupId -n "groupId657";
	setAttr ".ihi" 0;
createNode groupId -n "groupId658";
	setAttr ".ihi" 0;
createNode groupId -n "groupId659";
	setAttr ".ihi" 0;
createNode groupId -n "groupId660";
	setAttr ".ihi" 0;
createNode groupId -n "groupId661";
	setAttr ".ihi" 0;
createNode groupId -n "groupId662";
	setAttr ".ihi" 0;
createNode groupId -n "groupId663";
	setAttr ".ihi" 0;
createNode groupId -n "groupId664";
	setAttr ".ihi" 0;
createNode groupId -n "groupId665";
	setAttr ".ihi" 0;
createNode groupId -n "groupId666";
	setAttr ".ihi" 0;
createNode groupId -n "groupId667";
	setAttr ".ihi" 0;
createNode groupId -n "groupId668";
	setAttr ".ihi" 0;
createNode groupId -n "groupId669";
	setAttr ".ihi" 0;
createNode groupId -n "groupId670";
	setAttr ".ihi" 0;
createNode groupId -n "groupId671";
	setAttr ".ihi" 0;
createNode groupId -n "groupId672";
	setAttr ".ihi" 0;
createNode groupId -n "groupId673";
	setAttr ".ihi" 0;
createNode groupId -n "groupId674";
	setAttr ".ihi" 0;
createNode groupId -n "groupId675";
	setAttr ".ihi" 0;
createNode groupId -n "groupId676";
	setAttr ".ihi" 0;
createNode groupId -n "groupId677";
	setAttr ".ihi" 0;
createNode groupId -n "groupId678";
	setAttr ".ihi" 0;
createNode groupId -n "groupId679";
	setAttr ".ihi" 0;
createNode groupId -n "groupId680";
	setAttr ".ihi" 0;
createNode groupId -n "groupId681";
	setAttr ".ihi" 0;
createNode groupId -n "groupId682";
	setAttr ".ihi" 0;
createNode groupId -n "groupId683";
	setAttr ".ihi" 0;
createNode groupId -n "groupId684";
	setAttr ".ihi" 0;
createNode groupId -n "groupId685";
	setAttr ".ihi" 0;
createNode groupId -n "groupId686";
	setAttr ".ihi" 0;
createNode groupId -n "groupId687";
	setAttr ".ihi" 0;
createNode groupId -n "groupId688";
	setAttr ".ihi" 0;
createNode groupId -n "groupId689";
	setAttr ".ihi" 0;
createNode groupId -n "groupId690";
	setAttr ".ihi" 0;
createNode groupId -n "groupId691";
	setAttr ".ihi" 0;
createNode groupId -n "groupId692";
	setAttr ".ihi" 0;
createNode groupId -n "groupId693";
	setAttr ".ihi" 0;
createNode groupId -n "groupId694";
	setAttr ".ihi" 0;
createNode groupId -n "groupId695";
	setAttr ".ihi" 0;
createNode groupId -n "groupId696";
	setAttr ".ihi" 0;
createNode groupId -n "groupId697";
	setAttr ".ihi" 0;
createNode groupId -n "groupId698";
	setAttr ".ihi" 0;
createNode groupId -n "groupId699";
	setAttr ".ihi" 0;
createNode groupId -n "groupId700";
	setAttr ".ihi" 0;
createNode groupId -n "groupId701";
	setAttr ".ihi" 0;
createNode groupId -n "groupId702";
	setAttr ".ihi" 0;
createNode groupId -n "groupId703";
	setAttr ".ihi" 0;
createNode groupId -n "groupId704";
	setAttr ".ihi" 0;
createNode groupId -n "groupId705";
	setAttr ".ihi" 0;
createNode groupId -n "groupId706";
	setAttr ".ihi" 0;
createNode groupId -n "groupId707";
	setAttr ".ihi" 0;
createNode groupId -n "groupId708";
	setAttr ".ihi" 0;
createNode groupId -n "groupId709";
	setAttr ".ihi" 0;
createNode groupId -n "groupId710";
	setAttr ".ihi" 0;
createNode groupId -n "groupId711";
	setAttr ".ihi" 0;
createNode groupId -n "groupId712";
	setAttr ".ihi" 0;
createNode groupId -n "groupId713";
	setAttr ".ihi" 0;
createNode groupId -n "groupId714";
	setAttr ".ihi" 0;
createNode groupId -n "groupId715";
	setAttr ".ihi" 0;
createNode groupId -n "groupId716";
	setAttr ".ihi" 0;
createNode groupId -n "groupId717";
	setAttr ".ihi" 0;
createNode groupId -n "groupId718";
	setAttr ".ihi" 0;
createNode groupId -n "groupId719";
	setAttr ".ihi" 0;
createNode groupId -n "groupId720";
	setAttr ".ihi" 0;
createNode groupId -n "groupId721";
	setAttr ".ihi" 0;
createNode groupId -n "groupId722";
	setAttr ".ihi" 0;
createNode groupId -n "groupId723";
	setAttr ".ihi" 0;
createNode groupId -n "groupId724";
	setAttr ".ihi" 0;
createNode groupId -n "groupId725";
	setAttr ".ihi" 0;
createNode groupId -n "groupId726";
	setAttr ".ihi" 0;
createNode groupId -n "groupId727";
	setAttr ".ihi" 0;
createNode groupId -n "groupId728";
	setAttr ".ihi" 0;
createNode groupId -n "groupId729";
	setAttr ".ihi" 0;
createNode groupId -n "groupId730";
	setAttr ".ihi" 0;
createNode groupId -n "groupId731";
	setAttr ".ihi" 0;
createNode groupId -n "groupId732";
	setAttr ".ihi" 0;
createNode groupId -n "groupId733";
	setAttr ".ihi" 0;
createNode groupId -n "groupId734";
	setAttr ".ihi" 0;
createNode groupId -n "groupId735";
	setAttr ".ihi" 0;
createNode groupId -n "groupId736";
	setAttr ".ihi" 0;
createNode groupId -n "groupId737";
	setAttr ".ihi" 0;
createNode groupId -n "groupId738";
	setAttr ".ihi" 0;
createNode groupId -n "groupId739";
	setAttr ".ihi" 0;
createNode groupId -n "groupId740";
	setAttr ".ihi" 0;
createNode groupId -n "groupId741";
	setAttr ".ihi" 0;
createNode groupId -n "groupId742";
	setAttr ".ihi" 0;
createNode groupId -n "groupId743";
	setAttr ".ihi" 0;
createNode groupId -n "groupId744";
	setAttr ".ihi" 0;
createNode groupId -n "groupId745";
	setAttr ".ihi" 0;
createNode groupId -n "groupId746";
	setAttr ".ihi" 0;
createNode groupId -n "groupId747";
	setAttr ".ihi" 0;
createNode groupId -n "groupId748";
	setAttr ".ihi" 0;
createNode groupId -n "groupId749";
	setAttr ".ihi" 0;
createNode groupId -n "groupId750";
	setAttr ".ihi" 0;
createNode groupId -n "groupId751";
	setAttr ".ihi" 0;
createNode groupId -n "groupId752";
	setAttr ".ihi" 0;
createNode groupId -n "groupId753";
	setAttr ".ihi" 0;
createNode groupId -n "groupId754";
	setAttr ".ihi" 0;
createNode groupId -n "groupId755";
	setAttr ".ihi" 0;
createNode groupId -n "groupId756";
	setAttr ".ihi" 0;
createNode groupId -n "groupId757";
	setAttr ".ihi" 0;
createNode groupId -n "groupId758";
	setAttr ".ihi" 0;
createNode groupId -n "groupId759";
	setAttr ".ihi" 0;
createNode groupId -n "groupId760";
	setAttr ".ihi" 0;
createNode groupId -n "groupId761";
	setAttr ".ihi" 0;
createNode groupId -n "groupId762";
	setAttr ".ihi" 0;
createNode groupId -n "groupId763";
	setAttr ".ihi" 0;
createNode groupId -n "groupId764";
	setAttr ".ihi" 0;
createNode groupId -n "groupId765";
	setAttr ".ihi" 0;
createNode groupId -n "groupId766";
	setAttr ".ihi" 0;
createNode groupId -n "groupId767";
	setAttr ".ihi" 0;
createNode groupId -n "groupId768";
	setAttr ".ihi" 0;
createNode groupId -n "groupId769";
	setAttr ".ihi" 0;
createNode groupId -n "groupId770";
	setAttr ".ihi" 0;
createNode groupId -n "groupId771";
	setAttr ".ihi" 0;
createNode groupId -n "groupId772";
	setAttr ".ihi" 0;
createNode groupId -n "groupId773";
	setAttr ".ihi" 0;
createNode groupId -n "groupId774";
	setAttr ".ihi" 0;
createNode groupId -n "groupId775";
	setAttr ".ihi" 0;
createNode groupId -n "groupId776";
	setAttr ".ihi" 0;
createNode groupId -n "groupId777";
	setAttr ".ihi" 0;
createNode groupId -n "groupId778";
	setAttr ".ihi" 0;
createNode groupId -n "groupId779";
	setAttr ".ihi" 0;
createNode groupId -n "groupId780";
	setAttr ".ihi" 0;
createNode groupId -n "groupId781";
	setAttr ".ihi" 0;
createNode groupId -n "groupId782";
	setAttr ".ihi" 0;
createNode groupId -n "groupId783";
	setAttr ".ihi" 0;
createNode groupId -n "groupId784";
	setAttr ".ihi" 0;
createNode groupId -n "groupId785";
	setAttr ".ihi" 0;
createNode groupId -n "groupId786";
	setAttr ".ihi" 0;
createNode groupId -n "groupId787";
	setAttr ".ihi" 0;
createNode groupId -n "groupId788";
	setAttr ".ihi" 0;
createNode groupId -n "groupId789";
	setAttr ".ihi" 0;
createNode groupId -n "groupId790";
	setAttr ".ihi" 0;
createNode groupId -n "groupId791";
	setAttr ".ihi" 0;
createNode groupId -n "groupId792";
	setAttr ".ihi" 0;
createNode groupId -n "groupId793";
	setAttr ".ihi" 0;
createNode groupId -n "groupId794";
	setAttr ".ihi" 0;
createNode groupId -n "groupId795";
	setAttr ".ihi" 0;
createNode groupId -n "groupId796";
	setAttr ".ihi" 0;
createNode groupId -n "groupId797";
	setAttr ".ihi" 0;
createNode groupId -n "groupId798";
	setAttr ".ihi" 0;
createNode groupId -n "groupId799";
	setAttr ".ihi" 0;
createNode groupId -n "groupId800";
	setAttr ".ihi" 0;
createNode groupId -n "groupId801";
	setAttr ".ihi" 0;
createNode groupId -n "groupId802";
	setAttr ".ihi" 0;
createNode groupId -n "groupId803";
	setAttr ".ihi" 0;
createNode groupId -n "groupId804";
	setAttr ".ihi" 0;
createNode groupId -n "groupId805";
	setAttr ".ihi" 0;
createNode groupId -n "groupId806";
	setAttr ".ihi" 0;
createNode groupId -n "groupId807";
	setAttr ".ihi" 0;
createNode groupId -n "groupId808";
	setAttr ".ihi" 0;
createNode groupId -n "groupId809";
	setAttr ".ihi" 0;
createNode groupId -n "groupId810";
	setAttr ".ihi" 0;
createNode groupId -n "groupId811";
	setAttr ".ihi" 0;
createNode groupId -n "groupId812";
	setAttr ".ihi" 0;
createNode groupId -n "groupId813";
	setAttr ".ihi" 0;
createNode groupId -n "groupId814";
	setAttr ".ihi" 0;
createNode groupId -n "groupId815";
	setAttr ".ihi" 0;
createNode groupId -n "groupId816";
	setAttr ".ihi" 0;
createNode groupId -n "groupId817";
	setAttr ".ihi" 0;
createNode groupId -n "groupId818";
	setAttr ".ihi" 0;
createNode groupId -n "groupId819";
	setAttr ".ihi" 0;
createNode groupId -n "groupId820";
	setAttr ".ihi" 0;
createNode groupId -n "groupId821";
	setAttr ".ihi" 0;
createNode groupId -n "groupId822";
	setAttr ".ihi" 0;
createNode groupId -n "groupId823";
	setAttr ".ihi" 0;
createNode groupId -n "groupId824";
	setAttr ".ihi" 0;
createNode groupId -n "groupId825";
	setAttr ".ihi" 0;
createNode groupId -n "groupId826";
	setAttr ".ihi" 0;
createNode groupId -n "groupId827";
	setAttr ".ihi" 0;
createNode groupId -n "groupId828";
	setAttr ".ihi" 0;
createNode groupId -n "groupId829";
	setAttr ".ihi" 0;
createNode groupId -n "groupId830";
	setAttr ".ihi" 0;
createNode groupId -n "groupId831";
	setAttr ".ihi" 0;
createNode groupId -n "groupId832";
	setAttr ".ihi" 0;
createNode groupId -n "groupId833";
	setAttr ".ihi" 0;
createNode groupId -n "groupId834";
	setAttr ".ihi" 0;
createNode groupId -n "groupId835";
	setAttr ".ihi" 0;
createNode groupId -n "groupId836";
	setAttr ".ihi" 0;
createNode groupId -n "groupId837";
	setAttr ".ihi" 0;
createNode groupId -n "groupId838";
	setAttr ".ihi" 0;
createNode groupId -n "groupId839";
	setAttr ".ihi" 0;
createNode groupId -n "groupId840";
	setAttr ".ihi" 0;
createNode groupId -n "groupId841";
	setAttr ".ihi" 0;
createNode groupId -n "groupId842";
	setAttr ".ihi" 0;
createNode groupId -n "groupId843";
	setAttr ".ihi" 0;
createNode groupId -n "groupId844";
	setAttr ".ihi" 0;
createNode groupId -n "groupId845";
	setAttr ".ihi" 0;
createNode groupId -n "groupId846";
	setAttr ".ihi" 0;
createNode groupId -n "groupId847";
	setAttr ".ihi" 0;
createNode lambert -n "cubeEdgesMat";
	setAttr ".c" -type "float3" 1 0 0 ;
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode lambert -n "cubeFacesMat";
	setAttr ".c" -type "float3" 0 0.11449838 1 ;
createNode shadingEngine -n "lambert5SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode lambert -n "cubeFrameMat";
	setAttr ".c" -type "float3" 1 0.87493098 0 ;
createNode shadingEngine -n "lambert6SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode groupId -n "groupId848";
	setAttr ".ihi" 0;
createNode groupId -n "groupId849";
	setAttr ".ihi" 0;
createNode groupId -n "groupId850";
	setAttr ".ihi" 0;
createNode groupId -n "groupId851";
	setAttr ".ihi" 0;
createNode groupId -n "groupId852";
	setAttr ".ihi" 0;
createNode groupId -n "groupId853";
	setAttr ".ihi" 0;
createNode groupId -n "groupId854";
	setAttr ".ihi" 0;
createNode groupId -n "groupId855";
	setAttr ".ihi" 0;
createNode groupId -n "groupId856";
	setAttr ".ihi" 0;
createNode groupId -n "groupId857";
	setAttr ".ihi" 0;
createNode groupId -n "groupId858";
	setAttr ".ihi" 0;
createNode groupId -n "groupId859";
	setAttr ".ihi" 0;
createNode groupId -n "groupId860";
	setAttr ".ihi" 0;
createNode groupId -n "groupId861";
	setAttr ".ihi" 0;
createNode groupId -n "groupId862";
	setAttr ".ihi" 0;
createNode groupId -n "groupId863";
	setAttr ".ihi" 0;
createNode groupId -n "groupId864";
	setAttr ".ihi" 0;
createNode groupId -n "groupId865";
	setAttr ".ihi" 0;
createNode groupId -n "groupId866";
	setAttr ".ihi" 0;
createNode groupId -n "groupId867";
	setAttr ".ihi" 0;
createNode groupId -n "groupId868";
	setAttr ".ihi" 0;
createNode groupId -n "groupId869";
	setAttr ".ihi" 0;
createNode groupId -n "groupId870";
	setAttr ".ihi" 0;
createNode groupId -n "groupId871";
	setAttr ".ihi" 0;
createNode groupId -n "groupId872";
	setAttr ".ihi" 0;
createNode groupId -n "groupId873";
	setAttr ".ihi" 0;
createNode groupId -n "groupId874";
	setAttr ".ihi" 0;
createNode groupId -n "groupId875";
	setAttr ".ihi" 0;
createNode groupId -n "groupId876";
	setAttr ".ihi" 0;
createNode groupId -n "groupId877";
	setAttr ".ihi" 0;
createNode groupId -n "groupId878";
	setAttr ".ihi" 0;
createNode groupId -n "groupId879";
	setAttr ".ihi" 0;
createNode groupId -n "groupId880";
	setAttr ".ihi" 0;
createNode groupId -n "groupId881";
	setAttr ".ihi" 0;
createNode groupId -n "groupId882";
	setAttr ".ihi" 0;
createNode groupId -n "groupId883";
	setAttr ".ihi" 0;
createNode groupId -n "groupId884";
	setAttr ".ihi" 0;
createNode groupId -n "groupId885";
	setAttr ".ihi" 0;
createNode groupId -n "groupId886";
	setAttr ".ihi" 0;
createNode groupId -n "groupId887";
	setAttr ".ihi" 0;
createNode groupId -n "groupId888";
	setAttr ".ihi" 0;
createNode groupId -n "groupId889";
	setAttr ".ihi" 0;
createNode groupId -n "groupId890";
	setAttr ".ihi" 0;
createNode groupId -n "groupId891";
	setAttr ".ihi" 0;
createNode groupId -n "groupId892";
	setAttr ".ihi" 0;
createNode groupId -n "groupId893";
	setAttr ".ihi" 0;
createNode groupId -n "groupId894";
	setAttr ".ihi" 0;
createNode groupId -n "groupId895";
	setAttr ".ihi" 0;
createNode groupId -n "groupId896";
	setAttr ".ihi" 0;
createNode groupId -n "groupId897";
	setAttr ".ihi" 0;
createNode groupId -n "groupId898";
	setAttr ".ihi" 0;
createNode groupId -n "groupId899";
	setAttr ".ihi" 0;
createNode groupId -n "groupId900";
	setAttr ".ihi" 0;
createNode groupId -n "groupId901";
	setAttr ".ihi" 0;
createNode groupId -n "groupId902";
	setAttr ".ihi" 0;
createNode groupId -n "groupId903";
	setAttr ".ihi" 0;
createNode groupId -n "groupId904";
	setAttr ".ihi" 0;
createNode groupId -n "groupId905";
	setAttr ".ihi" 0;
createNode groupId -n "groupId906";
	setAttr ".ihi" 0;
createNode groupId -n "groupId907";
	setAttr ".ihi" 0;
createNode groupId -n "groupId908";
	setAttr ".ihi" 0;
createNode groupId -n "groupId909";
	setAttr ".ihi" 0;
createNode groupId -n "groupId910";
	setAttr ".ihi" 0;
createNode groupId -n "groupId911";
	setAttr ".ihi" 0;
createNode groupId -n "groupId912";
	setAttr ".ihi" 0;
createNode groupId -n "groupId913";
	setAttr ".ihi" 0;
createNode groupId -n "groupId914";
	setAttr ".ihi" 0;
createNode groupId -n "groupId915";
	setAttr ".ihi" 0;
createNode groupId -n "groupId916";
	setAttr ".ihi" 0;
createNode groupId -n "groupId917";
	setAttr ".ihi" 0;
createNode groupId -n "groupId918";
	setAttr ".ihi" 0;
createNode groupId -n "groupId919";
	setAttr ".ihi" 0;
createNode groupId -n "groupId920";
	setAttr ".ihi" 0;
createNode groupId -n "groupId921";
	setAttr ".ihi" 0;
createNode groupId -n "groupId922";
	setAttr ".ihi" 0;
createNode groupId -n "groupId923";
	setAttr ".ihi" 0;
createNode groupId -n "groupId924";
	setAttr ".ihi" 0;
createNode groupId -n "groupId925";
	setAttr ".ihi" 0;
createNode groupId -n "groupId926";
	setAttr ".ihi" 0;
createNode groupId -n "groupId927";
	setAttr ".ihi" 0;
createNode groupId -n "groupId928";
	setAttr ".ihi" 0;
createNode groupId -n "groupId929";
	setAttr ".ihi" 0;
createNode groupId -n "groupId930";
	setAttr ".ihi" 0;
createNode groupId -n "groupId931";
	setAttr ".ihi" 0;
createNode groupId -n "groupId932";
	setAttr ".ihi" 0;
createNode groupId -n "groupId933";
	setAttr ".ihi" 0;
createNode groupId -n "groupId934";
	setAttr ".ihi" 0;
createNode groupId -n "groupId935";
	setAttr ".ihi" 0;
createNode groupId -n "groupId936";
	setAttr ".ihi" 0;
createNode groupId -n "groupId937";
	setAttr ".ihi" 0;
createNode groupId -n "groupId938";
	setAttr ".ihi" 0;
createNode groupId -n "groupId939";
	setAttr ".ihi" 0;
createNode groupId -n "groupId940";
	setAttr ".ihi" 0;
createNode groupId -n "groupId941";
	setAttr ".ihi" 0;
createNode groupId -n "groupId942";
	setAttr ".ihi" 0;
createNode groupId -n "groupId943";
	setAttr ".ihi" 0;
createNode groupId -n "groupId944";
	setAttr ".ihi" 0;
createNode groupId -n "groupId945";
	setAttr ".ihi" 0;
createNode groupId -n "groupId946";
	setAttr ".ihi" 0;
createNode groupId -n "groupId947";
	setAttr ".ihi" 0;
createNode groupId -n "groupId948";
	setAttr ".ihi" 0;
createNode groupId -n "groupId949";
	setAttr ".ihi" 0;
createNode groupId -n "groupId950";
	setAttr ".ihi" 0;
createNode groupId -n "groupId951";
	setAttr ".ihi" 0;
createNode groupId -n "groupId952";
	setAttr ".ihi" 0;
createNode groupId -n "groupId953";
	setAttr ".ihi" 0;
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
createNode groupId -n "groupId1019";
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
select -ne :time1;
	setAttr ".o" 20;
	setAttr ".unw" 20;
select -ne :renderPartition;
	setAttr -s 8 ".st";
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupId593.id" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[0].gid";
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId594.id" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId847.id" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId848.id" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId849.id" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId850.id" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId851.id" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId852.id" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId853.id" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId854.id" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId855.id" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId856.id" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId857.id" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId858.id" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId859.id" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId860.id" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId861.id" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId862.id" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId863.id" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId864.id" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId865.id" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId866.id" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId867.id" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId868.id" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId869.id" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId870.id" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId871.id" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId872.id" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId873.id" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId874.id" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId875.id" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId876.id" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId877.id" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId878.id" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId879.id" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId880.id" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId881.id" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId882.id" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId883.id" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId884.id" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId885.id" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId886.id" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId887.id" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId888.id" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId889.id" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId890.id" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId891.id" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId892.id" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId893.id" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId894.id" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId895.id" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId896.id" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId897.id" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId898.id" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId899.id" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId900.id" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId901.id" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId902.id" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId903.id" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId904.id" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId905.id" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId906.id" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId907.id" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId908.id" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId909.id" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId910.id" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId911.id" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId912.id" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId913.id" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId914.id" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId915.id" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId916.id" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId917.id" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId918.id" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId919.id" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId920.id" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId921.id" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId922.id" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId923.id" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId924.id" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId925.id" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId926.id" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId927.id" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId928.id" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId929.id" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId930.id" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId931.id" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId932.id" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId933.id" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId934.id" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId935.id" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId936.id" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId937.id" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId938.id" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId939.id" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId940.id" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId941.id" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId942.id" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId943.id" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId944.id" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId945.id" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId946.id" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId947.id" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId948.id" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId949.id" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId950.id" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId951.id" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId952.id" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId953.id" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId954.id" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId955.id" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId956.id" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId957.id" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId958.id" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId959.id" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId960.id" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId961.id" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId962.id" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId963.id" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId964.id" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId965.id" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId966.id" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId967.id" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId968.id" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId969.id" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId970.id" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId971.id" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId972.id" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId973.id" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId974.id" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId975.id" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId976.id" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId977.id" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId978.id" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId979.id" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId980.id" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId981.id" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId982.id" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId983.id" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId984.id" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId985.id" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId986.id" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId987.id" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId988.id" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId989.id" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId990.id" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId991.id" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId992.id" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId993.id" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId994.id" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId995.id" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId996.id" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId997.id" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId998.id" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId999.id" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1000.id" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1001.id" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1002.id" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1003.id" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1004.id" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1005.id" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1006.id" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1007.id" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1008.id" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1009.id" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1010.id" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1011.id" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1012.id" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1013.id" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1014.id" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1015.id" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1016.id" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1017.id" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1018.id" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1019.id" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1020.id" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1021.id" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1022.id" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1023.id" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1024.id" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1025.id" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1026.id" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1027.id" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1028.id" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1029.id" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1030.id" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1031.id" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1032.id" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1033.id" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[2].gco"
		;
connectAttr "groupId1034.id" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[0].gid"
		;
connectAttr "cubeFrame_SG.mwc" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[0].gco"
		;
connectAttr "groupId1035.id" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[1].gid"
		;
connectAttr "cubeFaces_SG.mwc" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[1].gco"
		;
connectAttr "groupId1036.id" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[2].gid"
		;
connectAttr "cubeEdges_SG.mwc" "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[2].gco"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeEdges_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeFrame_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "cubeFaces_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeEdges_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeFrame_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "cubeFaces_SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "cubeEdgesMat.oc" "cubeEdges_SG.ss";
connectAttr "groupId7.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId11.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId15.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId19.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId23.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId27.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId31.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId35.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId39.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId43.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId47.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId51.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId55.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId59.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId63.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId67.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId71.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId75.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId79.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId83.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId87.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId91.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId95.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId99.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId103.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId107.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId111.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId115.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId119.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId123.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId127.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId131.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId135.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId139.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId143.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId147.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId151.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId155.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId159.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId163.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId167.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId171.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId175.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId179.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId183.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId187.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId191.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId195.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId199.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId203.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId207.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId211.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId215.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId219.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId223.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId227.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId231.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId235.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId239.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId243.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId247.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId251.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId255.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId259.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId263.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId267.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId271.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId275.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId279.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId283.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId287.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId291.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId295.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId299.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId303.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId307.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId311.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId315.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId319.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId323.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId327.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId331.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId335.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId339.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId343.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId347.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId351.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId355.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId359.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId363.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId367.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId371.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId375.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId379.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId383.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId387.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId391.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId395.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId399.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId403.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId407.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId411.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId415.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId419.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId423.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId427.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId431.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId435.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId439.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId443.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId447.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId451.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId455.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId459.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId463.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId467.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId471.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId475.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId479.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId483.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId487.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId491.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId495.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId499.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId503.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId507.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId511.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId515.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId519.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId523.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId527.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId531.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId535.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId539.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId543.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId547.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId551.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId555.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId559.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId563.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId567.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId571.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId575.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId579.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId583.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId587.msg" "cubeEdges_SG.gn" -na;
connectAttr "groupId591.msg" "cubeEdges_SG.gn" -na;
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
connectAttr "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[2]" "cubeEdges_SG.dsm"
		 -na;
connectAttr "cubeEdges_SG.msg" "materialInfo2.sg";
connectAttr "cubeEdgesMat.msg" "materialInfo2.m";
connectAttr "icosahedron:hyperView1.msg" "icosahedron:nodeEditorPanel2Info.b[0]"
		;
connectAttr "icosahedron:hyperLayout1.msg" "icosahedron:hyperView1.hl";
connectAttr "cubeFrameMat.oc" "cubeFrame_SG.ss";
connectAttr "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[0]" "cubeFrame_SG.dsm"
		 -na;
connectAttr "groupId593.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId595.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId597.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId599.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId601.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId603.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId605.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId607.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId609.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId611.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId613.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId615.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId617.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId619.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId621.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId623.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId625.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId627.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId629.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId631.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId633.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId635.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId637.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId639.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId641.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId643.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId645.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId647.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId649.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId651.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId653.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId655.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId657.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId659.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId661.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId663.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId665.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId667.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId669.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId671.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId673.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId675.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId677.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId679.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId681.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId683.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId685.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId687.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId689.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId691.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId693.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId695.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId697.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId699.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId701.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId703.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId705.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId707.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId709.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId711.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId713.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId715.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId717.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId719.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId721.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId723.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId725.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId727.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId729.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId731.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId733.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId735.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId737.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId739.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId741.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId743.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId745.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId747.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId749.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId751.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId753.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId755.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId757.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId759.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId761.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId763.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId765.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId767.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId769.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId771.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId773.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId775.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId777.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId779.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId781.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId783.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId785.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId787.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId789.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId791.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId793.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId795.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId797.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId799.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId801.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId803.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId805.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId807.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId809.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId811.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId813.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId815.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId817.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId819.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId821.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId823.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId825.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId827.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId829.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId831.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId833.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId835.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId837.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId839.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId841.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId843.msg" "cubeFrame_SG.gn" -na;
connectAttr "groupId845.msg" "cubeFrame_SG.gn" -na;
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
connectAttr "|cubeMatrix|clipCube1|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube2|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube3|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube4|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube5|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube6|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube7|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube8|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube9|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm" 
		-na;
connectAttr "|cubeMatrix|clipCube10|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube11|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube12|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube13|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube14|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube15|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube16|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube17|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube18|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube19|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube20|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube21|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube22|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube23|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube24|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube25|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube26|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube27|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube28|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube29|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube30|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube31|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube32|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube33|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube34|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube35|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube36|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube37|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube38|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube39|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube40|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube41|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube42|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube43|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube44|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube45|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube46|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube47|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube48|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube49|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube50|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube51|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube52|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube53|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube54|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube55|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube56|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube57|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube58|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube59|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube60|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube61|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube62|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube63|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "|cubeMatrix|clipCube64|clipCubeShape1.iog.og[1]" "cubeFaces_SG.dsm"
		 -na;
connectAttr "clipCube:clipMatrix:groupId8.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId12.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId16.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId20.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId24.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId28.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId32.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId36.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId40.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId44.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId48.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId52.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId56.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId60.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId64.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId68.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId72.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId76.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId80.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId84.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId88.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId92.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId96.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId100.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId104.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId108.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId112.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId116.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId120.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId124.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId128.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId132.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId136.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId140.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId144.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId148.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId152.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId156.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId160.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId164.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId168.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId172.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId176.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId180.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId184.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId188.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId192.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId196.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId200.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId204.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId208.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId212.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId216.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId220.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId224.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId228.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId232.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId236.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId240.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId244.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId248.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId252.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId256.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId260.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId264.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId268.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId272.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId276.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId280.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId284.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId288.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId292.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId296.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId300.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId304.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId308.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId312.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId316.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId320.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId324.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId328.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId332.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId336.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId340.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId344.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId348.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId352.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId356.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId360.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId364.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId368.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId372.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId376.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId380.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId384.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId388.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId392.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId396.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId400.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId404.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId408.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId412.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId416.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId420.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId424.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId428.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId432.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId436.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId440.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId444.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId448.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId452.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId456.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId460.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId464.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId468.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId472.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId476.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId480.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId484.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId488.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId492.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId496.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId500.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId504.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId508.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId512.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId516.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId520.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId524.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId528.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId532.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId536.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId540.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId544.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId548.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId552.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId556.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId560.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId564.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId568.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId572.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId576.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId580.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId584.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId588.msg" "cubeFaces_SG.gn" -na;
connectAttr "clipCube:clipMatrix:groupId592.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId594.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId596.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId598.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId600.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId602.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId604.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId606.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId608.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId610.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId612.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId614.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId616.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId618.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId620.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId622.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId624.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId626.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId628.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId630.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId632.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId634.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId636.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId638.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId640.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId642.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId644.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId646.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId648.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId650.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId652.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId654.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId656.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId658.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId660.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId662.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId664.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId666.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId668.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId670.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId672.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId674.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId676.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId678.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId680.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId682.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId684.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId686.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId688.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId690.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId692.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId694.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId696.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId698.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId700.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId702.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId704.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId706.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId708.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId710.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId712.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId714.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId716.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId718.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId720.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId722.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId724.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId726.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId728.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId730.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId732.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId734.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId736.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId738.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId740.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId742.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId744.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId746.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId748.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId750.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId752.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId754.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId756.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId758.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId760.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId762.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId764.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId766.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId768.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId770.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId772.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId774.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId776.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId778.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId780.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId782.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId784.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId786.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId788.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId790.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId792.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId794.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId796.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId798.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId800.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId802.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId804.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId806.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId808.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId810.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId812.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId814.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId816.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId818.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId820.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId822.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId824.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId826.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId828.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId830.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId832.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId834.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId836.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId838.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId840.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId842.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId844.msg" "cubeFaces_SG.gn" -na;
connectAttr "groupId846.msg" "cubeFaces_SG.gn" -na;
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
connectAttr "clipCube:clipMatrix:icosahedron:hyperView1.msg" "clipCube:clipMatrix:icosahedron:nodeEditorPanel2Info.b[0]"
		;
connectAttr "clipCube:clipMatrix:icosahedron:hyperLayout1.msg" "clipCube:clipMatrix:icosahedron:hyperView1.hl"
		;
connectAttr "cubeEdgesMat.oc" "lambert4SG.ss";
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "cubeEdgesMat.msg" "materialInfo3.m";
connectAttr "cubeFacesMat.oc" "lambert5SG.ss";
connectAttr "lambert5SG.msg" "materialInfo4.sg";
connectAttr "cubeFacesMat.msg" "materialInfo4.m";
connectAttr "cubeFrameMat.oc" "lambert6SG.ss";
connectAttr "lambert6SG.msg" "materialInfo5.sg";
connectAttr "cubeFrameMat.msg" "materialInfo5.m";
connectAttr "cubeEdges_SG.pa" ":renderPartition.st" -na;
connectAttr "cubeFrame_SG.pa" ":renderPartition.st" -na;
connectAttr "cubeFaces_SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "lambert6SG.pa" ":renderPartition.st" -na;
connectAttr "cubeEdgesMat.msg" ":defaultShaderList1.s" -na;
connectAttr "cubeFacesMat.msg" ":defaultShaderList1.s" -na;
connectAttr "cubeFrameMat.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of clipMatrix.ma
