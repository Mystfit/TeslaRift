//Maya ASCII 2014 scene
//Name: techGloves.ma
//Last modified: Wed, Jun 25, 2014 06:03:03 PM
//Codeset: 1252
requires maya "2014";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOutputPass" -nodeType "mentalrayRenderPass"
		 -nodeType "mentalrayUserBuffer" -nodeType "mentalraySubdivApprox" -nodeType "mentalrayCurveApprox"
		 -nodeType "mentalraySurfaceApprox" -nodeType "mentalrayDisplaceApprox" -nodeType "mentalrayOptions"
		 -nodeType "mentalrayGlobals" -nodeType "mentalrayItemsList" -nodeType "mentalrayShader"
		 -nodeType "mentalrayUserData" -nodeType "mentalrayText" -nodeType "mentalrayTessellation"
		 -nodeType "mentalrayPhenomenon" -nodeType "mentalrayLightProfile" -nodeType "mentalrayVertexColors"
		 -nodeType "mentalrayIblShape" -nodeType "mapVizShape" -nodeType "mentalrayCCMeshProxy"
		 -nodeType "cylindricalLightLocator" -nodeType "discLightLocator" -nodeType "rectangularLightLocator"
		 -nodeType "sphericalLightLocator" -nodeType "abcimport" -nodeType "mia_physicalsun"
		 -nodeType "mia_physicalsky" -nodeType "mia_material" -nodeType "mia_material_x" -nodeType "mia_roundcorners"
		 -nodeType "mia_exposure_simple" -nodeType "mia_portal_light" -nodeType "mia_light_surface"
		 -nodeType "mia_exposure_photographic" -nodeType "mia_exposure_photographic_rev" -nodeType "mia_lens_bokeh"
		 -nodeType "mia_envblur" -nodeType "mia_ciesky" -nodeType "mia_photometric_light"
		 -nodeType "mib_texture_vector" -nodeType "mib_texture_remap" -nodeType "mib_texture_rotate"
		 -nodeType "mib_bump_basis" -nodeType "mib_bump_map" -nodeType "mib_passthrough_bump_map"
		 -nodeType "mib_bump_map2" -nodeType "mib_lookup_spherical" -nodeType "mib_lookup_cube1"
		 -nodeType "mib_lookup_cube6" -nodeType "mib_lookup_background" -nodeType "mib_lookup_cylindrical"
		 -nodeType "mib_texture_lookup" -nodeType "mib_texture_lookup2" -nodeType "mib_texture_filter_lookup"
		 -nodeType "mib_texture_checkerboard" -nodeType "mib_texture_polkadot" -nodeType "mib_texture_polkasphere"
		 -nodeType "mib_texture_turbulence" -nodeType "mib_texture_wave" -nodeType "mib_reflect"
		 -nodeType "mib_refract" -nodeType "mib_transparency" -nodeType "mib_continue" -nodeType "mib_opacity"
		 -nodeType "mib_twosided" -nodeType "mib_refraction_index" -nodeType "mib_dielectric"
		 -nodeType "mib_ray_marcher" -nodeType "mib_illum_lambert" -nodeType "mib_illum_phong"
		 -nodeType "mib_illum_ward" -nodeType "mib_illum_ward_deriv" -nodeType "mib_illum_blinn"
		 -nodeType "mib_illum_cooktorr" -nodeType "mib_illum_hair" -nodeType "mib_volume"
		 -nodeType "mib_color_alpha" -nodeType "mib_color_average" -nodeType "mib_color_intensity"
		 -nodeType "mib_color_interpolate" -nodeType "mib_color_mix" -nodeType "mib_color_spread"
		 -nodeType "mib_geo_cube" -nodeType "mib_geo_torus" -nodeType "mib_geo_sphere" -nodeType "mib_geo_cone"
		 -nodeType "mib_geo_cylinder" -nodeType "mib_geo_square" -nodeType "mib_geo_instance"
		 -nodeType "mib_geo_instance_mlist" -nodeType "mib_geo_add_uv_texsurf" -nodeType "mib_photon_basic"
		 -nodeType "mib_light_infinite" -nodeType "mib_light_point" -nodeType "mib_light_spot"
		 -nodeType "mib_light_photometric" -nodeType "mib_cie_d" -nodeType "mib_blackbody"
		 -nodeType "mib_shadow_transparency" -nodeType "mib_lens_stencil" -nodeType "mib_lens_clamp"
		 -nodeType "mib_lightmap_write" -nodeType "mib_lightmap_sample" -nodeType "mib_amb_occlusion"
		 -nodeType "mib_fast_occlusion" -nodeType "mib_map_get_scalar" -nodeType "mib_map_get_integer"
		 -nodeType "mib_map_get_vector" -nodeType "mib_map_get_color" -nodeType "mib_map_get_transform"
		 -nodeType "mib_map_get_scalar_array" -nodeType "mib_map_get_integer_array" -nodeType "mib_fg_occlusion"
		 -nodeType "mib_bent_normal_env" -nodeType "mib_glossy_reflection" -nodeType "mib_glossy_refraction"
		 -nodeType "builtin_bsdf_architectural" -nodeType "builtin_bsdf_architectural_comp"
		 -nodeType "builtin_bsdf_carpaint" -nodeType "builtin_bsdf_ashikhmin" -nodeType "builtin_bsdf_lambert"
		 -nodeType "builtin_bsdf_mirror" -nodeType "builtin_bsdf_phong" -nodeType "contour_store_function"
		 -nodeType "contour_store_function_simple" -nodeType "contour_contrast_function_levels"
		 -nodeType "contour_contrast_function_simple" -nodeType "contour_shader_simple" -nodeType "contour_shader_silhouette"
		 -nodeType "contour_shader_maxcolor" -nodeType "contour_shader_curvature" -nodeType "contour_shader_factorcolor"
		 -nodeType "contour_shader_depthfade" -nodeType "contour_shader_framefade" -nodeType "contour_shader_layerthinner"
		 -nodeType "contour_shader_widthfromcolor" -nodeType "contour_shader_widthfromlightdir"
		 -nodeType "contour_shader_widthfromlight" -nodeType "contour_shader_combi" -nodeType "contour_only"
		 -nodeType "contour_composite" -nodeType "contour_ps" -nodeType "mi_metallic_paint"
		 -nodeType "mi_metallic_paint_x" -nodeType "mi_bump_flakes" -nodeType "mi_car_paint_phen"
		 -nodeType "mi_metallic_paint_output_mixer" -nodeType "mi_car_paint_phen_x" -nodeType "physical_lens_dof"
		 -nodeType "physical_light" -nodeType "dgs_material" -nodeType "dgs_material_photon"
		 -nodeType "dielectric_material" -nodeType "dielectric_material_photon" -nodeType "oversampling_lens"
		 -nodeType "path_material" -nodeType "parti_volume" -nodeType "parti_volume_photon"
		 -nodeType "transmat" -nodeType "transmat_photon" -nodeType "mip_rayswitch" -nodeType "mip_rayswitch_advanced"
		 -nodeType "mip_rayswitch_environment" -nodeType "mip_card_opacity" -nodeType "mip_motionblur"
		 -nodeType "mip_motion_vector" -nodeType "mip_matteshadow" -nodeType "mip_cameramap"
		 -nodeType "mip_mirrorball" -nodeType "mip_grayball" -nodeType "mip_gamma_gain" -nodeType "mip_render_subset"
		 -nodeType "mip_matteshadow_mtl" -nodeType "mip_binaryproxy" -nodeType "mip_rayswitch_stage"
		 -nodeType "mip_fgshooter" -nodeType "mib_ptex_lookup" -nodeType "misss_physical"
		 -nodeType "misss_physical_phen" -nodeType "misss_fast_shader" -nodeType "misss_fast_shader_x"
		 -nodeType "misss_fast_shader2" -nodeType "misss_fast_shader2_x" -nodeType "misss_skin_specular"
		 -nodeType "misss_lightmap_write" -nodeType "misss_lambert_gamma" -nodeType "misss_call_shader"
		 -nodeType "misss_set_normal" -nodeType "misss_fast_lmap_maya" -nodeType "misss_fast_simple_maya"
		 -nodeType "misss_fast_skin_maya" -nodeType "misss_fast_skin_phen" -nodeType "misss_fast_skin_phen_d"
		 -nodeType "misss_mia_skin2_phen" -nodeType "misss_mia_skin2_phen_d" -nodeType "misss_lightmap_phen"
		 -nodeType "misss_mia_skin2_surface_phen" -nodeType "surfaceSampler" -nodeType "mib_data_bool"
		 -nodeType "mib_data_int" -nodeType "mib_data_scalar" -nodeType "mib_data_vector"
		 -nodeType "mib_data_color" -nodeType "mib_data_string" -nodeType "mib_data_texture"
		 -nodeType "mib_data_shader" -nodeType "mib_data_bool_array" -nodeType "mib_data_int_array"
		 -nodeType "mib_data_scalar_array" -nodeType "mib_data_vector_array" -nodeType "mib_data_color_array"
		 -nodeType "mib_data_string_array" -nodeType "mib_data_texture_array" -nodeType "mib_data_shader_array"
		 -nodeType "mib_data_get_bool" -nodeType "mib_data_get_int" -nodeType "mib_data_get_scalar"
		 -nodeType "mib_data_get_vector" -nodeType "mib_data_get_color" -nodeType "mib_data_get_string"
		 -nodeType "mib_data_get_texture" -nodeType "mib_data_get_shader" -nodeType "mib_data_get_shader_bool"
		 -nodeType "mib_data_get_shader_int" -nodeType "mib_data_get_shader_scalar" -nodeType "mib_data_get_shader_vector"
		 -nodeType "mib_data_get_shader_color" -nodeType "user_ibl_env" -nodeType "user_ibl_rect"
		 -nodeType "mia_material_x_passes" -nodeType "mi_metallic_paint_x_passes" -nodeType "mi_car_paint_phen_x_passes"
		 -nodeType "misss_fast_shader_x_passes" -dataType "byteArray" "Mayatomr" "2014.0 - 3.11.1.9 ";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".t" -type "double3" -0.14927770965133308 3.5829173185942302 -0.47412092862593025 ;
	setAttr ".r" -type "double3" -77.399974266335292 -180.00002199217354 -1.890447608460055e-006 ;
	setAttr ".rp" -type "double3" 0 0 -1.1102230246251565e-016 ;
	setAttr ".rpt" -type "double3" -4.2383487121097484e-016 -5.5621834162299848e-016 
		7.3016839086591199e-017 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".coi" 3.8483007567864749;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.065940006176413712 0.022170828301290024 0.96278266088858477 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" -0.20430491511021234 100.10117786231005 -0.41585853218883234 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.0526315789473684;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" -0.10194682305250752 0.014243421052631579 100.10050177302283 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.4136595394736844;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 100.10359758178883 0.0053412828947368499 -0.10073682772483622 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.4118791118421052;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "root";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.015645977945217826 0.089021381578947373 -0.44084605594059406 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -176.94224833204433 -47.228867733636747 175.83791228769857 ;
	setAttr ".bps" -type "matrix" -0.67728063612412615 0.04928583326967368 0.73407209902720949 0
		 0.033420956500576061 0.99878471486047182 -0.036223376812117833 0 -0.73496529142394607 -1.5265566588595902e-016 -0.67810472672155453 0
		 0.015645977945217826 0.089021381578947373 -0.44084605594059406 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "index0" -p "root";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.51099951335492033 -1.9196444919991282e-017 -2.7877694745491963e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.38802184886072333 42.644285811158674 -2.2522523416340077 ;
	setAttr ".bps" -type "matrix" -0.00087271464250726627 0.0073531057152183407 0.99997258472694817 0
		 6.417336517350325e-006 0.99997296555273973 -0.0073531029148903252 0 -0.999999619163913 2.6355150698777747e-015 -0.00087273823650307891 0
		 -0.33044409751892129 0.11420641839504234 -0.065735570570264967 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "index1" -p "index0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.51196163725747079 4.9966690983138883e-018 -1.1506183498308742e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.76049955610785214 4.0131013063266243 -11.161043627614008 ;
	setAttr ".bps" -type "matrix" 0.069129200428093021 -0.18589115722295751 0.98013551681105926 0
		 0.013078460148440456 0.98257034235026131 0.18543051586466555 0 -0.99752198348122567 -8.6126204120727469e-015 0.070355472222719137 0
		 -0.33089089393615778 0.11797092643593279 0.44621203111912838 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "index2" -p "index1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.39622156587787916 -1.5029959878034262e-016 -1.7203213250989995e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.7001750044752767 2.1222482539982925 -7.550480219106313 ;
	setAttr ".bps" -type "matrix" 0.10370546758295085 -0.31317382610263328 0.94401659447153741 0
		 0.034198147778055937 0.94969582216846549 0.31130103122911856 0 -0.9940199508470402 4.2126688436012377e-015 0.10919861408483272 0
		 -0.30350041389465282 0.044316841038201382 0.83456286036253058 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "index3" -p "index2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.23770941299352161 -4.5044686593629204e-017 -1.1159212471981346e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 83.730878744066729 18.250604489206342 ;
	setAttr ".bps" -type "matrix" 1.0000000000000002 -8.0524407813276594e-015 5.6926685587654902e-014 0
		 8.0699336102441066e-015 1 3.4861002973229915e-014 0 -5.6954441163270531e-014 -3.4789563432528874e-014 1 0
		 -0.27884864807129078 -0.030127525329590829 1.0589644908905029 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "middle0" -p "root";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.35762544263088486 0.09643107366371681 -0.17162798125039513 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.57399986774350331 42.240442023558693 -1.9711920630020476 ;
	setAttr ".bps" -type "matrix" -0.007890216538573136 0.01103200590361455 0.99990801543377827 0
		 8.7050212824527073e-005 0.99993914557124064 -0.011031662454853913 0 -0.99996886796801587 -7.7914375536477223e-016 -0.007890696722414603 0
		 -0.097203381359580926 0.20296113193035098 -0.065434510397152201 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "middle1" -p "middle0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.53422124077533728 -1.9507456899031332e-017 -7.5986418880041755e-018 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.50273889712340414 2.3812991838320583 -12.556935323946734 ;
	setAttr ".bps" -type "matrix" 0.033834508825752972 -0.20644987034906082 0.97787201465497309 0
		 0.0071389224900778054 0.9784571789469666 0.20632640343112821 0 -0.99940195206843629 -3.8290264029082515e-014 0.034579447679211131 0
		 -0.10141850262880354 0.20885466381242077 0.4687375902690859 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "middle2" -p "middle1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.41848582029808751 -2.8361475489709085e-017 2.9038287073350821e-018 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.38360163908301054 0.99213361969093583 -9.22551602859083 ;
	setAttr ".bps" -type "matrix" 0.049552283122038923 -0.36059238668836613 0.93140630333908581 0
		 0.019156991331154977 0.93272350172084117 0.36008315570261018 0 -0.99858779329637892 -2.9907164652190364e-015 0.053126444257720264 0
		 -0.087259240448475439 0.12245832046896021 0.8779631624685158 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "middle3" -p "middle2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.26794406354241906 -1.7051783619379958e-016 -2.6029296007441371e-017 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.9867637029017161e-014 86.954645271697558 21.136580969324651 ;
	setAttr ".bps" -type "matrix" 1 5.0792002506347074e-014 3.1918911957973251e-016 0
		 -5.075457865673937e-014 1 -8.9817190147679243e-013 0 -4.3021142204224816e-016 8.9812256309263409e-013 1.0000000000000002 0
		 -0.073982000350951885 0.025839731097219945 1.1275279521942134 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "ring0" -p "root";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.17444455777541806 0.10547028142776317 -0.37041056152841872 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.15250472142685115 42.776859351211826 -2.6004613251326649 ;
	setAttr ".bps" -type "matrix" 0.0014200295544244956 0.0028766992006705595 0.99999485404564648 0
		 -4.0850147895268342e-006 0.99999586229229409 -0.002876696300236212 0 -0.9999989917491805 -2.7835236587091313e-015 0.0014200354301160956 0
		 0.17326188087463337 0.20296113193035081 -0.065434510397151646 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "ring1" -p "ring0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.51535957471869354 -4.3930447322193605e-017 -5.5511151231257359e-017 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.19481792149796018 -1.5957986498906416 -7.1260683082135037 ;
	setAttr ".bps" -type "matrix" -0.026439291019003726 -0.12115095577976957 0.99228192052665209 0
		 -0.003226914523939558 0.99263409467620456 0.12110797293740358 0 -0.99964521251945582 2.3553018940799505e-014 -0.026635485483324318 0
		 0.1739937067018896 0.20444366640700196 0.44992241230469476 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "ring2" -p "ring1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.38613303013681538 -5.0152478973430691e-017 -1.2057012580114784e-017 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.1293950395367713 -2.6003277181479092 -16.528022857857877 ;
	setAttr ".bps" -type "matrix" -0.069756283551086706 -0.39812349500951677 0.91467575873997453 0
		 -0.030274339729157791 0.91733182803247759 0.39697075664657755 0 -0.9971045708746421 8.9464470109838797e-015 -0.076042585048747932 0
		 0.1637846231460526 0.15766328074778815 0.83307523702762953 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "ring3" -p "ring2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.247905643750639 1.3761527681329692e-017 -9.6235850020506237e-018 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999271259227 85.638870885881659 -156.53908387685988 ;
	setAttr ".bps" -type "matrix" 1 6.9888533739004128e-009 -1.9247201055172525e-011 0
		 -6.9888533857933717e-009 0.99999999999999922 -3.5548152354276285e-008 0 1.9246951254991984e-011 3.5548152185460998e-008 0.99999999999999956 0
		 0.14649164676666834 0.058966219425199598 1.059828519821167 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "pinky0" -p "root";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.0033868493153578769 0.025113069820340769 -0.55862671707347411 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.5721895913323589 42.123294288020205 -6.6567910318568728 ;
	setAttr ".bps" -type "matrix" -0.0088661681999010478 -0.049566002128752146 0.99873149669689698 0
		 -0.00044000133933507629 0.99877085031200852 0.049564049126850473 0 -0.99996059795387593 4.4059887472634543e-014 -0.0088770794593466817 0
		 0.42935037612914967 0.1139370081680614 -0.065434510397151591 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "pinky1" -p "pinky0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.44719442278383792 -3.1202082812576681e-017 -1.1179806112604468e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.62860551668587616 -6.6182290704760165 -2.5968713002426447 ;
	setAttr ".bps" -type "matrix" -0.12402689021420539 -0.094136328422531029 0.98780346333413871 0
		 -0.0117275142553397 0.99555931599836156 0.093402964290569684 0 -0.99220955241984277 2.2793440126440225e-014 -0.12458011112057883 0
		 0.42538547515869063 0.091771368456391583 0.3811926447842558 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "pinky2" -p "pinky1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.34305088233255449 4.7607873522947172e-018 4.7607873522947172e-018 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.0670231603169937 -2.8430451197673205 -15.179918050076841 ;
	setAttr ".bps" -type "matrix" -0.16569870383128721 -0.35110719473290569 0.92155720243261141 0
		 -0.062133734505570554 0.93633526997907623 0.34556571188357482 0 -0.98421711963622294 1.6926614454031457e-016 -0.17696514180758136 0
		 0.3828379410377446 0.059477817931495196 0.7200594944521852 1;
	setAttr -l on ".radi" 0.5;
createNode joint -n "pinky3" -p "pinky2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.17992715718301056 4.163336342344337e-017 -2.7755575615628914e-017 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 43.344514499789426 104.50428801645532 79.027434338271533 ;
	setAttr ".bps" -type "matrix" 0.97602509327900056 -0.21348272609907845 0.042428091484586566 0
		 0.21740090594018205 0.94669913254656013 -0.23769223490046693 0 0.010576548875069924 0.24121749126648442 0.97041344720742451 0
		 0.35302424430847151 -0.0036959014832981876 0.88587266206741322 1;
	setAttr -l on ".radi" 0.5;
createNode transform -n "techHand";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "polySurface4" -p "techHand";
createNode transform -n "polySurface8" -p "polySurface4";
createNode transform -n "polySurface12" -p "polySurface8";
createNode transform -n "hand_base" -p "polySurface12";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "hand_baseShape" -p "hand_base";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".vcs" 2;
createNode mesh -n "hand_baseShape16Orig" -p "hand_base";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 205 ".uvst[0].uvsp[0:204]" -type "float2" 0.3758415 0.010206012
		 0.36809278 0.04873652 0.18157101 0.059440427 0.18239221 0.023348175 0.35744631 0.096879065
		 0.18588996 0.10755521 0.16151524 0.054855794 0.16114718 0.019757248 0.37096202 0.10292732
		 0.38386065 0.055356018 0.3428598 0.13862792 0.19206592 0.14961837 0.16278794 0.10242578
		 0.14350393 0.053491317 0.14443836 0.016721718 0.3560816 0.1464587 0.32411352 0.18112868
		 0.20312139 0.19518384 0.16495678 0.14641339 0.14232886 0.10070984 0.12760156 0.018754102
		 0.12545855 0.053775102 0.33746108 0.19059484 0.30222926 0.22471726 0.21212402 0.23605055
		 0.17000464 0.19273323 0.1412687 0.14381656 0.12181284 0.10119815 0.10619438 0.021075286
		 0.10519134 0.057156831 0.31828961 0.23312578 0.26021621 0.2840876 0.22034788 0.28535324
		 0.17441216 0.23482019 0.14008716 0.1917685 0.11748688 0.14498712 0.098483577 0.10494094
		 0.61629879 0.010513563 0.62390965 0.049083076 0.29522756 0.27921253 0.17748749 0.2861352
		 0.1390579 0.23276949 0.11016551 0.19093302 0.090252593 0.14657347 0.63434416 0.097297058
		 0.13771892 0.28557473 0.10365796 0.23269171 0.076973483 0.1914224 0.64872223 0.13913316
		 0.6208064 0.10328664 0.60811943 0.055645101 0.097992927 0.28373104 0.065942422 0.23169413
		 0.66724491 0.18174256 0.63546616 0.146901 0.055253919 0.28042734 0.68889207 0.22545499
		 0.65385115 0.19114077 0.015491989 0.27684188 0.67278779 0.233778 0.69559318 0.27999014
		 0.42733663 0.019069782 0.45193106 0.011826782 0.44911361 0.049230386 0.42470878 0.058516331
		 0.47497404 0.01038924 0.47357088 0.047769189 0.44278067 0.10266217 0.41471648 0.10809253
		 0.49604952 0.0093499776 0.49599648 0.046236828 0.47061747 0.09944547 0.43392259 0.15470341
		 0.40048206 0.15258527 0.51712447 0.010437069 0.51841921 0.047817625 0.49588972 0.098357745
		 0.4647702 0.15629533 0.41862911 0.19720471 0.38091624 0.19525279 0.54017025 0.011926299
		 0.54287469 0.049333274 0.52115768 0.099504866 0.49575084 0.15680608 0.45862436 0.20094047
		 0.40567809 0.23884249 0.36200339 0.23627335 0.56475842 0.019228481 0.5672524 0.058683433
		 0.54898208 0.10279098 0.52673388 0.15637636 0.49564338 0.20174274 0.45154077 0.23998982
		 0.39288718 0.28841275 0.33984044 0.28441232 0.57702678 0.10829924 0.5575881 0.15486826
		 0.53266436 0.20104426 0.49555433 0.24086262 0.44579571 0.29222637 0.31472364 0.28119239
		 0.33631918 0.23614815 0.59103805 0.15285377 0.57266933 0.19743128 0.53956389 0.24012014
		 0.49545145 0.29373351 0.61037999 0.19560701 0.58541226 0.23912254 0.54509562 0.29237261
		 0.62907207 0.23671636 0.59797138 0.28873914 0.65097988 0.28496003 0.65474671 0.23670882
		 0.67609388 0.28186762 0.25685874 0.021539504 0.27735782 0.014295276 0.27635682 0.047944777
		 0.25390127 0.051341411 0.29836416 0.014295276 0.29922497 0.047944777 0.27635682 0.080033839
		 0.25149944 0.079413891 0.31381404 0.022716457 0.31345332 0.047944777 0.29922497 0.080033839
		 0.27635682 0.10478526 0.25088981 0.10478485 0.31345332 0.079811096 0.29922497 0.10478526
		 0.25149944 0.13015646 0.27635682 0.12953669 0.31345332 0.10478526 0.29922497 0.12953669
		 0.25390127 0.15822905 0.27635682 0.1616258 0.31345332 0.12975949 0.29922497 0.1616258
		 0.25685874 0.18803102 0.27735782 0.19527513 0.31345332 0.1616258 0.29836416 0.19527513
		 0.31381404 0.18685406 0.19928673 0.030910177 0.40161413 0.058625348 0.40887612 0.015257573
		 0.20231318 0.066703036 0.21030229 0.11419873 0.39040995 0.10614563 0.39093143 0.013484178
		 0.22185001 0.15491319 0.37524939 0.15011667 0.23840669 0.19461752 0.35590327 0.19382474
		 0.088928223 0.027615808 0.084106475 0.063175946 0.67722285 0.16236128 0.69293094
		 0.16243367 0.71514738 0.18755141 0.70153934 0.18160532 0.65979779 0.13705654 0.67514944
		 0.13537338 0.70373338 0.16049485 0.7260626 0.18634681 0.64944482 0.11024888 0.66434658
		 0.10613991 0.68583274 0.13268705 0.71278453 0.15254776 0.73128444 0.17426203 0.64459002
		 0.08192385 0.65863502 0.075503491 0.67494321 0.10321834 0.64658833 0.051259957 0.66004443
		 0.043152072 0.669186 0.07233724 0.65763474 0.022278711 0.66628897 0.010203943 0.67031789
		 0.039290205 0.67628384 0.0056619793 0.68695205 0.01337336 0.68215752 0.041495644
		 0.69579327 0.12658805 0.71245801 0.15229832 0.68612659 0.10013569 0.68086529 0.072471373
		 0.68200874 0.041856594 0.073768094 0.11012769 0.060248476 0.15011352 0.58324033 0.015467536
		 0.59034878 0.058858208 0.60119557 0.013743401 0.041768331 0.18880209 0.60134047 0.10643161
		 0.71786231 0.27310812 0.61627895 0.15047716 0.024954196 0.22907582 0.6353938 0.19428444
		 0.27299085 0.2722075 0.25317213 0.23582318 0.96810704 0.87030488 0.97108901 0.88378847
		 0.97357458 0.87142354 0.97532827 0.87935042 0.97065967 0.90819085 0.97609061 0.90851331
		 0.97604758 0.88754296;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 152 ".vt[0:151]"  0.24831274 0.024673097 -0.94860893 0.17232969 0.032213237 -0.98565811
		 0.10075584 0.038336903 -0.99429762 0.036070198 0.039891012 -0.99813581 0.25265542 0.0462607 -0.83449376
		 0.17742011 0.055066794 -0.87358689 0.10320273 0.06135536 -0.88552463 0.0360699 0.064563125 -0.89097154
		 0.27555099 0.067183577 -0.68241465 0.1927124 0.094043538 -0.70994729 0.11023381 0.1079196 -0.73059654
		 0.036069363 0.11146709 -0.73707533 0.31598279 0.086684175 -0.54842836 0.21704558 0.13052556 -0.55516446
		 0.12613943 0.15286848 -0.55990553 0.03606949 0.1596943 -0.56263661 0.38339004 0.10414439 -0.42166144
		 0.26527271 0.15665804 -0.42558771 0.14545926 0.18498142 -0.4238466 0.036069483 0.19267513 -0.42409337
		 0.4381561 0.11048117 -0.28629273 0.30613396 0.18070987 -0.29036659 0.16834345 0.2154603 -0.29723573
		 0.036069244 0.22524458 -0.29825509 0.46519306 0.089713171 -0.12277836 0.33804986 0.19136655 -0.12323648
		 0.18751457 0.25311705 -0.12556726 0.036069244 0.26982653 -0.12600201 0.26678231 -0.027591597 -0.93732983
		 0.18098983 -0.025039531 -0.9831143 0.27657399 -0.012367979 -0.81000322 0.099175364 -0.025039516 -0.99810201
		 0.036069423 -0.025039524 -1.0027475357 0.30431494 0.0032537971 -0.66401279 0.34713826 0.021782473 -0.53163117
		 0.41704831 0.03924264 -0.40486377 0.47547665 0.045579538 -0.26949501 0.36019501 0.11551496 -0.14874667
		 0.50986725 0.025359452 -0.11575216 0.19952652 0.17701946 -0.15202737 0.036069244 0.19335854 -0.15389204
		 0.26678231 -0.081148744 -0.92575908 0.18098983 -0.083343953 -0.96843594 0.27657399 -0.068574548 -0.80019903
		 0.099175364 -0.083343953 -0.98153859 0.036069363 -0.083343953 -0.98820549 0.30431494 -0.052935094 -0.64948094
		 0.34710142 -0.034403801 -0.51708907 0.41724679 -0.016943634 -0.39032167 0.47540662 -0.010606714 -0.25495291
		 0.36013243 0.058670685 -0.13674742 0.51294333 -0.030656487 -0.10097092 0.19893673 0.12008636 -0.14037138
		 0.036067575 0.13667275 -0.14128095 0.24531212 -0.12053996 -0.92360824 0.18098983 -0.11962026 -0.95070249
		 0.1769788 -0.099168748 -0.83043396 0.25153974 -0.11038297 -0.80193198 0.099743634 -0.11962026 -0.96305257
		 0.10289934 -0.094355129 -0.84679699 0.036069304 -0.11962026 -0.97178864 0.036069244 -0.092031494 -0.85054225
		 0.19337919 -0.063355505 -0.67138517 0.27630851 -0.089579046 -0.64255333 0.11054906 -0.052705199 -0.69061172
		 0.036069363 -0.050012007 -0.69547963 0.21776703 -0.032414779 -0.5327667 0.31692019 -0.070187226 -0.50782728
		 0.12195328 -0.012796648 -0.54624313 0.036069244 -0.0083725378 -0.55417728 0.26471332 1.0960473e-005 -0.38411993
		 0.3840256 -0.052727044 -0.38106084 0.14572111 0.025367379 -0.39384264 0.036069244 0.032688379 -0.39552909
		 0.30400434 0.023838505 -0.24976599 0.43900135 -0.046390116 -0.24569166 0.1677511 0.058912575 -0.25538456
		 0.036069244 0.067740783 -0.26009697 0.3373107 0.034497052 -0.082629263 0.45366386 -0.062240154 -0.082646787
		 0.18640354 0.096245676 -0.084965289 0.036067456 0.11295514 -0.085400641 -0.1731734 -0.12053996 -0.92360824
		 -0.17940101 -0.11038297 -0.80193198 -0.10484013 -0.099168748 -0.83043396 -0.10885105 -0.11962026 -0.95070249
		 -0.030760618 -0.094355129 -0.84679699 -0.02760491 -0.11962026 -0.96305257 -0.20416966 -0.089579046 -0.64255333
		 -0.12124047 -0.063355505 -0.67138517 -0.038410336 -0.052705199 -0.69061172 -0.24478146 -0.070187226 -0.50782728
		 -0.1456283 -0.032414779 -0.5327667 -0.049814552 -0.012796648 -0.54624313 -0.31188688 -0.052727044 -0.38106084
		 -0.19257459 1.0960473e-005 -0.38411993 -0.073582381 0.025367379 -0.39384264 -0.36686251 -0.046390109 -0.24569166
		 -0.23186561 0.023838505 -0.24976599 -0.095612377 0.058912575 -0.25538456 -0.38152513 -0.062240154 -0.082646787
		 -0.26517186 0.034497052 -0.082629263 -0.11426482 0.096245676 -0.084965289 -0.17617401 0.024673097 -0.94860893
		 -0.10019097 0.032213237 -0.98565811 -0.10528132 0.055066794 -0.87358689 -0.18051669 0.0462607 -0.83449376
		 -0.028617116 0.038336903 -0.99429762 -0.031064006 0.06135536 -0.88552463 -0.12057307 0.094043538 -0.70994729
		 -0.20341226 0.067183577 -0.68241465 -0.038095087 0.1079196 -0.73059654 -0.14490685 0.13052556 -0.55516446
		 -0.24384412 0.086684175 -0.54842836 -0.054000705 0.15286848 -0.55990553 -0.19313392 0.15665804 -0.42558771
		 -0.31125125 0.10414439 -0.42166144 -0.073320538 0.18498142 -0.4238466 -0.23399529 0.18070987 -0.29036659
		 -0.36601743 0.11048117 -0.28629273 -0.096204728 0.2154603 -0.29723573 -0.26591119 0.19136655 -0.12323648
		 -0.39305434 0.089713171 -0.12277836 -0.11537585 0.25311705 -0.12556726 -0.19464359 -0.027591597 -0.93732983
		 -0.10885116 -0.025039531 -0.9831143 -0.2044352 -0.012367979 -0.81000322 -0.027036639 -0.025039516 -0.99810201
		 -0.23217627 0.0032537971 -0.66401279 -0.27499947 0.021782473 -0.53163117 -0.34490952 0.03924264 -0.40486377
		 -0.40333787 0.045579538 -0.26949501 -0.28805622 0.11551496 -0.14874667 -0.43772849 0.025359452 -0.11575216
		 -0.12738773 0.17701946 -0.15202737 -0.19464359 -0.081148744 -0.92575908 -0.10885105 -0.083343953 -0.96843594
		 -0.2044352 -0.068574548 -0.80019903 -0.027036639 -0.083343953 -0.98153859 -0.23217615 -0.052935094 -0.64948094
		 -0.27496275 -0.034403801 -0.51708907 -0.34510812 -0.016943634 -0.39032167 -0.40326795 -0.010606714 -0.25495291
		 -0.28799376 0.058670685 -0.13674742 -0.44080457 -0.030656487 -0.10097092 -0.126798 0.12008636 -0.14037138
		 0.48141006 0.032175161 -0.038339652 0.4795872 0.023021532 -0.031162597 0.50897586 0.039098155 -0.03361813
		 0.49766651 0.041067734 -0.039697297 0.46811575 0.079792991 -0.041155525 0.47454885 0.086082228 -0.035450615;
	setAttr -s 295 ".ed";
	setAttr ".ed[0:165]"  0 1 0 0 4 0 1 2 0 1 5 0 2 3 0 2 6 0 3 7 0 4 5 0 4 8 0
		 5 6 0 5 9 0 6 7 0 6 10 0 7 11 0 8 9 0 8 12 0 9 10 0 9 13 0 10 11 0 10 14 0 11 15 0
		 12 13 0 12 16 0 13 14 0 13 17 0 14 15 0 14 18 0 15 19 0 16 17 0 16 20 0 17 18 0 17 21 0
		 18 19 0 18 22 0 19 23 0 20 21 0 20 24 0 21 22 0 21 25 0 22 23 0 22 26 0 23 27 0 24 25 0
		 25 26 0 26 27 0 0 28 0 1 29 0 28 29 0 4 30 0 28 30 0 2 31 0 29 31 0 3 32 0 31 32 0
		 8 33 0 30 33 0 12 34 0 33 34 0 16 35 0 34 35 0 20 36 0 35 36 0 25 37 0 24 38 0 38 37 0
		 36 38 0 26 39 0 37 39 0 27 40 0 39 40 0 28 41 0 29 42 0 41 42 0 30 43 0 41 43 0 31 44 0
		 42 44 0 32 45 0 44 45 0 33 46 0 43 46 0 34 47 0 46 47 0 35 48 0 47 48 0 36 49 0 48 49 0
		 37 50 0 38 51 0 51 50 0 49 51 0 39 52 0 50 52 0 40 53 0 52 53 0 41 54 0 42 55 0 54 55 0
		 55 56 0 43 57 0 57 56 0 54 57 0 44 58 0 55 58 0 58 59 0 56 59 0 45 60 0 58 60 0 60 61 0
		 59 61 0 56 62 0 46 63 0 63 62 0 57 63 0 59 64 0 62 64 0 61 65 0 64 65 0 62 66 0 47 67 0
		 67 66 0 63 67 0 64 68 0 66 68 0 65 69 0 68 69 0 66 70 0 48 71 0 71 70 0 67 71 0 68 72 0
		 70 72 0 69 73 0 72 73 0 70 74 0 49 75 0 75 74 0 71 75 0 72 76 0 74 76 0 73 77 0 76 77 0
		 50 78 0 74 78 0 51 79 0 79 78 0 75 79 0 52 80 0 76 80 0 78 80 0 53 81 0 77 81 0 80 81 0
		 82 83 0 83 84 0 85 84 0 82 85 0 84 86 0 87 86 0 85 87 0 86 61 0 87 60 0 83 88 0 88 89 0
		 84 89 0 89 90 0;
	setAttr ".ed[166:294]" 86 90 0 90 65 0 88 91 0 91 92 0 89 92 0 92 93 0 90 93 0
		 93 69 0 91 94 0 94 95 0 92 95 0 95 96 0 93 96 0 96 73 0 94 97 0 97 98 0 95 98 0 98 99 0
		 96 99 0 99 77 0 97 100 0 100 101 0 98 101 0 101 102 0 99 102 0 102 81 0 103 104 0
		 104 105 0 106 105 0 103 106 0 104 107 0 107 108 0 105 108 0 107 3 0 108 7 0 105 109 0
		 110 109 0 106 110 0 108 111 0 109 111 0 111 11 0 109 112 0 113 112 0 110 113 0 111 114 0
		 112 114 0 114 15 0 112 115 0 116 115 0 113 116 0 114 117 0 115 117 0 117 19 0 115 118 0
		 119 118 0 116 119 0 117 120 0 118 120 0 120 23 0 118 121 0 122 121 0 119 122 0 120 123 0
		 121 123 0 123 27 0 103 124 0 124 125 0 104 125 0 106 126 0 124 126 0 125 127 0 107 127 0
		 127 32 0 110 128 0 126 128 0 113 129 0 128 129 0 116 130 0 129 130 0 119 131 0 130 131 0
		 121 132 0 133 132 0 122 133 0 131 133 0 123 134 0 132 134 0 134 40 0 124 135 0 135 136 0
		 125 136 0 126 137 0 135 137 0 136 138 0 127 138 0 138 45 0 128 139 0 137 139 0 129 140 0
		 139 140 0 130 141 0 140 141 0 131 142 0 141 142 0 132 143 0 144 143 0 133 144 0 142 144 0
		 134 145 0 143 145 0 145 53 0 135 82 0 136 85 0 137 83 0 138 87 0 139 88 0 140 91 0
		 141 94 0 142 97 0 143 101 0 144 100 0 145 102 0 147 148 0 150 149 0 149 146 0 148 151 0
		 147 146 0 149 148 0 150 151 0;
	setAttr -s 146 -ch 584 ".fc[0:145]" -type "polyFaces" 
		f 4 101 100 -99 -98
		mu 0 4 142 145 2 3
		f 4 98 105 -105 -104
		mu 0 4 3 2 6 7
		f 4 104 109 -109 -108
		mu 0 4 7 6 13 14
		f 4 113 112 -111 -101
		mu 0 4 145 146 5 2
		f 4 110 115 -115 -106
		mu 0 4 2 5 12 6
		f 4 114 117 -117 -110
		mu 0 4 6 12 19 13
		f 4 121 120 -119 -113
		mu 0 4 146 149 11 5
		f 4 118 123 -123 -116
		mu 0 4 5 11 18 12
		f 4 122 125 -125 -118
		mu 0 4 12 18 26 19
		f 4 129 128 -127 -121
		mu 0 4 149 151 17 11
		f 4 126 131 -131 -124
		mu 0 4 11 17 25 18
		f 4 130 133 -133 -126
		mu 0 4 18 25 34 26
		f 4 137 136 -135 -129
		mu 0 4 151 197 24 17
		f 4 134 139 -139 -132
		mu 0 4 17 24 33 25
		f 4 138 141 -141 -134
		mu 0 4 25 33 41 34
		f 4 146 145 -144 -137
		mu 0 4 197 31 32 24
		f 4 143 149 -149 -140
		mu 0 4 24 32 40 33
		f 4 148 152 -152 -142
		mu 0 4 33 40 45 41
		f 4 0 3 -8 -2
		mu 0 4 61 62 63 64
		f 4 2 5 -10 -4
		mu 0 4 62 65 66 63
		f 4 4 6 -12 -6
		mu 0 4 65 69 70 66
		f 4 7 10 -15 -9
		mu 0 4 64 63 67 68
		f 4 9 12 -17 -11
		mu 0 4 63 66 71 67
		f 4 11 13 -19 -13
		mu 0 4 66 70 76 71
		f 4 14 17 -22 -16
		mu 0 4 68 67 72 73
		f 4 16 19 -24 -18
		mu 0 4 67 71 77 72
		f 4 18 20 -26 -20
		mu 0 4 71 76 83 77
		f 4 21 24 -29 -23
		mu 0 4 73 72 78 79
		f 4 23 26 -31 -25
		mu 0 4 72 77 84 78
		f 4 25 27 -33 -27
		mu 0 4 77 83 91 84
		f 4 28 31 -36 -30
		mu 0 4 79 78 85 86
		f 4 30 33 -38 -32
		mu 0 4 78 84 92 85
		f 4 32 34 -40 -34
		mu 0 4 84 91 98 92
		f 4 35 38 -43 -37
		mu 0 4 86 85 93 94
		f 4 37 40 -44 -39
		mu 0 4 85 92 99 93
		f 4 39 41 -45 -41
		mu 0 4 92 98 105 99
		f 4 45 47 -47 -1
		mu 0 4 114 115 116 117
		f 4 48 -50 -46 1
		mu 0 4 64 143 144 61
		f 4 46 51 -51 -3
		mu 0 4 117 116 120 121
		f 4 50 53 -53 -5
		mu 0 4 121 120 125 126
		f 4 54 -56 -49 8
		mu 0 4 68 147 143 64
		f 4 56 -58 -55 15
		mu 0 4 73 150 147 68
		f 4 58 -60 -57 22
		mu 0 4 79 152 150 73
		f 4 60 -62 -59 29
		mu 0 4 86 101 152 79
		f 4 62 -65 -64 42
		mu 0 4 155 156 157 158
		f 4 63 -66 -61 36
		mu 0 4 94 100 101 86
		f 4 66 -68 -63 43
		mu 0 4 159 160 156 155
		f 4 68 -70 -67 44
		mu 0 4 163 164 160 159
		f 4 70 72 -72 -48
		mu 0 4 115 118 119 116
		f 4 73 -75 -71 49
		mu 0 4 143 9 148 144
		f 4 71 76 -76 -52
		mu 0 4 116 119 124 120
		f 4 75 78 -78 -54
		mu 0 4 120 124 128 125
		f 4 79 -81 -74 55
		mu 0 4 147 8 9 143
		f 4 81 -83 -80 57
		mu 0 4 150 15 8 147
		f 4 83 -85 -82 59
		mu 0 4 152 22 15 150
		f 4 85 -87 -84 61
		mu 0 4 101 30 22 152
		f 4 87 -90 -89 64
		mu 0 4 156 161 162 157
		f 4 88 -91 -86 65
		mu 0 4 100 39 30 101
		f 4 91 -93 -88 67
		mu 0 4 160 165 161 156
		f 4 93 -95 -92 69
		mu 0 4 164 170 165 160
		f 4 95 97 -97 -73
		mu 0 4 118 122 123 119
		f 4 99 -102 -96 74
		mu 0 4 9 1 0 148
		f 4 96 103 -103 -77
		mu 0 4 119 123 127 124
		f 4 102 107 -107 -79
		mu 0 4 124 127 131 128
		f 4 111 -114 -100 80
		mu 0 4 8 4 1 9
		f 4 119 -122 -112 82
		mu 0 4 15 10 4 8
		f 4 127 -130 -120 84
		mu 0 4 22 16 10 15
		f 4 135 -138 -128 86
		mu 0 4 30 23 16 22
		f 4 142 -146 -145 89
		mu 0 4 161 166 167 162
		f 4 144 -147 -136 90
		mu 0 4 39 196 23 30
		f 4 147 -150 -143 92
		mu 0 4 165 180 181 161
		f 4 150 -153 -148 94
		mu 0 4 170 182 180 165
		f 4 156 155 -155 -154
		mu 0 4 153 28 29 154
		f 4 159 158 -158 -156
		mu 0 4 28 20 21 29
		f 4 161 108 -161 -159
		mu 0 4 20 14 13 21
		f 4 154 164 -164 -163
		mu 0 4 154 29 36 185
		f 4 157 166 -166 -165
		mu 0 4 29 21 27 36
		f 4 160 116 -168 -167
		mu 0 4 21 13 19 27
		f 4 163 170 -170 -169
		mu 0 4 185 36 43 186
		f 4 165 172 -172 -171
		mu 0 4 36 27 35 43
		f 4 167 124 -174 -173
		mu 0 4 27 19 26 35
		f 4 169 176 -176 -175
		mu 0 4 186 43 47 190
		f 4 171 178 -178 -177
		mu 0 4 43 35 42 47
		f 4 173 132 -180 -179
		mu 0 4 35 26 34 42
		f 4 175 182 -182 -181
		mu 0 4 190 47 52 194
		f 4 177 184 -184 -183
		mu 0 4 47 42 46 52
		f 4 179 140 -186 -185
		mu 0 4 42 34 41 46
		f 4 181 188 -188 -187
		mu 0 4 194 52 55 58
		f 4 183 190 -190 -189
		mu 0 4 52 46 51 55
		f 4 185 151 -192 -191
		mu 0 4 46 41 45 51
		f 4 195 194 -194 -193
		mu 0 4 87 88 81 80
		f 4 193 198 -198 -197
		mu 0 4 80 81 75 74
		f 4 197 200 -7 -200
		mu 0 4 74 75 70 69
		f 4 203 202 -202 -195
		mu 0 4 88 95 89 81
		f 4 201 205 -205 -199
		mu 0 4 81 89 82 75
		f 4 204 206 -14 -201
		mu 0 4 75 82 76 70
		f 4 209 208 -208 -203
		mu 0 4 95 102 96 89
		f 4 207 211 -211 -206
		mu 0 4 89 96 90 82
		f 4 210 212 -21 -207
		mu 0 4 82 90 83 76
		f 4 215 214 -214 -209
		mu 0 4 102 106 103 96
		f 4 213 217 -217 -212
		mu 0 4 96 103 97 90
		f 4 216 218 -28 -213
		mu 0 4 90 97 91 83
		f 4 221 220 -220 -215
		mu 0 4 106 109 107 103
		f 4 219 223 -223 -218
		mu 0 4 103 107 104 97
		f 4 222 224 -35 -219
		mu 0 4 97 104 98 91
		f 4 227 226 -226 -221
		mu 0 4 109 111 110 107
		f 4 225 229 -229 -224
		mu 0 4 107 110 108 104
		f 4 228 230 -42 -225
		mu 0 4 104 108 105 98
		f 4 192 233 -233 -232
		mu 0 4 137 133 134 138
		f 4 -196 231 235 -235
		mu 0 4 88 87 187 188
		f 4 196 237 -237 -234
		mu 0 4 133 129 130 134
		f 4 199 52 -239 -238
		mu 0 4 129 126 125 130
		f 4 -204 234 240 -240
		mu 0 4 95 88 188 191
		f 4 -210 239 242 -242
		mu 0 4 102 95 191 193
		f 4 -216 241 244 -244
		mu 0 4 106 102 193 195
		f 4 -222 243 246 -246
		mu 0 4 109 106 195 112
		f 4 -227 249 248 -248
		mu 0 4 171 174 175 172
		f 4 -228 245 250 -250
		mu 0 4 111 109 112 113
		f 4 -230 247 252 -252
		mu 0 4 168 171 172 169
		f 4 -231 251 253 -69
		mu 0 4 163 168 169 164
		f 4 232 256 -256 -255
		mu 0 4 138 134 136 140
		f 4 -236 254 258 -258
		mu 0 4 188 187 189 50
		f 4 236 260 -260 -257
		mu 0 4 134 130 132 136
		f 4 238 77 -262 -261
		mu 0 4 130 125 128 132
		f 4 -241 257 263 -263
		mu 0 4 191 188 50 49
		f 4 -243 262 265 -265
		mu 0 4 193 191 49 54
		f 4 -245 264 267 -267
		mu 0 4 195 193 54 57
		f 4 -247 266 269 -269
		mu 0 4 112 195 57 59
		f 4 -249 272 271 -271
		mu 0 4 172 175 177 176
		f 4 -251 268 273 -273
		mu 0 4 113 112 59 60
		f 4 -253 270 275 -275
		mu 0 4 169 172 176 173
		f 4 -254 274 276 -94
		mu 0 4 164 169 173 170
		f 4 255 278 -157 -278
		mu 0 4 140 136 139 141
		f 4 -259 277 153 -280
		mu 0 4 50 189 37 38
		f 4 259 280 -160 -279
		mu 0 4 136 132 135 139
		f 4 261 106 -162 -281
		mu 0 4 132 128 131 135
		f 4 -264 279 162 -282
		mu 0 4 49 50 38 44
		f 4 -266 281 168 -283
		mu 0 4 54 49 44 48
		f 4 -268 282 174 -284
		mu 0 4 57 54 48 53
		f 4 -270 283 180 -285
		mu 0 4 59 57 53 56
		f 4 -272 286 187 -286
		mu 0 4 176 177 178 179
		f 4 -274 284 186 -287
		mu 0 4 60 59 56 192
		f 4 -276 285 189 -288
		mu 0 4 173 176 184 183
		f 4 -277 287 191 -151
		mu 0 4 170 173 183 182
		f 4 292 -291 293 -289
		mu 0 4 198 200 201 199
		f 4 -294 -290 294 -292
		mu 0 4 199 204 203 202;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "finger_index";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "finger_indexShape" -p "finger_index";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".vcs" 2;
createNode mesh -n "finger_indexShape17Orig" -p "finger_index";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 290 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.22457165 0.30958584 0.22255164
		 0.33322689 0.18687242 0.33469155 0.18762636 0.31032214 0.22161365 0.47254607 0.22016096
		 0.49204484 0.18583971 0.49201682 0.18581414 0.4715623 0.22057861 0.40082988 0.22072357
		 0.41275677 0.18536466 0.41446701 0.1853376 0.40072337 0.22407109 0.50515825 0.18628043
		 0.50633901 0.2210024 0.38030055 0.1855793 0.37789395 0.22143322 0.43204734 0.18578571
		 0.43437758 0.22128189 0.356787 0.18620694 0.35583928 0.22125983 0.45249435 0.18599278
		 0.45361343 0.071810067 0.378003 0.072349131 0.40082377 0.037306011 0.40100068 0.036945701
		 0.38061541 0.071354032 0.35595423 0.036706865 0.35709852 0.070734084 0.33472377 0.035456359
		 0.33336544 0.070228636 0.3104462 0.03326267 0.30967909 0.03330636 0.5051704 0.037503898
		 0.49206308 0.071514904 0.49198797 0.071097434 0.50627667 0.071545362 0.47164306 0.036139727
		 0.47257727 0.071435928 0.45363304 0.036158204 0.45247722 0.071981549 0.43444601 0.036056399
		 0.43192643 0.072303414 0.4146471 0.037034154 0.41268212 0.10964727 0.37745523 0.10976207
		 0.40066925 0.10947579 0.35529709 0.10924011 0.33430064 0.10900426 0.30987304 0.10941797
		 0.49213603 0.10937023 0.50611287 0.10954434 0.47184387 0.10960603 0.4539372 0.10969633
		 0.43460342 0.10977644 0.41458896 0.14795047 0.37740824 0.14787084 0.40064397 0.14809984
		 0.35526976 0.1483022 0.33424968 0.14860338 0.30982816 0.14795476 0.49213454 0.1480543
		 0.50613171 0.14795095 0.47185043 0.14790386 0.45390406 0.14785451 0.43456748 0.14783078
		 0.41456434 0.028884649 0.31431472 0.030464709 0.33432335 0.02291137 0.33452767 0.021579444
		 0.31596047 0.031484902 0.35736942 0.023605227 0.35757798 0.024293721 0.38098073 0.031939864
		 0.38021404 0.031372547 0.40227813 0.024794281 0.39930767 0.032134235 0.49278805 0.030023515
		 0.50010556 0.031499684 0.47357559 0.031501234 0.45247602 0.032115638 0.41093701 0.031368136
		 0.43075019 0.23487389 0.33433476 0.22719246 0.33407298 0.228719 0.31393293 0.23633552
		 0.31565669 0.23405743 0.35728392 0.22613102 0.35708389 0.2262786 0.40230182 0.2257728
		 0.37987837 0.23349088 0.38057658 0.23327911 0.39902815 0.22512633 0.49285868 0.22718507
		 0.50053859 0.22578776 0.47357044 0.22599566 0.45250806 0.22537768 0.4110153 0.22564059
		 0.43092862 0.2266079 0.5522812 0.22751991 0.57541698 0.1936916 0.57788819 0.1938986
		 0.55573982 0.22637402 0.73328668 0.22383587 0.75481838 0.19082792 0.7499271 0.19218872
		 0.72931427 0.22708111 0.65286142 0.22745018 0.66658872 0.19396506 0.66754436 0.19402169
		 0.65222979 0.19342493 0.53917593 0.2300431 0.53784806 0.22755431 0.62911135 0.19397579
		 0.62722015 0.22786422 0.6877079 0.1937203 0.68892097 0.22774594 0.60200781 0.19383667
		 0.60220069 0.22691374 0.71071607 0.19288535 0.70981479 0.079721749 0.62811428 0.079997778
		 0.65116507 0.0452246 0.65062779 0.044816308 0.62993103 0.079180777 0.60535067 0.044523172
		 0.60697335 0.077936053 0.58335477 0.043056838 0.58429462 0.076249778 0.56289858 0.041212313
		 0.56393963 0.036613159 0.55046159 0.073843002 0.54694599 0.07479763 0.72232485 0.073365778
		 0.7417686 0.038511924 0.74163216 0.039118074 0.72191483 0.076096386 0.70464003 0.04098051
		 0.70223898 0.078110963 0.68580538 0.042599849 0.68203443 0.079539657 0.66598088 0.044650726
		 0.66391999 0.11780518 0.62763977 0.11800736 0.65164596 0.11737037 0.60393959 0.116436
		 0.58113545 0.11532766 0.56020981 0.11356431 0.54421777 0.11373013 0.72475719 0.11212394
		 0.74445021 0.11502773 0.70670515 0.11637813 0.6871565 0.11744708 0.6666469 0.15637003
		 0.6273461 0.15656625 0.65198702 0.15605174 0.60288519 0.15554027 0.57930601 0.15504573
		 0.55780786 0.15377562 0.54168087 0.15321817 0.72707093 0.15181132 0.74714333 0.1542588
		 0.7083953 0.15529208 0.68816316 0.15615825 0.66713566 0.034802489 0.56368214 0.037387721
		 0.58494359 0.028354818 0.58489209 0.025706584 0.56676382 0.038465969 0.60724777 0.028946096
		 0.60750312 0.030525498 0.63055545 0.039236121 0.63001519 0.038848333 0.65240067 0.029548578
		 0.64913529 0.032942705 0.55507618 0.032514982 0.7388531 0.034242414 0.72144908 0.036206655
		 0.70202786 0.039750986 0.6610685 0.037990741 0.68166465 0.23185007 0.73360163 0.24273239
		 0.73467207 0.24153127 0.75650567 0.23068492 0.7541011 0.23245595 0.71106917 0.24336956
		 0.7114622 0.24414919 0.66612554 0.24316849 0.6875487 0.23323418 0.68714428 0.23324792
		 0.66508371 0.23509501 0.5417133 0.23366199 0.55101365 0.23348849 0.57565123 0.23369883
		 0.65528542 0.23338871 0.62919444 0.23380451 0.60199744 0.21219704 0.77227205 0.20975754
		 0.79862338 0.17899862 0.80095947 0.17927691 0.77560383 0.21337882 0.95417756 0.21261272
		 0.97519052 0.18005653 0.97307509 0.18072024 0.95194721 0.21958378 0.87363422 0.21943888
		 0.88850629 0.18688619 0.8879326 0.18714952 0.8729853 0.21003869 0.99111879 0.17762306
		 0.98919851 0.21333665 0.84798259 0.18283907 0.84874922 0.21674797 0.91031456 0.18430337
		 0.90960246 0.21055248 0.82323462 0.18005872 0.8245405 0.2149581 0.93258786 0.18241787
		 0.93121028 0.082915217 0.85280108 0.084487617 0.87489039 0.04888007 0.87871295 0.04963097
		 0.85442644 0.080882907 0.83010823 0.04750973 0.83189094 0.078336328 0.8081457 0.044673383
		 0.81002277 0.074656278 0.78421521 0.041685104 0.78669763 0.039274335 0.97095603 0.055823594
		 0.96185392 0.08076337 0.96494991 0.074275635 0.97934073 0.081827104 0.94470042 0.048247069
		 0.94333225 0.082858384 0.92692846 0.049204439 0.92491812 0.085176706 0.90878302 0.051872909
		 0.90657657 0.088589996 0.88882166 0.063731372 0.88913161 0.11652431 0.85064632 0.11951086
		 0.87387019 0.11375067 0.82791942 0.11161789 0.80580002 0.10859403 0.78155619 0.11304468
		 0.96757096 0.11006478 0.98307759 0.115316 0.94740075 0.11698273 0.92863935 0.11888254
		 0.90919179;
	setAttr ".uvst[0].uvsp[250:289]" 0.12010217 0.88864708 0.14992228 0.84947687
		 0.15309083 0.87343758 0.14726385 0.8260687 0.14549202 0.80333167 0.14377061 0.77854997
		 0.14656064 0.9701581 0.14412236 0.98606765 0.14834297 0.9497332 0.15008959 0.93000847
		 0.15182567 0.90941018 0.15327102 0.88838547 0.04097873 0.96504921 0.031851023 0.94679791
		 0.042944968 0.94430667 0.049418032 0.96015984 0.032559574 0.9238537 0.043624192 0.92455333
		 0.046870172 0.90508229 0.036076576 0.90139443 0.049413174 0.88467795 0.057092398
		 0.89001459 0.029811412 0.90001959 0.025354594 0.94717962 0.025779903 0.92349035 0.23490503
		 0.77550846 0.22913322 0.77905422 0.21741775 0.77693498 0.23466405 0.79961509 0.22911206
		 0.79876989 0.23532361 0.82220262 0.23038217 0.82248098 0.21680555 0.79924923 0.24169675
		 0.86873788 0.23551744 0.86576903 0.23270908 0.84601945 0.23802957 0.84476799 0.22418246
		 0.86860311 0.22017661 0.84664482 0.21750164 0.82292771;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 240 ".vt";
	setAttr ".vt[0:165]"  -0.43512282 0.074497379 0.3335551 -0.39417487 0.11595694 0.33483407
		 -0.34405708 0.14571083 0.33526853 -0.28804177 0.16181676 0.33483407 -0.22978678 0.16322294 0.3335551
		 -0.23331603 0.12983274 0.33184072 -0.28298503 0.12863386 0.33293086 -0.3307445 0.11490165 0.33330232
		 -0.37347552 0.089532971 0.33293086 -0.40838876 0.054184075 0.33184072 -0.43657002 0.07784652 0.24011517
		 -0.39563519 0.11933649 0.24054155 -0.34552193 0.14910093 0.240686 -0.28950232 0.16519642 0.24054155
		 -0.23123375 0.16657209 0.24011517 -0.23474535 0.13314089 0.23954254 -0.2844258 0.13196802 0.23990747
		 -0.33218884 0.11824472 0.24003071 -0.37491605 0.092867188 0.23990747 -0.40981808 0.057492234 0.23954254
		 -0.43657002 0.07784652 0.1466046 -0.39563519 0.11933649 0.14617825 -0.34552193 0.14910093 0.14603189
		 -0.28950232 0.16519642 0.14617825 -0.23123375 0.16657209 0.1466046 -0.23474535 0.13314089 0.14717624
		 -0.2844258 0.13196802 0.14681226 -0.33218884 0.11824472 0.14668813 -0.37491605 0.092867188 0.14681226
		 -0.40981808 0.057492234 0.14717624 -0.43512282 0.074497379 0.053164601 -0.39417487 0.11595694 0.051886559
		 -0.34405708 0.14571083 0.051451176 -0.28804177 0.16181675 0.051886559 -0.22978678 0.16322294 0.053164601
		 -0.23331603 0.12983274 0.05487895 -0.28298503 0.12863374 0.05378893 -0.3307445 0.11490164 0.053417325
		 -0.37347552 0.089532971 0.05378893 -0.40838876 0.054184072 0.05487895 -0.23070249 0.1237843 0.41608691
		 -0.23753975 0.13087735 0.42488927 -0.28034908 0.12253333 0.41790172 -0.28113815 0.12877789 0.42639354
		 -0.40577522 0.048135608 0.41608691 -0.40625456 0.057975858 0.42488927 -0.43247399 0.068367206 0.41894007
		 -0.42036021 0.068664454 0.42639729 -0.22713771 0.15709272 0.41894007 -0.23565638 0.14847472 0.42639729
		 -0.28536671 0.15562546 0.42107016 -0.2837888 0.14626081 0.42806762 -0.39149958 0.10976552 0.42107016
		 -0.38576114 0.10219873 0.42806762 -0.37484628 0.088286556 0.42639354 -0.37083957 0.083432503 0.41790172
		 -0.34137273 0.13949876 0.42179468 -0.33759952 0.13076641 0.42876413 -0.33058763 0.114539 0.42703372
		 -0.32810068 0.10878345 0.41851977 -0.23716705 0.13047443 -0.038119346 -0.23068962 0.12375464 -0.029779762
		 -0.2803362 0.12250366 -0.031594574 -0.28108376 0.12841952 -0.039639607 -0.22712508 0.15706317 -0.032632977
		 -0.23519546 0.14889859 -0.039697289 -0.40621647 0.057428278 -0.038119346 -0.40576234 0.048106 -0.029779762
		 -0.42098492 0.068619177 -0.039697289 -0.43246111 0.068337545 -0.032632977 -0.28385904 0.14672406 -0.041391075
		 -0.28535384 0.15559578 -0.034762055 -0.38605043 0.10256734 -0.041391075 -0.3914867 0.10973591 -0.034762055
		 -0.37082669 0.083402894 -0.031594574 -0.37462267 0.088001497 -0.039639607 -0.33778524 0.13119633 -0.042089999
		 -0.34135985 0.13946909 -0.035488546 -0.32808781 0.10875385 -0.032213598 -0.3304441 0.11420642 -0.040278107
		 -0.40627804 0.022311881 0.75121778 -0.37062749 0.060888559 0.75616074 -0.32630539 0.08793591 0.75784546
		 -0.27623335 0.10167614 0.75616074 -0.22370824 0.10120007 0.75121778 -0.22588119 0.069191739 0.74458808
		 -0.27065146 0.069603562 0.74880439 -0.31332517 0.057896197 0.75024021 -0.35109654 0.034843206 0.74880439
		 -0.38147917 0.001957966 0.74458808 -0.41591009 0.036262587 0.6816445 -0.37886694 0.075606346 0.6859504
		 -0.33298111 0.10338572 0.68742037 -0.28130433 0.11776304 0.6859504 -0.22726598 0.11777554 0.6816445
		 -0.2298377 0.085373551 0.67586672 -0.27588469 0.08537446 0.67953986 -0.31990862 0.073131993 0.68079227
		 -0.3589949 0.049462542 0.67953986 -0.39055178 0.015929207 0.67586672 -0.42411846 0.046931833 0.61135107
		 -0.38567194 0.087011591 0.61501974 -0.3382206 0.11551142 0.61626774 -0.28494635 0.1305349 0.61501974
		 -0.22941045 0.13106486 0.61135107 -0.23239741 0.098309666 0.60643429 -0.27970767 0.097875163 0.60956168
		 -0.32507563 0.085089773 0.61062592 -0.36547828 0.06081371 0.60956168 -0.3982181 0.026658699 0.60643429
		 -0.43089539 0.054300964 0.54044646 -0.39103466 0.095085695 0.54346663 -0.34201598 0.12429485 0.54449701
		 -0.28715104 0.13997366 0.54346663 -0.23013227 0.14105061 0.54044646 -0.23355108 0.10798274 0.53639573
		 -0.28211206 0.10708803 0.53897071 -0.32881832 0.093751341 0.53984946 -0.37053952 0.068878591 0.53897071
		 -0.40447158 0.034128144 0.53639573 -0.22099352 0.051439077 0.80671573 -0.2268434 0.057451755 0.81501365
		 -0.26457876 0.052191913 0.81146407 -0.26507959 0.057159394 0.81894982 -0.37190104 -0.013767861 0.80671573
		 -0.37227052 -0.0053871386 0.81501365 -0.39615902 0.0065509006 0.81418276 -0.38508636 0.0053474754 0.81896025
		 -0.21916535 0.083029702 0.81418276 -0.22587745 0.074141517 0.81896025 -0.27028483 0.083912537 0.81975377
		 -0.26809394 0.073917881 0.82332933 -0.36176831 0.044382676 0.81975377 -0.35599124 0.035937622 0.82332933
		 -0.34585303 0.022257149 0.81894982 -0.34257871 0.018488169 0.81146407 -0.3188765 0.070743665 0.82165134
		 -0.31478095 0.06126523 0.82515413 -0.30798268 0.045532078 0.82062465 -0.30600882 0.040963918 0.81308156
		 -0.24044186 0.12139305 0.46687186 -0.23374139 0.11352645 0.473261 -0.28325441 0.11226968 0.47528321
		 -0.28435633 0.11929656 0.4685666 -0.23015954 0.14674228 0.47644103 -0.2384479 0.1397907 0.46863306
		 -0.40951484 0.048336715 0.46687186 -0.40837848 0.038066044 0.473261 -0.42427897 0.05949311 0.46863306
		 -0.43502188 0.058221519 0.47644103 -0.28711215 0.13756759 0.47051874 -0.2882399 0.14526489 0.47881043
		 -0.38930929 0.093408421 0.47051874 -0.39414173 0.099504858 0.47881043 -0.37353015 0.073261604 0.47528321
		 -0.37789232 0.078879781 0.4685666 -0.34103203 0.12201759 0.47129697 -0.34412122 0.12916677 0.47961676
		 -0.33089089 0.098548025 0.47597104 -0.33370733 0.10506609 0.46927863 -0.35717431 -0.054832697 1.012473106
		 -0.32738718 -0.024289846 1.020120621 -0.29080367 -0.0024603996 1.022726536 -0.24983469 0.0092204586 1.020120621
		 -0.20717868 0.0099803358 1.012473106 -0.2096307 -0.014773846 1.0022194386;
	setAttr ".vt[166:239]" -0.24598897 -0.015416846 1.0087397099 -0.28090453 -0.025369763 1.010961413
		 -0.31208125 -0.043975294 1.0087397099 -0.33746687 -0.070011869 1.0022194386 -0.36783871 -0.03700535 0.9721604
		 -0.33693245 -0.0057741962 0.97943795 -0.2990725 0.016676322 0.98192072 -0.25677678 0.028860927 0.97943795
		 -0.21285215 0.029964104 0.9721604 -0.21559827 0.0048086904 0.96239817 -0.25302678 0.003877569 0.96860617
		 -0.28905892 -0.0064981431 0.97072071 -0.32130879 -0.025627017 0.96860617 -0.34763786 -0.052245498 0.96239817
		 -0.37741178 -0.021691516 0.9306317 -0.34537825 0.01020398 0.93753332 -0.30624127 0.033266842 0.93988377
		 -0.26262441 0.045961872 0.93753332 -0.21744363 0.047430575 0.9306317 -0.22049615 0.021904826 0.92137951
		 -0.25898457 0.020666912 0.92726398 -0.29612827 0.0098624825 0.92926759 -0.32945228 -0.0097820684 0.92726398
		 -0.35673112 -0.036962241 0.92137951 -0.38588387 -0.0089164749 0.88795012 -0.35271484 0.023619533 0.89446265
		 -0.31229901 0.047286063 0.89668036 -0.26736611 0.06049867 0.89446265 -0.22094052 0.06235531 0.88795012
		 -0.22431237 0.036490485 0.87921971 -0.26385111 0.034926772 0.88477111 -0.30210209 0.023687303 0.88666362
		 -0.33650145 0.0035346672 0.88477111 -0.36473745 -0.024186984 0.87921971 -0.20320439 -0.034937948 1.037495375
		 -0.20755033 -0.031063139 1.044397116 -0.23856848 -0.035348743 1.044318914 -0.2385958 -0.032156348 1.050049901
		 -0.32718706 -0.088510692 1.037495375 -0.32703036 -0.082690448 1.044397116 -0.34641775 -0.073435828 1.04822588
		 -0.33719021 -0.074726269 1.050065994 -0.2010031 -0.01060237 1.04822588 -0.20638721 -0.018206418 1.050065994
		 -0.24247998 -0.011084355 1.056228757 -0.24066223 -0.019337118 1.05634439 -0.31764108 -0.043561295 1.056228757
		 -0.31287706 -0.050540969 1.05634439 -0.30495781 -0.060831338 1.050049901 -0.3026517 -0.063039064 1.044318914
		 -0.28222442 -0.022315025 1.058956027 -0.27884865 -0.030127525 1.058964491 -0.27368736 -0.042072326 1.052459002
		 -0.27245498 -0.0449242 1.046643972 -0.23274356 0.053918183 0.83860266 -0.22709833 0.04713057 0.84052289
		 -0.26744226 0.045322642 0.84573609 -0.26854202 0.051546015 0.8429696 -0.22362877 0.073200703 0.84872019
		 -0.2308135 0.068358287 0.84313905 -0.37165064 -0.0061034597 0.83860266 -0.3705765 -0.014866248 0.84052289
		 -0.38348889 0.0023873877 0.84313905 -0.3919394 0.00047385017 0.84872019 -0.27048245 0.065808073 0.8480078
		 -0.27095336 0.071077853 0.85483372 -0.35444558 0.029527739 0.8480078 -0.35796052 0.033482313 0.85483372
		 -0.34161091 0.013274431 0.84573609 -0.34538943 0.018340386 0.8429696 -0.31465316 0.052734226 0.85001153
		 -0.31673074 0.05754225 0.85691702 -0.30646539 0.033785164 0.84751207 -0.30896997 0.039581537 0.84480411;
	setAttr -s 468 ".ed";
	setAttr ".ed[0:165]"  0 46 0 1 52 0 0 1 0 2 56 0 1 2 0 3 50 0 2 3 0 4 48 0
		 3 4 0 5 40 0 4 5 0 6 16 0 5 6 0 7 17 0 6 7 0 8 18 0 7 8 0 9 44 0 8 9 0 9 0 0 10 0 0
		 11 1 0 10 11 0 12 2 0 11 12 0 13 3 0 12 13 0 14 4 0 13 14 0 15 5 0 14 15 0 16 26 0
		 15 16 0 17 27 0 16 17 0 18 28 0 17 18 0 19 9 0 18 19 0 19 10 0 20 10 0 21 11 0 20 21 0
		 22 12 0 21 22 0 23 13 0 22 23 0 24 14 0 23 24 0 25 15 0 24 25 0 26 36 0 25 26 0 27 37 0
		 26 27 0 28 38 0 27 28 0 29 19 0 28 29 0 29 20 0 30 20 0 31 21 0 30 31 0 32 22 0 31 32 0
		 33 23 0 32 33 0 34 24 0 33 34 0 35 25 0 34 35 0 36 62 0 35 36 0 37 78 0 36 37 0 38 74 0
		 37 38 0 39 29 0 38 39 0 39 30 0 42 6 0 55 8 0 59 7 0 49 51 0 51 43 1 43 41 0 41 49 0
		 40 42 0 51 57 0 57 58 1 58 43 0 42 59 0 53 47 0 47 45 0 45 54 0 44 46 0 46 52 0 48 40 0
		 50 48 0 54 58 0 57 53 0 53 54 1 52 56 0 55 44 0 56 50 0 59 55 0 41 40 0 48 49 0 43 42 1
		 58 59 1 45 44 0 47 46 0 53 52 1 51 50 1 57 56 1 54 55 1 61 35 0 64 34 0 67 39 0 69 30 0
		 71 33 0 73 31 0 77 32 0 61 64 0 63 70 1 70 65 0 65 60 0 60 63 0 76 70 0 63 79 0 62 61 0
		 64 71 0 67 74 0 68 72 0 72 75 1 75 66 0 66 68 0 69 67 0 71 77 0 76 79 1 79 75 0 72 76 0
		 73 69 0 74 78 0 77 73 0 78 62 0 61 60 0 65 64 0 63 62 1 70 71 1 67 66 0 75 74 1 69 68 0
		 76 77 1 72 73 1 79 78 1 80 126 0 81 132 0 80 81 0 82 136 0 81 82 0 83 130 0 82 83 0
		 84 128 0 83 84 0 85 120 0;
	setAttr ".ed[166:331]" 84 85 0 86 96 0 85 86 0 87 97 0 86 87 0 88 98 0 87 88 0
		 89 124 0 88 89 0 89 80 0 90 80 0 91 81 0 90 91 0 92 82 0 91 92 0 93 83 0 92 93 0
		 94 84 0 93 94 0 95 85 0 94 95 0 96 106 0 95 96 0 97 107 0 96 97 0 98 108 0 97 98 0
		 99 89 0 98 99 0 99 90 0 100 90 0 101 91 0 100 101 0 102 92 0 101 102 0 103 93 0 102 103 0
		 104 94 0 103 104 0 105 95 0 104 105 0 106 116 0 105 106 0 107 117 0 106 107 0 108 118 0
		 107 108 0 109 99 0 108 109 0 109 100 0 110 100 0 111 101 0 110 111 0 112 102 0 111 112 0
		 113 103 0 112 113 0 114 104 0 113 114 0 115 105 0 114 115 0 116 142 0 115 116 0 117 158 0
		 116 117 0 118 154 0 117 118 0 119 109 0 118 119 0 119 110 0 122 86 0 135 88 0 139 87 0
		 129 131 0 131 123 1 123 121 0 121 129 0 120 122 0 131 137 0 137 138 1 138 123 0 122 139 0
		 133 127 0 127 125 0 125 134 0 124 126 0 126 132 0 128 120 0 130 128 0 134 138 0 137 133 0
		 133 134 1 132 136 0 135 124 0 136 130 0 139 135 0 121 120 0 128 129 0 123 122 1 138 139 1
		 125 124 0 127 126 0 133 132 1 131 130 1 137 136 1 134 135 1 141 115 0 144 114 0 147 119 0
		 149 110 0 151 113 0 153 111 0 157 112 0 141 144 0 150 145 0 145 140 0 140 143 0 156 150 0
		 150 143 1 143 159 0 142 141 0 144 151 0 147 154 0 148 152 0 152 155 1 155 146 0 146 148 0
		 149 147 0 151 157 0 156 159 1 159 155 0 152 156 0 153 149 0 154 158 0 157 153 0 158 142 0
		 141 140 0 145 144 0 143 142 1 150 151 1 147 146 0 155 154 1 149 148 0 156 157 1 152 153 1
		 159 158 1 160 206 0 161 212 0 160 161 0 162 216 0 161 162 0 163 210 0 162 163 0 164 208 0
		 163 164 0 165 200 0 164 165 0 166 176 0 165 166 0 167 177 0 166 167 0 168 178 0 167 168 0
		 169 204 0 168 169 0 169 160 0;
	setAttr ".ed[332:467]" 170 160 0 171 161 0 170 171 0 172 162 0 171 172 0 173 163 0
		 172 173 0 174 164 0 173 174 0 175 165 0 174 175 0 176 186 0 175 176 0 177 187 0 176 177 0
		 178 188 0 177 178 0 179 169 0 178 179 0 179 170 0 180 170 0 181 171 0 180 181 0 182 172 0
		 181 182 0 183 173 0 182 183 0 184 174 0 183 184 0 185 175 0 184 185 0 186 196 0 185 186 0
		 187 197 0 186 187 0 188 198 0 187 188 0 189 179 0 188 189 0 189 180 0 190 180 0 191 181 0
		 190 191 0 192 182 0 191 192 0 193 183 0 192 193 0 194 184 0 193 194 0 195 185 0 194 195 0
		 196 222 0 195 196 0 197 238 0 196 197 0 198 234 0 197 198 0 199 189 0 198 199 0 199 190 0
		 202 166 0 215 168 0 219 167 0 209 211 0 211 203 1 203 201 0 201 209 0 200 202 0 211 217 0
		 217 218 1 218 203 0 202 219 0 213 207 0 207 205 0 205 214 0 204 206 0 206 212 0 208 200 0
		 210 208 0 214 218 0 217 213 0 213 214 1 212 216 0 215 204 0 216 210 0 219 215 0 201 200 0
		 208 209 0 203 202 1 218 219 1 205 204 0 207 206 0 213 212 1 211 210 1 217 216 1 214 215 1
		 221 195 0 224 194 0 227 199 0 229 190 0 231 193 0 233 191 0 237 192 0 221 224 0 230 225 0
		 225 220 0 220 223 0 236 230 0 223 239 0 222 221 0 224 231 0 227 234 0 228 232 0 235 226 0
		 226 228 0 229 227 0 231 237 0 239 235 0 232 236 0 233 229 0 234 238 0 237 233 0 238 222 0
		 221 220 0 225 224 0 223 222 1 230 231 1 227 226 0 235 234 1 229 228 0 236 237 1 232 233 1
		 239 238 1 223 230 0 239 236 0 235 232 0;
	setAttr -s 234 -ch 936 ".fc[0:233]" -type "polyFaces" 
		f 4 131 120 68 -118
		mu 0 4 0 1 2 3
		f 4 130 116 72 71
		mu 0 4 4 5 6 7
		f 4 137 118 79 -120
		mu 0 4 8 9 10 11
		f 4 -117 123 117 70
		mu 0 4 6 5 12 13
		f 4 142 119 62 -122
		mu 0 4 14 8 11 15
		f 4 132 -76 78 -119
		mu 0 4 9 16 17 10
		f 4 144 121 64 -123
		mu 0 4 18 14 15 19
		f 4 143 -74 76 75
		mu 0 4 16 20 21 17
		f 4 138 122 66 -121
		mu 0 4 1 18 19 2
		f 4 145 -72 74 73
		mu 0 4 20 4 7 21
		f 4 -3 0 96 -2
		mu 0 4 22 23 24 25
		f 4 -5 1 102 -4
		mu 0 4 26 22 25 27
		f 4 -7 3 104 -6
		mu 0 4 28 26 27 29
		f 4 -9 5 98 -8
		mu 0 4 30 28 29 31
		f 4 97 -10 -11 7
		mu 0 4 32 33 34 35
		f 4 -13 9 87 80
		mu 0 4 36 34 33 37
		f 4 -15 -81 91 82
		mu 0 4 38 36 37 39
		f 4 -17 -83 105 81
		mu 0 4 40 38 39 41
		f 4 -19 -82 103 -18
		mu 0 4 42 40 41 43
		f 4 -20 17 95 -1
		mu 0 4 23 42 43 24
		f 4 -23 20 2 -22
		mu 0 4 44 45 23 22
		f 4 -25 21 4 -24
		mu 0 4 46 44 22 26
		f 4 -27 23 6 -26
		mu 0 4 47 46 26 28
		f 4 -29 25 8 -28
		mu 0 4 48 47 28 30
		f 4 -30 -31 27 10
		mu 0 4 34 49 50 35
		f 4 -33 29 12 11
		mu 0 4 51 49 34 36
		f 4 -35 -12 14 13
		mu 0 4 52 51 36 38
		f 4 -37 -14 16 15
		mu 0 4 53 52 38 40
		f 4 -39 -16 18 -38
		mu 0 4 54 53 40 42
		f 4 -40 37 19 -21
		mu 0 4 45 54 42 23
		f 4 -43 40 22 -42
		mu 0 4 55 56 45 44
		f 4 -45 41 24 -44
		mu 0 4 57 55 44 46
		f 4 -47 43 26 -46
		mu 0 4 58 57 46 47
		f 4 -49 45 28 -48
		mu 0 4 59 58 47 48
		f 4 -50 -51 47 30
		mu 0 4 49 60 61 50
		f 4 -53 49 32 31
		mu 0 4 62 60 49 51
		f 4 -55 -32 34 33
		mu 0 4 63 62 51 52
		f 4 -57 -34 36 35
		mu 0 4 64 63 52 53
		f 4 -59 -36 38 -58
		mu 0 4 65 64 53 54
		f 4 -60 57 39 -41
		mu 0 4 56 65 54 45
		f 4 -63 60 42 -62
		mu 0 4 15 11 56 55
		f 4 -65 61 44 -64
		mu 0 4 19 15 55 57
		f 4 -67 63 46 -66
		mu 0 4 2 19 57 58
		f 4 -69 65 48 -68
		mu 0 4 3 2 58 59
		f 4 -70 -71 67 50
		mu 0 4 60 6 13 61
		f 4 -73 69 52 51
		mu 0 4 7 6 60 62
		f 4 -75 -52 54 53
		mu 0 4 21 7 62 63
		f 4 -77 -54 56 55
		mu 0 4 17 21 63 64
		f 4 -79 -56 58 -78
		mu 0 4 10 17 64 65
		f 4 -80 77 59 -61
		mu 0 4 11 10 65 56
		f 4 83 84 85 86
		mu 0 4 66 67 68 69
		f 4 88 89 90 -85
		mu 0 4 67 70 71 68
		f 4 -102 92 93 94
		mu 0 4 72 73 74 75
		f 4 99 -90 100 101
		mu 0 4 72 71 70 73
		f 4 106 -98 107 -87
		mu 0 4 76 33 32 77
		f 4 -107 -86 108 -88
		mu 0 4 33 76 78 37
		f 4 -109 -91 109 -92
		mu 0 4 37 78 79 39
		f 4 110 -104 -116 -95
		mu 0 4 80 43 41 81
		f 4 -111 -94 111 -96
		mu 0 4 43 80 74 24
		f 4 -112 -93 112 -97
		mu 0 4 24 74 73 25
		f 4 -108 -99 -114 -84
		mu 0 4 66 31 29 67
		f 4 113 -105 -115 -89
		mu 0 4 67 29 27 70
		f 4 -113 -101 114 -103
		mu 0 4 25 73 70 27
		f 4 115 -106 -110 -100
		mu 0 4 81 41 39 79
		f 4 124 125 126 127
		mu 0 4 82 83 84 85
		f 4 -140 128 -125 129
		mu 0 4 86 87 83 82
		f 4 133 134 135 136
		mu 0 4 88 89 90 91
		f 4 139 140 -135 141
		mu 0 4 87 86 90 89
		f 4 146 -127 147 -124
		mu 0 4 5 92 93 12
		f 4 -147 -131 -149 -128
		mu 0 4 92 5 4 94
		f 4 148 -146 -156 -130
		mu 0 4 94 4 20 95
		f 4 -148 -126 149 -132
		mu 0 4 0 84 83 1
		f 4 150 -136 151 -133
		mu 0 4 9 96 97 16
		f 4 -151 -138 152 -137
		mu 0 4 96 9 8 88
		f 4 -153 -143 -155 -134
		mu 0 4 88 8 14 89
		f 4 -150 -129 153 -139
		mu 0 4 1 83 87 18
		f 4 154 -145 -154 -142
		mu 0 4 89 14 18 87
		f 4 -152 -141 155 -144
		mu 0 4 16 97 95 20
		f 4 287 276 224 -274
		mu 0 4 98 99 100 101
		f 4 286 272 228 227
		mu 0 4 102 103 104 105
		f 4 293 274 235 -276
		mu 0 4 106 107 108 109
		f 4 -273 279 273 226
		mu 0 4 110 111 98 101
		f 4 298 275 218 -278
		mu 0 4 112 106 109 113
		f 4 288 -232 234 -275
		mu 0 4 107 114 115 108
		f 4 300 277 220 -279
		mu 0 4 116 112 113 117
		f 4 299 -230 232 231
		mu 0 4 114 118 119 115
		f 4 294 278 222 -277
		mu 0 4 99 116 117 100
		f 4 301 -228 230 229
		mu 0 4 118 102 105 119
		f 4 -159 156 252 -158
		mu 0 4 120 121 122 123
		f 4 -161 157 258 -160
		mu 0 4 124 120 123 125
		f 4 -163 159 260 -162
		mu 0 4 126 124 125 127
		f 4 -165 161 254 -164
		mu 0 4 128 126 127 129
		f 4 253 -166 -167 163
		mu 0 4 129 130 131 128
		f 4 -169 165 243 236
		mu 0 4 132 133 134 135
		f 4 -171 -237 247 238
		mu 0 4 136 132 135 137
		f 4 -173 -239 261 237
		mu 0 4 138 136 137 139
		f 4 -175 -238 259 -174
		mu 0 4 140 138 139 141
		f 4 -176 173 251 -157
		mu 0 4 121 140 141 122
		f 4 -179 176 158 -178
		mu 0 4 142 143 121 120
		f 4 -181 177 160 -180
		mu 0 4 144 142 120 124
		f 4 -183 179 162 -182
		mu 0 4 145 144 124 126
		f 4 -185 181 164 -184
		mu 0 4 146 145 126 128
		f 4 -186 -187 183 166
		mu 0 4 131 147 146 128
		f 4 -189 185 168 167
		mu 0 4 148 149 133 132
		f 4 -191 -168 170 169
		mu 0 4 150 148 132 136
		f 4 -193 -170 172 171
		mu 0 4 151 150 136 138
		f 4 -195 -172 174 -194
		mu 0 4 152 151 138 140
		f 4 -196 193 175 -177
		mu 0 4 143 152 140 121
		f 4 -199 196 178 -198
		mu 0 4 153 154 143 142
		f 4 -201 197 180 -200
		mu 0 4 155 153 142 144
		f 4 -203 199 182 -202
		mu 0 4 156 155 144 145
		f 4 -205 201 184 -204
		mu 0 4 157 156 145 146
		f 4 -206 -207 203 186
		mu 0 4 147 158 157 146
		f 4 -209 205 188 187
		mu 0 4 159 160 149 148
		f 4 -211 -188 190 189
		mu 0 4 161 159 148 150
		f 4 -213 -190 192 191
		mu 0 4 162 161 150 151
		f 4 -215 -192 194 -214
		mu 0 4 163 162 151 152
		f 4 -216 213 195 -197
		mu 0 4 154 163 152 143
		f 4 -219 216 198 -218
		mu 0 4 113 109 154 153
		f 4 -221 217 200 -220
		mu 0 4 117 113 153 155
		f 4 -223 219 202 -222
		mu 0 4 100 117 155 156
		f 4 -225 221 204 -224
		mu 0 4 101 100 156 157
		f 4 -226 -227 223 206
		mu 0 4 158 110 101 157
		f 4 -229 225 208 207
		mu 0 4 105 104 160 159
		f 4 -231 -208 210 209
		mu 0 4 119 105 159 161
		f 4 -233 -210 212 211
		mu 0 4 115 119 161 162
		f 4 -235 -212 214 -234
		mu 0 4 108 115 162 163
		f 4 -236 233 215 -217
		mu 0 4 109 108 163 154
		f 4 239 240 241 242
		mu 0 4 164 165 166 167
		f 4 244 245 246 -241
		mu 0 4 165 168 169 166
		f 4 -258 248 249 250
		mu 0 4 170 171 172 173
		f 4 255 -246 256 257
		mu 0 4 170 169 168 171
		f 4 262 -254 263 -243
		mu 0 4 174 130 129 164
		f 4 -263 -242 264 -244
		mu 0 4 134 175 176 135
		f 4 -265 -247 265 -248
		mu 0 4 135 176 177 137
		f 4 266 -260 -272 -251
		mu 0 4 178 141 139 179
		f 4 -267 -250 267 -252
		mu 0 4 141 178 172 122
		f 4 -268 -249 268 -253
		mu 0 4 122 172 171 123
		f 4 -264 -255 -270 -240
		mu 0 4 164 129 127 165
		f 4 269 -261 -271 -245
		mu 0 4 165 127 125 168
		f 4 -269 -257 270 -259
		mu 0 4 123 171 168 125
		f 4 271 -262 -266 -256
		mu 0 4 179 139 137 177
		f 4 -285 280 281 282
		mu 0 4 180 181 182 183
		f 4 -296 283 284 285
		mu 0 4 184 185 181 180
		f 4 289 290 291 292
		mu 0 4 186 187 188 189
		f 4 295 296 -291 297
		mu 0 4 185 184 188 187
		f 4 302 -282 303 -280
		mu 0 4 111 190 191 98
		f 4 -303 -287 -305 -283
		mu 0 4 183 103 102 180
		f 4 304 -302 -312 -286
		mu 0 4 180 102 118 184
		f 4 -304 -281 305 -288
		mu 0 4 98 191 192 99
		f 4 306 -292 307 -289
		mu 0 4 107 189 188 114
		f 4 -307 -294 308 -293
		mu 0 4 189 107 106 193
		f 4 -309 -299 -311 -290
		mu 0 4 193 106 112 194
		f 4 -306 -284 309 -295
		mu 0 4 99 192 195 116
		f 4 310 -301 -310 -298
		mu 0 4 194 112 116 195
		f 4 -308 -297 311 -300
		mu 0 4 114 188 184 118
		f 4 442 432 380 -430
		mu 0 4 196 197 198 199
		f 4 441 428 384 383
		mu 0 4 200 201 202 203
		f 4 447 430 391 -432
		mu 0 4 204 205 206 207
		f 4 -429 435 429 382
		mu 0 4 202 201 208 209
		f 4 451 431 374 -434
		mu 0 4 210 204 207 211
		f 4 443 -388 390 -431
		mu 0 4 205 212 213 206
		f 4 453 433 376 -435
		mu 0 4 214 210 211 215
		f 4 452 -386 388 387
		mu 0 4 212 216 217 213
		f 4 448 434 378 -433
		mu 0 4 197 214 215 198
		f 4 454 -384 386 385
		mu 0 4 216 200 203 217
		f 4 -315 312 408 -314
		mu 0 4 218 219 220 221
		f 4 -317 313 414 -316
		mu 0 4 222 218 221 223
		f 4 -319 315 416 -318
		mu 0 4 224 222 223 225
		f 4 -321 317 410 -320
		mu 0 4 226 224 225 227
		f 4 409 -322 -323 319
		mu 0 4 228 229 230 231
		f 4 -325 321 399 392
		mu 0 4 232 230 229 233
		f 4 -327 -393 403 394
		mu 0 4 234 232 233 235
		f 4 -329 -395 417 393
		mu 0 4 236 234 235 237
		f 4 -331 -394 415 -330
		mu 0 4 238 236 237 239
		f 4 -332 329 407 -313
		mu 0 4 219 238 239 220
		f 4 -335 332 314 -334
		mu 0 4 240 241 219 218
		f 4 -337 333 316 -336
		mu 0 4 242 240 218 222
		f 4 -339 335 318 -338
		mu 0 4 243 242 222 224
		f 4 -341 337 320 -340
		mu 0 4 244 243 224 226
		f 4 -342 -343 339 322
		mu 0 4 230 245 246 231
		f 4 -345 341 324 323
		mu 0 4 247 245 230 232
		f 4 -347 -324 326 325
		mu 0 4 248 247 232 234
		f 4 -349 -326 328 327
		mu 0 4 249 248 234 236
		f 4 -351 -328 330 -350
		mu 0 4 250 249 236 238
		f 4 -352 349 331 -333
		mu 0 4 241 250 238 219
		f 4 -355 352 334 -354
		mu 0 4 251 252 241 240
		f 4 -357 353 336 -356
		mu 0 4 253 251 240 242
		f 4 -359 355 338 -358
		mu 0 4 254 253 242 243
		f 4 -361 357 340 -360
		mu 0 4 255 254 243 244
		f 4 -362 -363 359 342
		mu 0 4 245 256 257 246
		f 4 -365 361 344 343
		mu 0 4 258 256 245 247
		f 4 -367 -344 346 345
		mu 0 4 259 258 247 248
		f 4 -369 -346 348 347
		mu 0 4 260 259 248 249
		f 4 -371 -348 350 -370
		mu 0 4 261 260 249 250
		f 4 -372 369 351 -353
		mu 0 4 252 261 250 241
		f 4 -375 372 354 -374
		mu 0 4 211 207 252 251
		f 4 -377 373 356 -376
		mu 0 4 215 211 251 253
		f 4 -379 375 358 -378
		mu 0 4 198 215 253 254
		f 4 -381 377 360 -380
		mu 0 4 199 198 254 255
		f 4 -382 -383 379 362
		mu 0 4 256 202 209 257
		f 4 -385 381 364 363
		mu 0 4 203 202 256 258
		f 4 -387 -364 366 365
		mu 0 4 217 203 258 259
		f 4 -389 -366 368 367
		mu 0 4 213 217 259 260
		f 4 -391 -368 370 -390
		mu 0 4 206 213 260 261
		f 4 -392 389 371 -373
		mu 0 4 207 206 261 252
		f 4 395 396 397 398
		mu 0 4 262 263 264 265
		f 4 400 401 402 -397
		mu 0 4 263 266 267 264
		f 4 -414 404 405 406
		mu 0 4 268 269 270 271
		f 4 411 -402 412 413
		mu 0 4 268 267 266 269
		f 4 418 -410 419 -399
		mu 0 4 265 229 228 262
		f 4 -419 -398 420 -400
		mu 0 4 229 265 264 233
		f 4 -421 -403 421 -404
		mu 0 4 233 264 267 235
		f 4 422 -416 -428 -407
		mu 0 4 271 239 237 268
		f 4 -423 -406 423 -408
		mu 0 4 239 271 270 220
		f 4 -424 -405 424 -409
		mu 0 4 220 270 269 272
		f 4 -420 -411 -426 -396
		mu 0 4 262 228 273 263
		f 4 425 -417 -427 -401
		mu 0 4 263 273 274 266
		f 4 -425 -413 426 -415
		mu 0 4 272 269 266 274
		f 4 427 -418 -422 -412
		mu 0 4 268 237 235 267
		f 4 455 -438 456 -436
		mu 0 4 275 276 277 196
		f 4 -456 -442 -458 -439
		mu 0 4 276 275 278 279
		f 4 457 -455 -465 -441
		mu 0 4 279 278 280 281
		f 4 -457 -437 458 -443
		mu 0 4 196 277 282 197
		f 4 459 -446 460 -444
		mu 0 4 283 284 285 286
		f 4 -460 -448 461 -447
		mu 0 4 284 283 204 287
		f 4 -462 -452 -464 -445
		mu 0 4 287 204 210 288
		f 4 -459 -440 462 -449
		mu 0 4 197 282 289 214
		f 4 463 -454 -463 -451
		mu 0 4 288 210 214 289
		f 4 -461 -450 464 -453
		mu 0 4 286 285 281 280
		f 4 436 437 438 465
		mu 0 4 282 277 276 279
		f 4 439 -466 440 466
		mu 0 4 289 282 279 281
		f 4 450 -467 449 467
		mu 0 4 288 289 281 285
		f 4 444 -468 445 446
		mu 0 4 287 288 285 284;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "finger_middle";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "finger_middleShape" -p "finger_middle";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".vcs" 2;
createNode mesh -n "finger_middleShape18Orig" -p "finger_middle";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 288 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.48550081 0.54017437 0.48516685
		 0.56567556 0.44499242 0.56269288 0.44574624 0.53692377 0.48176149 0.71127242 0.47626582
		 0.73187011 0.44066173 0.73478037 0.44105613 0.71238136 0.47994578 0.63752228 0.47540563
		 0.64891869 0.43949914 0.64985645 0.44006407 0.63555628 0.48512393 0.74293762 0.44175982
		 0.75030261 0.48390251 0.61683476 0.44250888 0.61263686 0.48180109 0.66790539 0.44097918
		 0.67021543 0.48438609 0.59158069 0.44425595 0.58844358 0.48236355 0.68957144 0.44220722
		 0.69108135 0.31810015 0.6110782 0.31819373 0.63443506 0.27942485 0.63398719 0.27812594
		 0.6128363 0.3175329 0.58645499 0.27814382 0.58824235 0.31716335 0.56061554 0.27770597
		 0.56292188 0.31646872 0.53495437 0.27602845 0.53774363 0.27237147 0.74341732 0.27722415
		 0.72993141 0.31462735 0.73309106 0.3136673 0.74842113 0.31497142 0.71094185 0.27458248
		 0.70967609 0.31469834 0.68942982 0.27542573 0.68738282 0.31596047 0.66851634 0.27514082
		 0.66545367 0.31750453 0.64849615 0.27921253 0.64614701 0.35957193 0.61110312 0.35908943
		 0.63489699 0.35965556 0.58618903 0.35982811 0.56025177 0.35985273 0.53451562 0.35678527
		 0.73434579 0.35641795 0.74935281 0.35713732 0.71231568 0.35742182 0.69072795 0.35796487
		 0.66944414 0.35862982 0.64909869 0.40045434 0.6115272 0.39948606 0.63533473 0.40151966
		 0.58674031 0.40220261 0.56092477 0.4028073 0.53526866 0.39877644 0.73492801 0.39884612
		 0.74997354 0.39901358 0.71286869 0.39917493 0.69124895 0.39913321 0.6700992 0.39911252
		 0.649638 0.27112442 0.54205495 0.27238816 0.56384301 0.26458317 0.56463927 0.26383597
		 0.54481024 0.27275974 0.58864528 0.26500422 0.58897996 0.26515096 0.6134817 0.27283424
		 0.61310512 0.27316719 0.63578254 0.26588762 0.63364416 0.27152067 0.73012429 0.26877767
		 0.73784739 0.26957536 0.70999688 0.27036369 0.68717158 0.27386522 0.64401436 0.27053571
		 0.66442323 0.48635191 0.71239418 0.49454185 0.71431065 0.487275 0.73696977 0.48163307
		 0.73090118 0.48694909 0.68917084 0.49511358 0.68907523 0.48512858 0.64060694 0.49423385
		 0.66352332 0.48636287 0.66648412 0.48094386 0.64821094 0.49033844 0.54388094 0.49014819
		 0.56608456 0.48882908 0.61752701 0.48927701 0.59189743 0.46681488 0.32292667 0.46741903
		 0.34530917 0.43407452 0.3446331 0.43462729 0.32014704 0.46914482 0.49208355 0.46889329
		 0.51391649 0.43627167 0.51333749 0.43619299 0.49227047 0.46783531 0.41583711 0.46828377
		 0.42842448 0.43510592 0.43053499 0.43478942 0.41633204 0.43583298 0.30554616 0.47112358
		 0.31046379 0.46817732 0.3940281 0.43446398 0.3926135 0.4697324 0.44816136 0.43597531
		 0.45084572 0.46787 0.36969891 0.43423569 0.36876044 0.46951616 0.47004694 0.43611801
		 0.47140443 0.32461536 0.39333618 0.32574296 0.41664302 0.29231787 0.41668117 0.29091763
		 0.39372298 0.32404745 0.37044352 0.29034781 0.37111124 0.32403576 0.34759471 0.29025614
		 0.34856144 0.32422817 0.32448706 0.29055226 0.32577363 0.28972888 0.31157687 0.32308996
		 0.31028882 0.32541227 0.4892537 0.32663631 0.50897717 0.29509366 0.50959569 0.29151618
		 0.48979342 0.32453763 0.47012442 0.29052532 0.47043073 0.32468855 0.45092255 0.29058421
		 0.45101714 0.32546556 0.43108642 0.29300606 0.43106443 0.36118114 0.39292848 0.36211073
		 0.41665339 0.36075354 0.36946547 0.36077476 0.34599757 0.36102712 0.32229432 0.36002231
		 0.30804095 0.36228609 0.49051839 0.36252463 0.5106436 0.36184895 0.47078007 0.36170161
		 0.4510704 0.36191952 0.43105042 0.39765632 0.39261377 0.39844513 0.4165968 0.39737654
		 0.36873513 0.39737892 0.34474266 0.39796937 0.32050121 0.39754057 0.30619347 0.39916539
		 0.49177611 0.3992964 0.5122996 0.39892721 0.47146973 0.39868891 0.45127112 0.39857292
		 0.43099001 0.28249514 0.50897306 0.27853358 0.49122912 0.28705919 0.49019635 0.29018319
		 0.50670946 0.27734089 0.47069657 0.28604519 0.4705103 0.28611207 0.45080054 0.27752674
		 0.4501344 0.28045988 0.43223941 0.28826165 0.43416524 0.2793023 0.51369137 0.27700984
		 0.42766747 0.27212787 0.44982743 0.2731607 0.49178195 0.27188456 0.4708032 0.48175704
		 0.34550563 0.47293532 0.34533235 0.47306728 0.32292882 0.4815402 0.3257136 0.48227406
		 0.36982104 0.47358871 0.36977878 0.47400606 0.41748515 0.47362673 0.39445615 0.48220158
		 0.39428851 0.48226213 0.41422606 0.47516358 0.31459829 0.47411513 0.51120961 0.47408533
		 0.4921698 0.47438109 0.47001964 0.47354782 0.42637044 0.4744699 0.44729424 0.44845128
		 0.78772855 0.45698941 0.81093395 0.42423436 0.81228888 0.42175972 0.78702581 0.46069974
		 0.96822309 0.45831889 0.99035257 0.42541787 0.98743033 0.42775944 0.9659524 0.46960735
		 0.8849954 0.46801016 0.90053308 0.43544456 0.90090597 0.43526748 0.8862769 0.42700729
		 0.77221382 0.46771991 0.78246868 0.46390381 0.85939044 0.43128943 0.86154425 0.46523765
		 0.92335331 0.43245521 0.92239726 0.46082398 0.83473545 0.4277949 0.83697283 0.46311858
		 0.94578934 0.43013644 0.94415867 0.32196918 0.86461282 0.32402417 0.88676172 0.28935817
		 0.88661593 0.28696921 0.86675084 0.31927648 0.84277552 0.28496215 0.84526622 0.31737855
		 0.82040238 0.28287145 0.82410419 0.31338367 0.79684031 0.28405023 0.80366445 0.26852667
		 0.79675645 0.30510855 0.78347874 0.31619528 0.9582544 0.31450966 0.97792131 0.28070936
		 0.97576135 0.28217825 0.95597368 0.31800905 0.93875581 0.2843284 0.93616456 0.32055512
		 0.91968507 0.28526375 0.91631651 0.32287785 0.90071076 0.28878617 0.89909017 0.35879415
		 0.86342961 0.36098132 0.88688487 0.35607731 0.84020215 0.35297063 0.81640893 0.349702
		 0.7923063 0.34546795 0.77819049 0.35358688 0.96093422 0.35160258 0.98112267 0.35565814
		 0.94088036 0.35818961 0.92102569 0.36019433 0.90123338 0.39473709 0.86254352 0.39774168
		 0.88670462;
	setAttr ".uvst[0].uvsp[250:287]" 0.39166558 0.83839661 0.38835183 0.81385511
		 0.38643405 0.78908914 0.38519698 0.77413327 0.39058423 0.96349221 0.3884097 0.98427445
		 0.39286119 0.94256872 0.39527231 0.9217779 0.39760002 0.90129608 0.27733395 0.80568492
		 0.27624318 0.82389653 0.26568493 0.82272851 0.26885045 0.80212945 0.27824333 0.84545875
		 0.26733753 0.84576499 0.27052662 0.8682642 0.28072682 0.86756599 0.282621 0.88824564
		 0.2719996 0.88620239 0.27528152 0.9725737 0.27702406 0.95554799 0.27912077 0.93580145
		 0.28319216 0.89677072 0.28041449 0.91561317 0.47492874 0.80753112 0.46367934 0.80974364
		 0.45562667 0.79006827 0.4658221 0.78769666 0.47880137 0.83206993 0.46766666 0.83383274
		 0.47418615 0.87982517 0.47057602 0.85842037 0.48175639 0.85623467 0.48474687 0.87643152
		 0.48014969 0.806696 0.48398653 0.83116567 0.49078184 0.87904352 0.48710063 0.85533011;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 240 ".vt";
	setAttr ".vt[0:165]"  -0.2093785 0.19612113 0.35235199 -0.15948068 0.22621849 0.35369581
		 -0.10357861 0.24271286 0.35415316 -0.045322325 0.24452689 0.35369581 0.011484738 0.23154238 0.35235199
		 -0.00015921891 0.20004988 0.35054988 -0.048593756 0.21112061 0.35169533 -0.098263964 0.20957384 0.35208586
		 -0.14592673 0.19551063 0.35169533 -0.18847032 0.16984916 0.35054988 -0.20995618 0.19972348 0.25411603
		 -0.16006361 0.22985375 0.25456339 -0.10416347 0.24635902 0.25471643 -0.045905318 0.24816191 0.25456339
		 0.010907005 0.23514462 0.25411603 -0.00072989054 0.20360801 0.25351384 -0.049168911 0.2147069 0.25389689
		 -0.098840639 0.21316977 0.2540268 -0.14650191 0.19909704 0.25389689 -0.18904109 0.17340741 0.25351384
		 -0.20995618 0.19972348 0.15580466 -0.16006361 0.22985375 0.15535638 -0.10416347 0.24635902 0.15520334
		 -0.045905318 0.24816191 0.15535638 0.010907005 0.23514462 0.15580466 -0.00072989054 0.20360801 0.15640587
		 -0.049168911 0.2147069 0.15602377 -0.098840639 0.21316977 0.15589297 -0.14650191 0.19909704 0.15602377
		 -0.18904109 0.17340741 0.15640587 -0.2093785 0.19612113 0.05756864 -0.15948068 0.22621849 0.056224793
		 -0.10357861 0.24271286 0.055767477 -0.045322325 0.24452689 0.056224793 0.011484738 0.23154238 0.05756864
		 -0.00015921891 0.20004988 0.059370726 -0.048593756 0.21112061 0.05822444 -0.098263964 0.20957384 0.057834715
		 -0.14592673 0.19551063 0.05822444 -0.18847032 0.16984916 0.059370726 0.00088415667 0.19354391 0.43912002
		 -0.0039956309 0.20210251 0.44837442 -0.047541376 0.20455873 0.44102734 -0.046768103 0.21080509 0.44995594
		 -0.187427 0.16334331 0.43912002 -0.18546827 0.17299852 0.44837442 -0.20832099 0.1895273 0.44211909
		 -0.19650678 0.18683198 0.4499597 0.012542222 0.22494844 0.44211909 0.0021635219 0.21869376 0.4499597
		 -0.044254299 0.23786736 0.44435886 -0.045031499 0.22840257 0.45171586 -0.15841256 0.21955907 0.44435886
		 -0.15471475 0.21081205 0.45171586 -0.14756235 0.19464031 0.44995594 -0.14487435 0.18894887 0.44102734
		 -0.10250698 0.23603074 0.44512153 -0.10100065 0.22663797 0.45244765 -0.098201379 0.20918366 0.4506295
		 -0.097208545 0.20299283 0.44167781 -0.0037336908 0.20162009 -0.03840071 0.00088927336 0.1935121 -0.02963388
		 -0.04753628 0.20452681 -0.031541198 -0.046803683 0.21044457 -0.039999172 0.01254734 0.22491662 -0.032633007
		 0.0027148835 0.21899126 -0.040060669 -0.18556608 0.17245851 -0.03840071 -0.18742187 0.1633115 -0.02963388
		 -0.19712339 0.18694185 -0.040060669 -0.20831586 0.18949549 -0.032633007 -0.044985466 0.22886904 -0.041841239
		 -0.044249203 0.23783529 -0.034871757 -0.15490414 0.2112406 -0.041841239 -0.15840755 0.21952701 -0.034871757
		 -0.14486922 0.18891707 -0.031541198 -0.14741565 0.19430888 -0.039999172 -0.1010748 0.22710069 -0.042575449
		 -0.10250191 0.23599893 -0.035634488 -0.097203419 0.20296113 -0.032191694 -0.09814404 0.20882605 -0.040671051
		 -0.18867655 0.135438 0.79007041 -0.14462151 0.16403475 0.79507446 -0.095002636 0.17932926 0.79678011
		 -0.04308952 0.18031803 0.79507446 0.0076985992 0.16693178 0.79007041 -0.0022930466 0.13645981 0.78335679
		 -0.045581166 0.14787555 0.7876265 -0.08982347 0.14703554 0.78907955 -0.13210972 0.13399839 0.7876265
		 -0.16965719 0.10961859 0.78335679 -0.1947092 0.15215991 0.71597481 -0.14911659 0.18116474 0.72030365
		 -0.097802266 0.19678608 0.72177935 -0.044176597 0.19799459 0.72030365 0.0081996731 0.18470167 0.71597481
		 -0.00227369 0.15393612 0.71017039 -0.046901386 0.16527449 0.71386063 -0.092584357 0.16425045 0.71511877
		 -0.13629639 0.15093766 0.71386063 -0.1751404 0.12621245 0.71017039 -0.2001698 0.16535136 0.6411581
		 -0.15303697 0.19473149 0.64480674 -0.10002868 0.21066833 0.64604712 -0.044695187 0.21210684 0.64480674
		 0.0092612691 0.19893906 0.6411581 -0.0016997978 0.1679233 0.63626897 -0.047660347 0.17915736 0.63937926
		 -0.094779894 0.17794022 0.64043772 -0.13991682 0.16436158 0.63937926 -0.18005952 0.13931879 0.63626897
		 -0.20505631 0.1749914 0.56573308 -0.15638016 0.20471396 0.56869221 -0.10167836 0.22095475 0.56969976
		 -0.044641215 0.22263409 0.56869221 0.010888141 0.20962372 0.56573308 -0.00056694634 0.1784011 0.56176531
		 -0.047854092 0.18950355 0.5642879 -0.096406683 0.1880841 0.56514847 -0.14296819 0.17424953 0.5642879
		 -0.184412 0.14891683 0.56176531 -0.0018083733 0.11730301 0.8495605 -0.0059846193 0.12449321 0.85828567
		 -0.043863077 0.12875104 0.85439658 -0.043112785 0.1336135 0.86229241 -0.16412692 0.091271043 0.8495605
		 -0.16240859 0.09940657 0.85828567 -0.1826296 0.1169131 0.85716486 -0.17218375 0.11295356 0.86230469
		 0.0077478401 0.1474451 0.85716486 -0.00093591399 0.14041759 0.86230469 -0.041576516 0.16087185 0.86283886
		 -0.041904774 0.15058334 0.86675394 -0.13997756 0.14509057 0.86283886 -0.13644841 0.13542075 0.86675394
		 -0.12999438 0.11967984 0.86229241 -0.12776123 0.11529577 0.85439658 -0.091913864 0.16006963 0.86477268
		 -0.090268895 0.14981258 0.868613 -0.087557301 0.1329051 0.86399961 -0.086781427 0.12806705 0.85604453
		 -0.0040749647 0.19392022 0.48774299 0.00049667619 0.18455206 0.4946433 -0.047803376 0.19554429 0.49657682
		 -0.047155272 0.2027173 0.48936334 0.012144592 0.21588784 0.49768505 0.002386421 0.21127419 0.48942694
		 -0.18593286 0.1647546 0.48774299 -0.1873458 0.15442656 0.4946433 -0.19749694 0.17921762 0.48942694
		 -0.20820849 0.18054849 0.49768505 -0.045328829 0.22111996 0.49123061 -0.044513438 0.22877911 0.49995145
		 -0.15525356 0.20349069 0.49123061 -0.15842307 0.21051076 0.49995145 -0.14490537 0.1799715 0.49657682
		 -0.14776406 0.18658209 0.48936334 -0.10141854 0.21933481 0.4919745 -0.10263926 0.22694604 0.50072253
		 -0.097352728 0.19398299 0.49723509 -0.098491773 0.20108542 0.49004391 -0.15623374 0.022770911 1.077301979
		 -0.11983849 0.045015484 1.084999084 -0.079004332 0.057155237 1.087622166 -0.036421787 0.058393508 1.084999084
		 0.0051042549 0.048645645 1.077301979 -0.0033734739 0.025286421 1.066979647;
	setAttr ".vt[166:239]" -0.038767252 0.033599615 1.073543787 -0.075057611 0.032546282 1.075780749
		 -0.10985738 0.022198454 1.073543787 -0.14087661 0.0032342076 1.066979647 -0.16242851 0.044230953 1.033325195
		 -0.12478121 0.066881239 1.040619969 -0.082557961 0.079313487 1.043108463 -0.038564581 0.080708325 1.040619969
		 0.004277572 0.070966646 1.033325195 -0.0045807883 0.047271878 1.023542047 -0.041084748 0.055581495 1.029761553
		 -0.078562066 0.054397538 1.031883717 -0.11452997 0.043802634 1.029761553 -0.14660479 0.024494633 1.023542047
		 -0.16818464 0.062987417 0.98813057 -0.12928368 0.0860181 0.99501503 -0.085672542 0.098734081 0.99735975
		 -0.040272165 0.10029335 0.99501503 0.0038798079 0.090582401 0.98813057 -0.005363699 0.066585213 0.97889936
		 -0.042972591 0.074870631 0.98477054 -0.081633493 0.073549062 0.98676836 -0.11876872 0.062714741 0.98477054
		 -0.15190062 0.043084174 0.97889936 -0.17349887 0.079010814 0.94178498 -0.13334201 0.10239692 0.94824791
		 -0.088343427 0.11538777 0.95044851 -0.0415393 0.1171198 0.94824791 0.0039168112 0.1074641 0.94178498
		 -0.0057166852 0.083197877 0.93312323 -0.044425603 0.091438293 0.93863082 -0.084267303 0.08997187 0.94050801
		 -0.12256946 0.07890588 0.93863082 -0.15676022 0.058974072 0.93312323 -0.0018864423 0.0027583968 1.10556102
		 -0.0051206164 0.0074376389 1.11280608 -0.036257464 0.011039682 1.11245513 -0.035475016 0.013999134 1.1185199
		 -0.1352443 -0.018629014 1.10556102 -0.13363552 -0.013173088 1.11280608 -0.15016212 0.00067020906 1.11640215
		 -0.1415168 -0.002977157 1.118536 0.0062482543 0.02575469 1.11640215 -0.00082290173 0.019586787 1.118536
		 -0.034064215 0.035467312 1.12448895 -0.034316298 0.026904598 1.12487924 -0.11490856 0.022501811 1.12448895
		 -0.11199155 0.014447331 1.12487924 -0.10685532 0.0025514513 1.1185199 -0.10518651 -1.4902005e-005 1.11245513
		 -0.075348362 0.034358963 1.12724483 -0.073982045 0.025839731 1.12752795 -0.071926162 0.013020486 1.1209538
		 -0.071456894 0.01009468 1.11480498 -0.0098441429 0.10371324 0.88885748 -0.0060163178 0.095568344 0.89119351
		 -0.045567695 0.10378246 0.89633608 -0.045128297 0.11025614 0.89316523 0.0037594326 0.12002844 0.89927828
		 -0.004421521 0.11725955 0.89333284 -0.15925513 0.079751283 0.88885748 -0.16034406 0.070817873 0.89119351
		 -0.16864185 0.09092252 0.89333284 -0.17727844 0.090994298 0.89927828 -0.043501113 0.12458594 0.89813483
		 -0.04263607 0.12966183 0.90530789 -0.13381317 0.11010201 0.89813483 -0.136222 0.1146529 0.90530789
		 -0.1253448 0.090988085 0.89633608 -0.12778661 0.096999712 0.89316523 -0.089532956 0.12280497 0.90011179
		 -0.090338752 0.12782948 0.90736258 -0.086231872 0.10222152 0.89808726 -0.087259278 0.10862765 0.89497495;
	setAttr -s 468 ".ed";
	setAttr ".ed[0:165]"  0 46 0 1 52 0 0 1 0 2 56 0 1 2 0 3 50 0 2 3 0 4 48 0
		 3 4 0 5 40 0 4 5 0 6 16 0 5 6 0 7 17 0 6 7 0 8 18 0 7 8 0 9 44 0 8 9 0 9 0 0 10 0 0
		 11 1 0 10 11 0 12 2 0 11 12 0 13 3 0 12 13 0 14 4 0 13 14 0 15 5 0 14 15 0 16 26 0
		 15 16 0 17 27 0 16 17 0 18 28 0 17 18 0 19 9 0 18 19 0 19 10 0 20 10 0 21 11 0 20 21 0
		 22 12 0 21 22 0 23 13 0 22 23 0 24 14 0 23 24 0 25 15 0 24 25 0 26 36 0 25 26 0 27 37 0
		 26 27 0 28 38 0 27 28 0 29 19 0 28 29 0 29 20 0 30 20 0 31 21 0 30 31 0 32 22 0 31 32 0
		 33 23 0 32 33 0 34 24 0 33 34 0 35 25 0 34 35 0 36 62 0 35 36 0 37 78 0 36 37 0 38 74 0
		 37 38 0 39 29 0 38 39 0 39 30 0 42 6 0 55 8 0 59 7 0 49 51 0 51 43 1 43 41 0 41 49 0
		 40 42 0 51 57 0 57 58 1 58 43 0 42 59 0 53 47 0 47 45 0 45 54 0 44 46 0 46 52 0 48 40 0
		 50 48 0 54 58 0 57 53 0 53 54 1 52 56 0 55 44 0 56 50 0 59 55 0 41 40 0 48 49 0 43 42 1
		 58 59 1 45 44 0 47 46 0 53 52 1 51 50 1 57 56 1 54 55 1 61 35 0 64 34 0 67 39 0 69 30 0
		 71 33 0 73 31 0 77 32 0 61 64 0 63 70 1 70 65 0 65 60 0 60 63 0 76 70 0 63 79 0 62 61 0
		 64 71 0 67 74 0 68 72 0 72 75 1 75 66 0 66 68 0 69 67 0 71 77 0 76 79 1 79 75 0 72 76 0
		 73 69 0 74 78 0 77 73 0 78 62 0 61 60 0 65 64 0 63 62 1 70 71 1 67 66 0 75 74 1 69 68 0
		 76 77 1 72 73 1 79 78 1 80 126 0 81 132 0 80 81 0 82 136 0 81 82 0 83 130 0 82 83 0
		 84 128 0 83 84 0 85 120 0;
	setAttr ".ed[166:331]" 84 85 0 86 96 0 85 86 0 87 97 0 86 87 0 88 98 0 87 88 0
		 89 124 0 88 89 0 89 80 0 90 80 0 91 81 0 90 91 0 92 82 0 91 92 0 93 83 0 92 93 0
		 94 84 0 93 94 0 95 85 0 94 95 0 96 106 0 95 96 0 97 107 0 96 97 0 98 108 0 97 98 0
		 99 89 0 98 99 0 99 90 0 100 90 0 101 91 0 100 101 0 102 92 0 101 102 0 103 93 0 102 103 0
		 104 94 0 103 104 0 105 95 0 104 105 0 106 116 0 105 106 0 107 117 0 106 107 0 108 118 0
		 107 108 0 109 99 0 108 109 0 109 100 0 110 100 0 111 101 0 110 111 0 112 102 0 111 112 0
		 113 103 0 112 113 0 114 104 0 113 114 0 115 105 0 114 115 0 116 142 0 115 116 0 117 158 0
		 116 117 0 118 154 0 117 118 0 119 109 0 118 119 0 119 110 0 122 86 0 135 88 0 139 87 0
		 129 131 0 131 123 1 123 121 0 121 129 0 120 122 0 131 137 0 137 138 1 138 123 0 122 139 0
		 133 127 0 127 125 0 125 134 0 124 126 0 126 132 0 128 120 0 130 128 0 134 138 0 137 133 0
		 133 134 1 132 136 0 135 124 0 136 130 0 139 135 0 121 120 0 128 129 0 123 122 1 138 139 1
		 125 124 0 127 126 0 133 132 1 131 130 1 137 136 1 134 135 1 141 115 0 144 114 0 147 119 0
		 149 110 0 151 113 0 153 111 0 157 112 0 141 144 0 150 145 0 145 140 0 140 143 0 156 150 0
		 150 143 1 143 159 0 142 141 0 144 151 0 147 154 0 148 152 0 152 155 1 155 146 0 146 148 0
		 149 147 0 151 157 0 156 159 1 159 155 0 152 156 0 153 149 0 154 158 0 157 153 0 158 142 0
		 141 140 0 145 144 0 143 142 1 150 151 1 147 146 0 155 154 1 149 148 0 156 157 1 152 153 1
		 159 158 1 160 206 0 161 212 0 160 161 0 162 216 0 161 162 0 163 210 0 162 163 0 164 208 0
		 163 164 0 165 200 0 164 165 0 166 176 0 165 166 0 167 177 0 166 167 0 168 178 0 167 168 0
		 169 204 0 168 169 0 169 160 0;
	setAttr ".ed[332:467]" 170 160 0 171 161 0 170 171 0 172 162 0 171 172 0 173 163 0
		 172 173 0 174 164 0 173 174 0 175 165 0 174 175 0 176 186 0 175 176 0 177 187 0 176 177 0
		 178 188 0 177 178 0 179 169 0 178 179 0 179 170 0 180 170 0 181 171 0 180 181 0 182 172 0
		 181 182 0 183 173 0 182 183 0 184 174 0 183 184 0 185 175 0 184 185 0 186 196 0 185 186 0
		 187 197 0 186 187 0 188 198 0 187 188 0 189 179 0 188 189 0 189 180 0 190 180 0 191 181 0
		 190 191 0 192 182 0 191 192 0 193 183 0 192 193 0 194 184 0 193 194 0 195 185 0 194 195 0
		 196 222 0 195 196 0 197 238 0 196 197 0 198 234 0 197 198 0 199 189 0 198 199 0 199 190 0
		 202 166 0 215 168 0 219 167 0 209 211 0 211 203 1 203 201 0 201 209 0 200 202 0 211 217 0
		 217 218 1 218 203 0 202 219 0 213 207 0 207 205 0 205 214 0 204 206 0 206 212 0 208 200 0
		 210 208 0 214 218 0 217 213 0 213 214 1 212 216 0 215 204 0 216 210 0 219 215 0 201 200 0
		 208 209 0 203 202 1 218 219 1 205 204 0 207 206 0 213 212 1 211 210 1 217 216 1 214 215 1
		 221 195 0 224 194 0 227 199 0 229 190 0 231 193 0 233 191 0 237 192 0 221 224 0 230 225 0
		 225 220 0 220 223 0 236 230 0 230 223 1 223 239 0 222 221 0 224 231 0 227 234 0 228 232 0
		 232 235 1 235 226 0 226 228 0 229 227 0 231 237 0 236 239 1 239 235 0 232 236 0 233 229 0
		 234 238 0 237 233 0 238 222 0 221 220 0 225 224 0 223 222 1 230 231 1 227 226 0 235 234 1
		 229 228 0 236 237 1 232 233 1 239 238 1;
	setAttr -s 234 -ch 936 ".fc[0:233]" -type "polyFaces" 
		f 4 131 120 68 -118
		mu 0 4 0 1 2 3
		f 4 130 116 72 71
		mu 0 4 4 5 6 7
		f 4 137 118 79 -120
		mu 0 4 8 9 10 11
		f 4 -117 123 117 70
		mu 0 4 6 5 12 13
		f 4 142 119 62 -122
		mu 0 4 14 8 11 15
		f 4 132 -76 78 -119
		mu 0 4 9 16 17 10
		f 4 144 121 64 -123
		mu 0 4 18 14 15 19
		f 4 143 -74 76 75
		mu 0 4 16 20 21 17
		f 4 138 122 66 -121
		mu 0 4 1 18 19 2
		f 4 145 -72 74 73
		mu 0 4 20 4 7 21
		f 4 -3 0 96 -2
		mu 0 4 22 23 24 25
		f 4 -5 1 102 -4
		mu 0 4 26 22 25 27
		f 4 -7 3 104 -6
		mu 0 4 28 26 27 29
		f 4 -9 5 98 -8
		mu 0 4 30 28 29 31
		f 4 97 -10 -11 7
		mu 0 4 32 33 34 35
		f 4 -13 9 87 80
		mu 0 4 36 34 33 37
		f 4 -15 -81 91 82
		mu 0 4 38 36 37 39
		f 4 -17 -83 105 81
		mu 0 4 40 38 39 41
		f 4 -19 -82 103 -18
		mu 0 4 42 40 41 43
		f 4 -20 17 95 -1
		mu 0 4 23 42 43 24
		f 4 -23 20 2 -22
		mu 0 4 44 45 23 22
		f 4 -25 21 4 -24
		mu 0 4 46 44 22 26
		f 4 -27 23 6 -26
		mu 0 4 47 46 26 28
		f 4 -29 25 8 -28
		mu 0 4 48 47 28 30
		f 4 -30 -31 27 10
		mu 0 4 34 49 50 35
		f 4 -33 29 12 11
		mu 0 4 51 49 34 36
		f 4 -35 -12 14 13
		mu 0 4 52 51 36 38
		f 4 -37 -14 16 15
		mu 0 4 53 52 38 40
		f 4 -39 -16 18 -38
		mu 0 4 54 53 40 42
		f 4 -40 37 19 -21
		mu 0 4 45 54 42 23
		f 4 -43 40 22 -42
		mu 0 4 55 56 45 44
		f 4 -45 41 24 -44
		mu 0 4 57 55 44 46
		f 4 -47 43 26 -46
		mu 0 4 58 57 46 47
		f 4 -49 45 28 -48
		mu 0 4 59 58 47 48
		f 4 -50 -51 47 30
		mu 0 4 49 60 61 50
		f 4 -53 49 32 31
		mu 0 4 62 60 49 51
		f 4 -55 -32 34 33
		mu 0 4 63 62 51 52
		f 4 -57 -34 36 35
		mu 0 4 64 63 52 53
		f 4 -59 -36 38 -58
		mu 0 4 65 64 53 54
		f 4 -60 57 39 -41
		mu 0 4 56 65 54 45
		f 4 -63 60 42 -62
		mu 0 4 15 11 56 55
		f 4 -65 61 44 -64
		mu 0 4 19 15 55 57
		f 4 -67 63 46 -66
		mu 0 4 2 19 57 58
		f 4 -69 65 48 -68
		mu 0 4 3 2 58 59
		f 4 -70 -71 67 50
		mu 0 4 60 6 13 61
		f 4 -73 69 52 51
		mu 0 4 7 6 60 62
		f 4 -75 -52 54 53
		mu 0 4 21 7 62 63
		f 4 -77 -54 56 55
		mu 0 4 17 21 63 64
		f 4 -79 -56 58 -78
		mu 0 4 10 17 64 65
		f 4 -80 77 59 -61
		mu 0 4 11 10 65 56
		f 4 83 84 85 86
		mu 0 4 66 67 68 69
		f 4 88 89 90 -85
		mu 0 4 67 70 71 68
		f 4 -102 92 93 94
		mu 0 4 72 73 74 75
		f 4 99 -90 100 101
		mu 0 4 72 71 70 73
		f 4 106 -98 107 -87
		mu 0 4 76 33 32 77
		f 4 -107 -86 108 -88
		mu 0 4 33 76 78 37
		f 4 -109 -91 109 -92
		mu 0 4 37 78 79 39
		f 4 110 -104 -116 -95
		mu 0 4 80 43 41 81
		f 4 -111 -94 111 -96
		mu 0 4 43 80 74 24
		f 4 -112 -93 112 -97
		mu 0 4 24 74 73 25
		f 4 -108 -99 -114 -84
		mu 0 4 66 31 29 67
		f 4 113 -105 -115 -89
		mu 0 4 67 29 27 70
		f 4 -113 -101 114 -103
		mu 0 4 25 73 70 27
		f 4 115 -106 -110 -100
		mu 0 4 81 41 39 79
		f 4 124 125 126 127
		mu 0 4 82 83 84 85
		f 4 -140 128 -125 129
		mu 0 4 86 87 83 82
		f 4 133 134 135 136
		mu 0 4 88 89 90 91
		f 4 139 140 -135 141
		mu 0 4 87 86 90 89
		f 4 146 -127 147 -124
		mu 0 4 5 85 84 12
		f 4 -147 -131 -149 -128
		mu 0 4 85 5 4 82
		f 4 148 -146 -156 -130
		mu 0 4 82 4 20 86
		f 4 -148 -126 149 -132
		mu 0 4 0 92 93 1
		f 4 150 -136 151 -133
		mu 0 4 9 91 90 16
		f 4 -151 -138 152 -137
		mu 0 4 91 9 8 88
		f 4 -153 -143 -155 -134
		mu 0 4 88 8 14 94
		f 4 -150 -129 153 -139
		mu 0 4 1 93 95 18
		f 4 154 -145 -154 -142
		mu 0 4 94 14 18 95
		f 4 -152 -141 155 -144
		mu 0 4 16 90 86 20
		f 4 287 276 224 -274
		mu 0 4 96 97 98 99
		f 4 286 272 228 227
		mu 0 4 100 101 102 103
		f 4 293 274 235 -276
		mu 0 4 104 105 106 107
		f 4 -273 279 273 226
		mu 0 4 108 109 96 99
		f 4 298 275 218 -278
		mu 0 4 110 104 107 111
		f 4 288 -232 234 -275
		mu 0 4 105 112 113 106
		f 4 300 277 220 -279
		mu 0 4 114 110 111 115
		f 4 299 -230 232 231
		mu 0 4 112 116 117 113
		f 4 294 278 222 -277
		mu 0 4 97 114 115 98
		f 4 301 -228 230 229
		mu 0 4 116 100 103 117
		f 4 -159 156 252 -158
		mu 0 4 118 119 120 121
		f 4 -161 157 258 -160
		mu 0 4 122 118 121 123
		f 4 -163 159 260 -162
		mu 0 4 124 122 123 125
		f 4 -165 161 254 -164
		mu 0 4 126 124 125 127
		f 4 253 -166 -167 163
		mu 0 4 127 128 129 126
		f 4 -169 165 243 236
		mu 0 4 130 131 132 133
		f 4 -171 -237 247 238
		mu 0 4 134 130 133 135
		f 4 -173 -239 261 237
		mu 0 4 136 134 135 137
		f 4 -175 -238 259 -174
		mu 0 4 138 136 137 139
		f 4 -176 173 251 -157
		mu 0 4 119 138 139 120
		f 4 -179 176 158 -178
		mu 0 4 140 141 119 118
		f 4 -181 177 160 -180
		mu 0 4 142 140 118 122
		f 4 -183 179 162 -182
		mu 0 4 143 142 122 124
		f 4 -185 181 164 -184
		mu 0 4 144 143 124 126
		f 4 -186 -187 183 166
		mu 0 4 129 145 144 126
		f 4 -189 185 168 167
		mu 0 4 146 147 131 130
		f 4 -191 -168 170 169
		mu 0 4 148 146 130 134
		f 4 -193 -170 172 171
		mu 0 4 149 148 134 136
		f 4 -195 -172 174 -194
		mu 0 4 150 149 136 138
		f 4 -196 193 175 -177
		mu 0 4 141 150 138 119
		f 4 -199 196 178 -198
		mu 0 4 151 152 141 140
		f 4 -201 197 180 -200
		mu 0 4 153 151 140 142
		f 4 -203 199 182 -202
		mu 0 4 154 153 142 143
		f 4 -205 201 184 -204
		mu 0 4 155 154 143 144
		f 4 -206 -207 203 186
		mu 0 4 145 156 155 144
		f 4 -209 205 188 187
		mu 0 4 157 158 147 146
		f 4 -211 -188 190 189
		mu 0 4 159 157 146 148
		f 4 -213 -190 192 191
		mu 0 4 160 159 148 149
		f 4 -215 -192 194 -214
		mu 0 4 161 160 149 150
		f 4 -216 213 195 -197
		mu 0 4 152 161 150 141
		f 4 -219 216 198 -218
		mu 0 4 111 107 152 151
		f 4 -221 217 200 -220
		mu 0 4 115 111 151 153
		f 4 -223 219 202 -222
		mu 0 4 98 115 153 154
		f 4 -225 221 204 -224
		mu 0 4 99 98 154 155
		f 4 -226 -227 223 206
		mu 0 4 156 108 99 155
		f 4 -229 225 208 207
		mu 0 4 103 102 158 157
		f 4 -231 -208 210 209
		mu 0 4 117 103 157 159
		f 4 -233 -210 212 211
		mu 0 4 113 117 159 160
		f 4 -235 -212 214 -234
		mu 0 4 106 113 160 161
		f 4 -236 233 215 -217
		mu 0 4 107 106 161 152
		f 4 239 240 241 242
		mu 0 4 162 163 164 165
		f 4 244 245 246 -241
		mu 0 4 163 166 167 164
		f 4 -258 248 249 250
		mu 0 4 168 169 170 171
		f 4 255 -246 256 257
		mu 0 4 168 167 166 169
		f 4 262 -254 263 -243
		mu 0 4 165 132 172 162
		f 4 -263 -242 264 -244
		mu 0 4 132 165 164 133
		f 4 -265 -247 265 -248
		mu 0 4 133 164 167 135
		f 4 266 -260 -272 -251
		mu 0 4 171 139 137 168
		f 4 -267 -250 267 -252
		mu 0 4 139 171 170 173
		f 4 -268 -249 268 -253
		mu 0 4 173 170 169 174
		f 4 -264 -255 -270 -240
		mu 0 4 162 172 175 163
		f 4 269 -261 -271 -245
		mu 0 4 163 175 176 166
		f 4 -269 -257 270 -259
		mu 0 4 174 169 166 176
		f 4 271 -262 -266 -256
		mu 0 4 168 137 135 167
		f 4 -285 280 281 282
		mu 0 4 177 178 179 180
		f 4 -296 283 284 285
		mu 0 4 181 182 178 177
		f 4 289 290 291 292
		mu 0 4 183 184 185 186
		f 4 295 296 -291 297
		mu 0 4 182 181 185 184
		f 4 302 -282 303 -280
		mu 0 4 109 187 179 96
		f 4 -303 -287 -305 -283
		mu 0 4 188 101 100 189
		f 4 304 -302 -312 -286
		mu 0 4 189 100 116 190
		f 4 -304 -281 305 -288
		mu 0 4 96 179 178 97
		f 4 306 -292 307 -289
		mu 0 4 105 191 192 112
		f 4 -307 -294 308 -293
		mu 0 4 191 105 104 183
		f 4 -309 -299 -311 -290
		mu 0 4 183 104 110 184
		f 4 -306 -284 309 -295
		mu 0 4 97 178 182 114
		f 4 310 -301 -310 -298
		mu 0 4 184 110 114 182
		f 4 -308 -297 311 -300
		mu 0 4 112 192 190 116
		f 4 443 432 380 -430
		mu 0 4 193 194 195 196
		f 4 442 428 384 383
		mu 0 4 197 198 199 200
		f 4 449 430 391 -432
		mu 0 4 201 202 203 204
		f 4 -429 435 429 382
		mu 0 4 205 206 193 196
		f 4 454 431 374 -434
		mu 0 4 207 201 204 208
		f 4 444 -388 390 -431
		mu 0 4 202 209 210 203
		f 4 456 433 376 -435
		mu 0 4 211 207 208 212
		f 4 455 -386 388 387
		mu 0 4 209 213 214 210
		f 4 450 434 378 -433
		mu 0 4 194 211 212 195
		f 4 457 -384 386 385
		mu 0 4 213 197 200 214
		f 4 -315 312 408 -314
		mu 0 4 215 216 217 218
		f 4 -317 313 414 -316
		mu 0 4 219 215 218 220
		f 4 -319 315 416 -318
		mu 0 4 221 219 220 222
		f 4 -321 317 410 -320
		mu 0 4 223 221 222 224
		f 4 409 -322 -323 319
		mu 0 4 224 225 226 223
		f 4 -325 321 399 392
		mu 0 4 227 228 229 230
		f 4 -327 -393 403 394
		mu 0 4 231 227 230 232
		f 4 -329 -395 417 393
		mu 0 4 233 231 232 234
		f 4 -331 -394 415 -330
		mu 0 4 235 233 234 236
		f 4 -332 329 407 -313
		mu 0 4 216 235 236 217
		f 4 -335 332 314 -334
		mu 0 4 237 238 216 215
		f 4 -337 333 316 -336
		mu 0 4 239 237 215 219
		f 4 -339 335 318 -338
		mu 0 4 240 239 219 221
		f 4 -341 337 320 -340
		mu 0 4 241 240 221 223
		f 4 -342 -343 339 322
		mu 0 4 226 242 241 223
		f 4 -345 341 324 323
		mu 0 4 243 244 228 227
		f 4 -347 -324 326 325
		mu 0 4 245 243 227 231
		f 4 -349 -326 328 327
		mu 0 4 246 245 231 233
		f 4 -351 -328 330 -350
		mu 0 4 247 246 233 235
		f 4 -352 349 331 -333
		mu 0 4 238 247 235 216
		f 4 -355 352 334 -354
		mu 0 4 248 249 238 237
		f 4 -357 353 336 -356
		mu 0 4 250 248 237 239
		f 4 -359 355 338 -358
		mu 0 4 251 250 239 240
		f 4 -361 357 340 -360
		mu 0 4 252 251 240 241
		f 4 -362 -363 359 342
		mu 0 4 242 253 252 241
		f 4 -365 361 344 343
		mu 0 4 254 255 244 243
		f 4 -367 -344 346 345
		mu 0 4 256 254 243 245
		f 4 -369 -346 348 347
		mu 0 4 257 256 245 246
		f 4 -371 -348 350 -370
		mu 0 4 258 257 246 247
		f 4 -372 369 351 -353
		mu 0 4 249 258 247 238
		f 4 -375 372 354 -374
		mu 0 4 208 204 249 248
		f 4 -377 373 356 -376
		mu 0 4 212 208 248 250
		f 4 -379 375 358 -378
		mu 0 4 195 212 250 251
		f 4 -381 377 360 -380
		mu 0 4 196 195 251 252
		f 4 -382 -383 379 362
		mu 0 4 253 205 196 252
		f 4 -385 381 364 363
		mu 0 4 200 199 255 254
		f 4 -387 -364 366 365
		mu 0 4 214 200 254 256
		f 4 -389 -366 368 367
		mu 0 4 210 214 256 257
		f 4 -391 -368 370 -390
		mu 0 4 203 210 257 258
		f 4 -392 389 371 -373
		mu 0 4 204 203 258 249
		f 4 395 396 397 398
		mu 0 4 259 260 261 262
		f 4 400 401 402 -397
		mu 0 4 260 263 264 261
		f 4 -414 404 405 406
		mu 0 4 265 266 267 268
		f 4 411 -402 412 413
		mu 0 4 265 264 263 266
		f 4 418 -410 419 -399
		mu 0 4 262 225 224 259
		f 4 -419 -398 420 -400
		mu 0 4 229 269 270 230
		f 4 -421 -403 421 -404
		mu 0 4 230 270 271 232
		f 4 422 -416 -428 -407
		mu 0 4 272 236 234 273
		f 4 -423 -406 423 -408
		mu 0 4 236 272 267 217
		f 4 -424 -405 424 -409
		mu 0 4 217 267 266 218
		f 4 -420 -411 -426 -396
		mu 0 4 259 224 222 260
		f 4 425 -417 -427 -401
		mu 0 4 260 222 220 263
		f 4 -425 -413 426 -415
		mu 0 4 218 266 263 220
		f 4 427 -418 -422 -412
		mu 0 4 273 234 232 271
		f 4 -441 436 437 438
		mu 0 4 274 275 276 277
		f 4 -452 439 440 441
		mu 0 4 278 279 275 274
		f 4 445 446 447 448
		mu 0 4 280 281 282 283
		f 4 451 452 -447 453
		mu 0 4 279 278 282 281
		f 4 458 -438 459 -436
		mu 0 4 206 277 276 193
		f 4 -459 -443 -461 -439
		mu 0 4 277 206 284 274
		f 4 460 -458 -468 -442
		mu 0 4 274 284 285 278
		f 4 -460 -437 461 -444
		mu 0 4 193 276 275 194
		f 4 462 -448 463 -445
		mu 0 4 286 283 282 287
		f 4 -463 -450 464 -449
		mu 0 4 283 286 201 280
		f 4 -465 -455 -467 -446
		mu 0 4 280 201 207 281
		f 4 -462 -440 465 -451
		mu 0 4 194 275 279 211
		f 4 466 -457 -466 -454
		mu 0 4 281 207 211 279
		f 4 -464 -453 467 -456
		mu 0 4 287 282 278 285;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "finger_ring";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "finger_ringShape" -p "finger_ring";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".vcs" 2;
createNode mesh -n "finger_ringShape19Orig" -p "finger_ring";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 292 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.72259599 0.86849523 0.72159928
		 0.89324981 0.68348908 0.89404625 0.68324757 0.86939871 0.72158557 0.83529299 0.71922737
		 0.85501945 0.68280667 0.85498846 0.68299204 0.8337217 0.72381049 0.96666396 0.72369444
		 0.98113465 0.68564153 0.98302424 0.68516618 0.96863234 0.72230852 0.94206172 0.68428499
		 0.94376516 0.72079331 0.77029085 0.72130913 0.79189396 0.68328625 0.79138029 0.68318856
		 0.77005392 0.72186989 0.91769636 0.68372947 0.91885555 0.72149348 0.8135975 0.68333256
		 0.81264317 0.55982882 0.94492853 0.56012994 0.96994281 0.52207214 0.96961594 0.52169263
		 0.94464874 0.55952555 0.91995132 0.52125233 0.91973543 0.55937034 0.89500928 0.5212118
		 0.8947491 0.55974585 0.87031066 0.52075464 0.86947876 0.52408433 0.85609895 0.56015235
		 0.85580963 0.55945885 0.83460414 0.52140665 0.83628005 0.55896115 0.81342047 0.52081698
		 0.81445593 0.55899215 0.79218739 0.52092153 0.79252785 0.55923223 0.77078313 0.52241212
		 0.77080542 0.56021518 0.98435223 0.52255231 0.98410916 0.60137522 0.94500887 0.60173494
		 0.97004831 0.60106295 0.91993439 0.60091186 0.89493901 0.60089529 0.86990535 0.60089827
		 0.85546029 0.60069889 0.83413994 0.60049969 0.81285012 0.60040885 0.79153693 0.60031837
		 0.77018207 0.60187268 0.98445535 0.64286834 0.94468462 0.64343089 0.96972704 0.6424405
		 0.91961449 0.6421718 0.89459777 0.64198887 0.86960936 0.64190418 0.85516 0.64185292
		 0.83383071 0.64184344 0.81252193 0.64182454 0.79121602 0.64176363 0.769894 0.64371896
		 0.98413217 0.51099086 0.85837942 0.50910813 0.8380633 0.51686305 0.83713263 0.51869094
		 0.85678691 0.50826734 0.81482351 0.51616436 0.81467527 0.51626623 0.79228002 0.50844651
		 0.7918089 0.50970823 0.77145475 0.51733476 0.77347904 0.51673102 0.86445254 0.51751417
		 0.98122185 0.517259 0.97356963 0.51714528 0.96573281 0.51649815 0.94461775 0.5160237
		 0.87362415 0.51602691 0.8948288 0.51613098 0.91974193 0.73465991 0.8939876 0.7265358
		 0.89354855 0.72710365 0.87247306 0.73513144 0.8745383 0.73486054 0.91745138 0.72680151
		 0.91757816 0.7282728 0.96265769 0.72724348 0.94163465 0.73520219 0.94094944 0.73626649
		 0.96046174 0.72436017 0.85574794 0.72638458 0.86375904 0.72591954 0.83574182 0.72593743
		 0.8136605 0.72553784 0.77303743 0.72572672 0.791834 0.72840446 0.97830117 0.72847039
		 0.97028947 0.71939254 0.6515038 0.71572411 0.67778218 0.680511 0.67660207 0.68301725
		 0.65150481 0.71864212 0.61577892 0.71824598 0.63773286 0.68332434 0.63621765 0.68340957
		 0.61451691 0.71719635 0.53151828 0.71468329 0.54656434 0.68122494 0.54712641 0.68144023
		 0.53110707 0.71052742 0.73169541 0.71087849 0.75893533 0.67492992 0.75590044 0.67570704
		 0.72946221 0.71691501 0.5682587 0.68218994 0.56954449 0.712816 0.70469469 0.67768204
		 0.70295113 0.71794176 0.5921374 0.68299913 0.59219396 0.55823976 0.71906686 0.55544978
		 0.74371302 0.52050453 0.73934042 0.52296633 0.71493244 0.56072134 0.69509673 0.52497822
		 0.6914742 0.56360114 0.67125261 0.52746093 0.66844326 0.56690633 0.64839637 0.52846301
		 0.64461708 0.53999996 0.63322318 0.56893218 0.63401616 0.5660224 0.61281383 0.52865386
		 0.61572552 0.56354606 0.59355271 0.52637136 0.59553224 0.5651623 0.57384825 0.52788413
		 0.57525212 0.56589758 0.55154139 0.53719294 0.55647379 0.56343043 0.53696984 0.52422118
		 0.54639512 0.59663862 0.72314799 0.59465259 0.74813402 0.59915417 0.69835126 0.60227537
		 0.67372036 0.60573399 0.64952111 0.60604298 0.63419223 0.60501873 0.6131928 0.60397053
		 0.59248638 0.60368085 0.57140791 0.6037991 0.54982519 0.60324299 0.53414309 0.63629931
		 0.72664183 0.63481194 0.75226629 0.63851035 0.70106578 0.64144874 0.67540252 0.6442709
		 0.65066916 0.6446445 0.63525504 0.64444244 0.61383796 0.64393449 0.59205163 0.64320588
		 0.57014453 0.64283681 0.54842496 0.6423949 0.53247356 0.52821326 0.63845569 0.5154295
		 0.62041086 0.52406776 0.61721539 0.53398693 0.6327737 0.51251113 0.59608811 0.52151966
		 0.59577113 0.52313983 0.57421929 0.51422143 0.57183653 0.52477813 0.55265182 0.53122389
		 0.55764717 0.5087359 0.57020885 0.5100776 0.62240398 0.50704277 0.59640163 0.73182243
		 0.6782676 0.72183561 0.67805856 0.72466588 0.65559626 0.73413312 0.65618455 0.72868943
		 0.70535356 0.71895778 0.7048589 0.71654141 0.75497329 0.71659654 0.73162228 0.72638947
		 0.73165005 0.72616512 0.75345331 0.73756754 0.65103292 0.72425747 0.63655114 0.72389209
		 0.61600202 0.72317529 0.59223145 0.72061992 0.54527974 0.72210217 0.56740791 0.72230613
		 0.53621089 0.715617 0.4190369 0.70794708 0.44368681 0.67516953 0.44177976 0.68175596
		 0.41756076 0.71520263 0.382375 0.71625608 0.40422949 0.6834628 0.40327048 0.68228918
		 0.38211507 0.71037704 0.30287427 0.71248275 0.31730795 0.67949933 0.31853968 0.67735547
		 0.30406582 0.70011228 0.49198052 0.70076627 0.51674896 0.66589206 0.51507396 0.66683692
		 0.4906033 0.71300143 0.33877236 0.68012553 0.33970135 0.70355397 0.46785679 0.67036766
		 0.46616051 0.71421736 0.36051184 0.68125743 0.36089879 0.55667549 0.48022282 0.55255395
		 0.50296456 0.51881367 0.49937972 0.52282327 0.47703046 0.56032258 0.457744 0.52664822
		 0.45478868 0.56431276 0.43533105 0.53054065 0.43233973 0.5699442 0.4138802 0.5329656
		 0.40903986 0.54764324 0.39863151 0.57481402 0.40047723 0.57225376 0.38118857 0.53719097
		 0.38207573 0.57025057 0.36276048 0.53468853 0.36413407 0.57043487 0.34409487 0.53571552
		 0.34616274 0.57070369 0.32434833 0.54398936 0.32895446 0.56453449 0.31111524 0.5276112
		 0.3199099 0.59341031 0.48414177 0.58971888 0.50743479 0.59715658 0.4610061 0.60188669
		 0.43820977 0.60782725 0.41544944 0.60969931 0.40140849 0.60918528 0.38125417 0.60792941
		 0.36169663;
	setAttr ".uvst[0].uvsp[250:291]" 0.60711652 0.34200835 0.60576397 0.32163998
		 0.60334557 0.30758348 0.63009113 0.48774964 0.62745839 0.5116654 0.63382238 0.46387655
		 0.63870686 0.44019175 0.64474016 0.4164837 0.64630896 0.40217346 0.64566511 0.38164634
		 0.64468986 0.36116523 0.64353651 0.34064826 0.64254159 0.32002833 0.6406247 0.30564323
		 0.53341824 0.403611 0.52099031 0.38620555 0.53197545 0.38330176 0.54088467 0.39820132
		 0.51750749 0.36473078 0.52924174 0.36434472 0.5303368 0.34532744 0.51893348 0.34319735
		 0.52892584 0.32524186 0.53732532 0.3299689 0.51220185 0.34238115 0.51440555 0.38741219
		 0.51071399 0.36492735 0.72710019 0.4460654 0.71489257 0.44451013 0.72018176 0.42387614
		 0.73150951 0.42700073 0.72300047 0.46887019 0.71069592 0.46820393 0.70669144 0.51260406
		 0.70721513 0.4918482 0.71950549 0.49171272 0.71874839 0.51098591 0.73785681 0.42449734
		 0.73253399 0.44686881 0.72843939 0.46918848 0.72427648 0.51422089 0.7250753 0.49156138;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 240 ".vt";
	setAttr ".vt[0:165]"  0.065599941 0.23426035 0.33355513 0.1228127 0.24532059 0.3348341
		 0.18097472 0.24154222 0.33526856 0.23628834 0.22317103 0.3348341 0.28514227 0.19140735 0.33355513
		 0.26335946 0.16585577 0.33184075 0.22170609 0.19293797 0.33293089 0.17454493 0.20860133 0.33330235
		 0.1249552 0.21182287 0.33293089 0.076174691 0.20239282 0.33184075 0.066298865 0.23784113 0.2401152
		 0.12351805 0.24893391 0.24054158 0.18168223 0.24516645 0.24068603 0.23699358 0.22678459 0.24054158
		 0.28584108 0.19498813 0.2401152 0.26404992 0.16939279 0.23954257 0.2224018 0.19650292 0.2399075
		 0.17524266 0.2121758 0.24003074 0.12565103 0.21538794 0.2399075 0.076865092 0.20592973 0.23954257
		 0.066298865 0.23784113 0.14660463 0.12351805 0.24893391 0.14617828 0.18168223 0.24516645 0.14603192
		 0.23699358 0.22678459 0.14617828 0.28584108 0.19498813 0.14660463 0.26404992 0.16939279 0.14717627
		 0.2224018 0.19650292 0.14681229 0.17524266 0.2121758 0.14668816 0.12565103 0.21538794 0.14681229
		 0.076865092 0.20592973 0.14717627 0.065599941 0.23426035 0.053164631 0.1228127 0.24532059 0.051886588
		 0.18097472 0.24154222 0.051451206 0.23628834 0.22317103 0.051886588 0.28514227 0.19140735 0.053164631
		 0.26335946 0.16585577 0.05487898 0.22170609 0.19293797 0.05378896 0.17454493 0.20860133 0.053417355
		 0.1249552 0.21182287 0.05378896 0.076174691 0.20239282 0.05487898 0.26209727 0.15938878 0.41608694
		 0.26046538 0.16910455 0.4248893 0.22043294 0.18641543 0.41790175 0.22331122 0.19201294 0.42639357
		 0.074912384 0.19592583 0.41608694 0.080078155 0.20431492 0.4248893 0.064320467 0.22770599 0.4189401
		 0.074482307 0.22110453 0.42639732 0.28386292 0.18485299 0.4189401 0.27196443 0.18255773 0.42639732
		 0.23499611 0.21655142 0.42107019 0.23100507 0.20793422 0.42806765 0.12152058 0.23870087 0.42107019
		 0.12197803 0.22921534 0.42806765 0.12311991 0.21156946 0.42639357 0.12368204 0.20530045 0.41790175
		 0.1796782 0.23490016 0.42179471 0.17785585 0.22556366 0.42876416 0.17446923 0.20821354 0.42703375
		 0.17326808 0.20205978 0.41851979 0.26054531 0.16856156 -0.038119316 0.26209107 0.15935709 -0.029779732
		 0.22042674 0.18638375 -0.031594545 0.22315365 0.19168663 -0.039639577 0.28385672 0.18482129 -0.032632947
		 0.27258462 0.18264674 -0.03969726 0.079800099 0.20384155 -0.038119316 0.074906245 0.19589414 -0.029779732
		 0.073941275 0.22142051 -0.03969726 0.064314388 0.22767417 -0.032632947 0.23120898 0.20835622 -0.041391045
		 0.23498991 0.21651959 -0.034762025 0.1219478 0.22968324 -0.041391045 0.12151438 0.23866904 -0.034762025
		 0.12367585 0.20526877 -0.031594545 0.12314335 0.21120787 -0.039639577 0.17794561 0.22602351 -0.042089969
		 0.179672 0.23486859 -0.035488516 0.17326188 0.2020282 -0.032213569 0.17439985 0.20785807 -0.040278077
		 0.068714999 0.1767315 0.7480669 0.11992801 0.18840781 0.7530098 0.17177904 0.18567191 0.75469458
		 0.22085282 0.16870812 0.7530098 0.26391569 0.13862982 0.7480669 0.24403301 0.11345182 0.7414372
		 0.2073313 0.13909423 0.74565351 0.16550982 0.15355378 0.74708927 0.12132033 0.15588295 0.74565351
		 0.077669822 0.14592467 0.7414372 0.068652891 0.19368444 0.67849362 0.12144861 0.20520651 0.68280137
		 0.17500329 0.20219043 0.68426943 0.22576097 0.18484545 0.68280137 0.2703484 0.15431498 0.67849362
		 0.24991435 0.12903759 0.67271578 0.21192724 0.15506254 0.67638898 0.16868949 0.16984363 0.67764139
		 0.12306682 0.17240737 0.67638898 0.07808134 0.16257808 0.67271578 0.067911364 0.20712528 0.60820019
		 0.12228074 0.21846117 0.61186981 0.17753386 0.21515524 0.61311781 0.2299746 0.19744028 0.61186981
		 0.27608985 0.16649041 0.60820019 0.25511375 0.14115617 0.60328341 0.21583828 0.16753601 0.60641074
		 0.17118502 0.18262872 0.60747504 0.12413358 0.185436 0.60641074 0.077820785 0.17576239 0.60328341
		 0.066485144 0.21703485 0.53729558 0.12241966 0.22815324 0.5403167 0.17936695 0.22454628 0.54134512
		 0.23349053 0.20647301 0.5403167 0.28113824 0.17513636 0.53729558 0.25962895 0.14978825 0.53324485
		 0.21906155 0.17649519 0.53582072 0.17299271 0.19188961 0.53669858 0.12451627 0.19494975 0.53582072
		 0.076883294 0.18545876 0.53324485 0.23803186 0.096043944 0.80356479 0.23660415 0.10431042 0.81186461
		 0.20250064 0.12129796 0.80831313 0.20489493 0.12567905 0.81579888 0.07668405 0.12753785 0.80356479
		 0.081115641 0.13466057 0.81186461 0.068155132 0.15801026 0.81103182 0.076609708 0.15075959 0.81580937
		 0.25739416 0.12107231 0.81103182 0.24683362 0.1175331 0.81580937 0.21572083 0.15069161 0.81660283
		 0.21187946 0.14120813 0.82017839 0.11790816 0.16978393 0.81660283 0.11790121 0.15955193 0.82017839
		 0.11853296 0.14253619 0.81579888 0.11910431 0.13757634 0.80831313 0.16819108 0.16729014 0.8185004
		 0.16621292 0.15715599 0.82200325 0.16292942 0.14033434 0.81747568 0.1619761 0.13545015 0.80993068
		 0.26152319 0.1647459 0.4637219 0.26260483 0.15446924 0.47011009 0.22104749 0.1814156 0.4721323
		 0.22410992 0.18783534 0.46541569 0.28433228 0.17984706 0.47329012 0.27356601 0.17879657 0.46548215
		 0.080752842 0.20003089 0.4637219 0.075885929 0.19091533 0.47011009 0.074877962 0.21757893 0.46548215
		 0.065297067 0.22260123 0.47329012 0.2321628 0.20446606 0.46736783 0.23558265 0.21145347 0.47565952
		 0.12289536 0.22579415 0.46736783 0.12235418 0.23355487 0.47565952 0.12452638 0.2002558 0.4721323
		 0.12410291 0.20735598 0.46541569 0.17889178 0.22211143 0.46814606 0.18038368 0.22975509 0.47646585
		 0.17399371 0.19701818 0.47282013 0.175354 0.20398721 0.46612772 0.067912422 0.082852215 1.013339043
		 0.10974784 0.091214627 1.02098465 0.15226579 0.088547513 1.023590565 0.19266567 0.075029701 1.02098465
		 0.22828546 0.05154866 1.013339043 0.2122722 0.032512859 1.0030834675;
	setAttr ".vt[166:239]" 0.18191421 0.052530915 1.0096037388 0.14748466 0.064053178 1.011825442
		 0.11124931 0.066324174 1.0096037388 0.075591587 0.059191868 1.0030834675 0.069189928 0.10358648 0.97302449
		 0.11233767 0.11188424 0.98030388 0.15625954 0.10900822 0.98278475 0.19803885 0.095156014 0.98030388
		 0.23489913 0.071241364 0.97302449 0.21841651 0.052040726 0.96326411 0.18701261 0.072425947 0.96947026
		 0.1514231 0.084230438 0.9715867 0.11400668 0.086676106 0.96947026 0.077241927 0.079596847 0.96326411
		 0.06994728 0.1216304 0.93149579 0.11440041 0.1298392 0.93839931 0.15972185 0.12674654 0.94074786
		 0.20287964 0.11256875 0.93839931 0.24098271 0.08824566 0.93149579 0.22403827 0.068912655 0.9222436
		 0.19158646 0.089643881 0.928128 0.15483749 0.10172293 0.93013167 0.1162436 0.10435025 0.928128
		 0.078377791 0.097344428 0.9222436 0.070178069 0.13695768 0.88881421 0.11592989 0.14505304 0.89532673
		 0.1626476 0.14173564 0.89754629 0.20718366 0.12724103 0.89532673 0.24653274 0.10253462 0.88881421
		 0.22913307 0.08310239 0.88008571 0.19563085 0.1041584 0.88563704 0.15772271 0.11650416 0.8875277
		 0.1179544 0.11932027 0.88563704 0.07899294 0.1124085 0.88008571 0.20617771 0.012246087 1.038359404
		 0.20478231 0.017898828 1.045261145 0.1767711 0.03189376 1.045182943 0.17855278 0.034542859 1.050915837
		 0.073617391 0.038120806 1.038359404 0.077036001 0.042833924 1.045261145 0.06627246 0.061425701 1.049089909
		 0.07315556 0.055146143 1.050930023 0.22174749 0.031078205 1.049089909 0.21300811 0.02784799 1.050930023
		 0.18725759 0.054122046 1.057092786 0.18409285 0.046286389 1.057208419 0.10689662 0.069807872 1.057092786
		 0.10688222 0.061357334 1.057208419 0.10759939 0.048392415 1.050915837 0.10825424 0.045267731 1.045182943
		 0.14812219 0.067319199 1.059820056 0.14649165 0.058966219 1.05982852 0.14399886 0.04619506 1.05332303
		 0.14340365 0.043145865 1.047508001 0.23202723 0.10224476 0.83946669 0.23284829 0.093454644 0.84138882
		 0.19854364 0.11476438 0.84660208 0.20115367 0.12052 0.84383368 0.25044465 0.11300105 0.84958613
		 0.24178052 0.11306684 0.84400499 0.083509855 0.13123426 0.83946669 0.079443492 0.12339805 0.84138882
		 0.078542277 0.14492969 0.84400499 0.070489466 0.14812678 0.84958613 0.20761344 0.13338239 0.84887183
		 0.21020311 0.13799623 0.85569775 0.11784137 0.15090521 0.84887183 0.11717669 0.15615419 0.85569775
		 0.11924374 0.13024311 0.84660208 0.11898977 0.1365577 0.84383368 0.16378462 0.14756069 0.85087562
		 0.16478813 0.15270142 0.85778105 0.15983009 0.12730077 0.84837806 0.16103971 0.13349804 0.8456701;
	setAttr -s 468 ".ed";
	setAttr ".ed[0:165]"  0 46 0 1 52 0 0 1 0 2 56 0 1 2 0 3 50 0 2 3 0 4 48 0
		 3 4 0 5 40 0 4 5 0 6 16 0 5 6 0 7 17 0 6 7 0 8 18 0 7 8 0 9 44 0 8 9 0 9 0 0 10 0 0
		 11 1 0 10 11 0 12 2 0 11 12 0 13 3 0 12 13 0 14 4 0 13 14 0 15 5 0 14 15 0 16 26 0
		 15 16 0 17 27 0 16 17 0 18 28 0 17 18 0 19 9 0 18 19 0 19 10 0 20 10 0 21 11 0 20 21 0
		 22 12 0 21 22 0 23 13 0 22 23 0 24 14 0 23 24 0 25 15 0 24 25 0 26 36 0 25 26 0 27 37 0
		 26 27 0 28 38 0 27 28 0 29 19 0 28 29 0 29 20 0 30 20 0 31 21 0 30 31 0 32 22 0 31 32 0
		 33 23 0 32 33 0 34 24 0 33 34 0 35 25 0 34 35 0 36 62 0 35 36 0 37 78 0 36 37 0 38 74 0
		 37 38 0 39 29 0 38 39 0 39 30 0 42 6 0 55 8 0 59 7 0 49 51 0 51 43 1 43 41 0 41 49 0
		 40 42 0 51 57 0 57 58 1 58 43 0 42 59 0 53 47 0 47 45 0 45 54 0 44 46 0 46 52 0 48 40 0
		 50 48 0 54 58 0 57 53 0 53 54 1 52 56 0 55 44 0 56 50 0 59 55 0 41 40 0 48 49 0 43 42 1
		 58 59 1 45 44 0 47 46 0 53 52 1 51 50 1 57 56 1 54 55 1 61 35 0 64 34 0 67 39 0 69 30 0
		 71 33 0 73 31 0 77 32 0 61 64 0 63 70 1 70 65 0 65 60 0 60 63 0 76 70 0 63 79 0 62 61 0
		 64 71 0 67 74 0 68 72 0 72 75 1 75 66 0 66 68 0 69 67 0 71 77 0 76 79 1 79 75 0 72 76 0
		 73 69 0 74 78 0 77 73 0 78 62 0 61 60 0 65 64 0 63 62 1 70 71 1 67 66 0 75 74 1 69 68 0
		 76 77 1 72 73 1 79 78 1 80 126 0 81 132 0 80 81 0 82 136 0 81 82 0 83 130 0 82 83 0
		 84 128 0 83 84 0 85 120 0;
	setAttr ".ed[166:331]" 84 85 0 86 96 0 85 86 0 87 97 0 86 87 0 88 98 0 87 88 0
		 89 124 0 88 89 0 89 80 0 90 80 0 91 81 0 90 91 0 92 82 0 91 92 0 93 83 0 92 93 0
		 94 84 0 93 94 0 95 85 0 94 95 0 96 106 0 95 96 0 97 107 0 96 97 0 98 108 0 97 98 0
		 99 89 0 98 99 0 99 90 0 100 90 0 101 91 0 100 101 0 102 92 0 101 102 0 103 93 0 102 103 0
		 104 94 0 103 104 0 105 95 0 104 105 0 106 116 0 105 106 0 107 117 0 106 107 0 108 118 0
		 107 108 0 109 99 0 108 109 0 109 100 0 110 100 0 111 101 0 110 111 0 112 102 0 111 112 0
		 113 103 0 112 113 0 114 104 0 113 114 0 115 105 0 114 115 0 116 142 0 115 116 0 117 158 0
		 116 117 0 118 154 0 117 118 0 119 109 0 118 119 0 119 110 0 122 86 0 135 88 0 139 87 0
		 129 131 0 131 123 1 123 121 0 121 129 0 120 122 0 131 137 0 137 138 1 138 123 0 122 139 0
		 133 127 0 127 125 0 125 134 0 124 126 0 126 132 0 128 120 0 130 128 0 134 138 0 137 133 0
		 133 134 1 132 136 0 135 124 0 136 130 0 139 135 0 121 120 0 128 129 0 123 122 1 138 139 1
		 125 124 0 127 126 0 133 132 1 131 130 1 137 136 1 134 135 1 141 115 0 144 114 0 147 119 0
		 149 110 0 151 113 0 153 111 0 157 112 0 141 144 0 150 145 0 145 140 0 140 143 0 156 150 0
		 150 143 1 143 159 0 142 141 0 144 151 0 147 154 0 148 152 0 152 155 1 155 146 0 146 148 0
		 149 147 0 151 157 0 156 159 1 159 155 0 152 156 0 153 149 0 154 158 0 157 153 0 158 142 0
		 141 140 0 145 144 0 143 142 1 150 151 1 147 146 0 155 154 1 149 148 0 156 157 1 152 153 1
		 159 158 1 160 206 0 161 212 0 160 161 0 162 216 0 161 162 0 163 210 0 162 163 0 164 208 0
		 163 164 0 165 200 0 164 165 0 166 176 0 165 166 0 167 177 0 166 167 0 168 178 0 167 168 0
		 169 204 0 168 169 0 169 160 0;
	setAttr ".ed[332:467]" 170 160 0 171 161 0 170 171 0 172 162 0 171 172 0 173 163 0
		 172 173 0 174 164 0 173 174 0 175 165 0 174 175 0 176 186 0 175 176 0 177 187 0 176 177 0
		 178 188 0 177 178 0 179 169 0 178 179 0 179 170 0 180 170 0 181 171 0 180 181 0 182 172 0
		 181 182 0 183 173 0 182 183 0 184 174 0 183 184 0 185 175 0 184 185 0 186 196 0 185 186 0
		 187 197 0 186 187 0 188 198 0 187 188 0 189 179 0 188 189 0 189 180 0 190 180 0 191 181 0
		 190 191 0 192 182 0 191 192 0 193 183 0 192 193 0 194 184 0 193 194 0 195 185 0 194 195 0
		 196 222 0 195 196 0 197 238 0 196 197 0 198 234 0 197 198 0 199 189 0 198 199 0 199 190 0
		 202 166 0 215 168 0 219 167 0 209 211 0 211 203 1 203 201 0 201 209 0 200 202 0 211 217 0
		 217 218 1 218 203 0 202 219 0 213 207 0 207 205 0 205 214 0 204 206 0 206 212 0 208 200 0
		 210 208 0 214 218 0 217 213 0 213 214 1 212 216 0 215 204 0 216 210 0 219 215 0 201 200 0
		 208 209 0 203 202 1 218 219 1 205 204 0 207 206 0 213 212 1 211 210 1 217 216 1 214 215 1
		 221 195 0 224 194 0 227 199 0 229 190 0 231 193 0 233 191 0 237 192 0 221 224 0 230 225 0
		 225 220 0 220 223 0 236 230 0 230 223 1 223 239 0 222 221 0 224 231 0 227 234 0 228 232 0
		 232 235 1 235 226 0 226 228 0 229 227 0 231 237 0 236 239 1 239 235 0 232 236 0 233 229 0
		 234 238 0 237 233 0 238 222 0 221 220 0 225 224 0 223 222 1 230 231 1 227 226 0 235 234 1
		 229 228 0 236 237 1 232 233 1 239 238 1;
	setAttr -s 234 -ch 936 ".fc[0:233]" -type "polyFaces" 
		f 4 131 120 68 -118
		mu 0 4 0 1 2 3
		f 4 130 116 72 71
		mu 0 4 4 5 6 7
		f 4 137 118 79 -120
		mu 0 4 8 9 10 11
		f 4 -117 123 117 70
		mu 0 4 6 5 0 3
		f 4 142 119 62 -122
		mu 0 4 12 8 11 13
		f 4 132 -76 78 -119
		mu 0 4 14 15 16 17
		f 4 144 121 64 -123
		mu 0 4 18 12 13 19
		f 4 143 -74 76 75
		mu 0 4 15 20 21 16
		f 4 138 122 66 -121
		mu 0 4 1 18 19 2
		f 4 145 -72 74 73
		mu 0 4 20 4 7 21
		f 4 -3 0 96 -2
		mu 0 4 22 23 24 25
		f 4 -5 1 102 -4
		mu 0 4 26 22 25 27
		f 4 -7 3 104 -6
		mu 0 4 28 26 27 29
		f 4 -9 5 98 -8
		mu 0 4 30 28 29 31
		f 4 97 -10 -11 7
		mu 0 4 31 32 33 30
		f 4 -13 9 87 80
		mu 0 4 34 33 32 35
		f 4 -15 -81 91 82
		mu 0 4 36 34 35 37
		f 4 -17 -83 105 81
		mu 0 4 38 36 37 39
		f 4 -19 -82 103 -18
		mu 0 4 40 38 39 41
		f 4 -20 17 95 -1
		mu 0 4 23 42 43 24
		f 4 -23 20 2 -22
		mu 0 4 44 45 23 22
		f 4 -25 21 4 -24
		mu 0 4 46 44 22 26
		f 4 -27 23 6 -26
		mu 0 4 47 46 26 28
		f 4 -29 25 8 -28
		mu 0 4 48 47 28 30
		f 4 -30 -31 27 10
		mu 0 4 33 49 48 30
		f 4 -33 29 12 11
		mu 0 4 50 49 33 34
		f 4 -35 -12 14 13
		mu 0 4 51 50 34 36
		f 4 -37 -14 16 15
		mu 0 4 52 51 36 38
		f 4 -39 -16 18 -38
		mu 0 4 53 52 38 40
		f 4 -40 37 19 -21
		mu 0 4 45 54 42 23
		f 4 -43 40 22 -42
		mu 0 4 55 56 45 44
		f 4 -45 41 24 -44
		mu 0 4 57 55 44 46
		f 4 -47 43 26 -46
		mu 0 4 58 57 46 47
		f 4 -49 45 28 -48
		mu 0 4 59 58 47 48
		f 4 -50 -51 47 30
		mu 0 4 49 60 59 48
		f 4 -53 49 32 31
		mu 0 4 61 60 49 50
		f 4 -55 -32 34 33
		mu 0 4 62 61 50 51
		f 4 -57 -34 36 35
		mu 0 4 63 62 51 52
		f 4 -59 -36 38 -58
		mu 0 4 64 63 52 53
		f 4 -60 57 39 -41
		mu 0 4 56 65 54 45
		f 4 -63 60 42 -62
		mu 0 4 13 11 56 55
		f 4 -65 61 44 -64
		mu 0 4 19 13 55 57
		f 4 -67 63 46 -66
		mu 0 4 2 19 57 58
		f 4 -69 65 48 -68
		mu 0 4 3 2 58 59
		f 4 -70 -71 67 50
		mu 0 4 60 6 3 59
		f 4 -73 69 52 51
		mu 0 4 7 6 60 61
		f 4 -75 -52 54 53
		mu 0 4 21 7 61 62
		f 4 -77 -54 56 55
		mu 0 4 16 21 62 63
		f 4 -79 -56 58 -78
		mu 0 4 17 16 63 64
		f 4 -80 77 59 -61
		mu 0 4 11 10 65 56
		f 4 83 84 85 86
		mu 0 4 66 67 68 69
		f 4 88 89 90 -85
		mu 0 4 67 70 71 68
		f 4 -102 92 93 94
		mu 0 4 72 73 74 75
		f 4 99 -90 100 101
		mu 0 4 72 71 70 73
		f 4 106 -98 107 -87
		mu 0 4 69 32 31 76
		f 4 -107 -86 108 -88
		mu 0 4 32 69 68 35
		f 4 -109 -91 109 -92
		mu 0 4 35 68 71 37
		f 4 110 -104 -116 -95
		mu 0 4 75 41 39 72
		f 4 -111 -94 111 -96
		mu 0 4 43 77 78 24
		f 4 -112 -93 112 -97
		mu 0 4 24 79 80 25
		f 4 -108 -99 -114 -84
		mu 0 4 81 31 29 82
		f 4 113 -105 -115 -89
		mu 0 4 82 29 27 83
		f 4 -113 -101 114 -103
		mu 0 4 25 80 83 27
		f 4 115 -106 -110 -100
		mu 0 4 72 39 37 71
		f 4 124 125 126 127
		mu 0 4 84 85 86 87
		f 4 -140 128 -125 129
		mu 0 4 88 89 85 84
		f 4 133 134 135 136
		mu 0 4 90 91 92 93
		f 4 139 140 -135 141
		mu 0 4 89 88 92 91
		f 4 146 -127 147 -124
		mu 0 4 5 94 95 0
		f 4 -147 -131 -149 -128
		mu 0 4 94 5 4 96
		f 4 148 -146 -156 -130
		mu 0 4 96 4 20 97
		f 4 -148 -126 149 -132
		mu 0 4 0 86 85 1
		f 4 150 -136 151 -133
		mu 0 4 14 98 99 15
		f 4 -151 -138 152 -137
		mu 0 4 100 9 8 101
		f 4 -153 -143 -155 -134
		mu 0 4 90 8 12 91
		f 4 -150 -129 153 -139
		mu 0 4 1 85 89 18
		f 4 154 -145 -154 -142
		mu 0 4 91 12 18 89
		f 4 -152 -141 155 -144
		mu 0 4 15 99 97 20
		f 4 287 276 224 -274
		mu 0 4 102 103 104 105
		f 4 286 272 228 227
		mu 0 4 106 107 108 109
		f 4 293 274 235 -276
		mu 0 4 110 111 112 113
		f 4 -273 279 273 226
		mu 0 4 108 107 102 105
		f 4 298 275 218 -278
		mu 0 4 114 115 116 117
		f 4 288 -232 234 -275
		mu 0 4 111 118 119 112
		f 4 300 277 220 -279
		mu 0 4 120 114 117 121
		f 4 299 -230 232 231
		mu 0 4 118 122 123 119
		f 4 294 278 222 -277
		mu 0 4 103 120 121 104
		f 4 301 -228 230 229
		mu 0 4 122 106 109 123
		f 4 -159 156 252 -158
		mu 0 4 124 125 126 127
		f 4 -161 157 258 -160
		mu 0 4 128 124 127 129
		f 4 -163 159 260 -162
		mu 0 4 130 128 129 131
		f 4 -165 161 254 -164
		mu 0 4 132 130 131 133
		f 4 253 -166 -167 163
		mu 0 4 133 134 135 132
		f 4 -169 165 243 236
		mu 0 4 136 135 134 137
		f 4 -171 -237 247 238
		mu 0 4 138 136 137 139
		f 4 -173 -239 261 237
		mu 0 4 140 138 139 141
		f 4 -175 -238 259 -174
		mu 0 4 142 140 141 143
		f 4 -176 173 251 -157
		mu 0 4 144 142 143 145
		f 4 -179 176 158 -178
		mu 0 4 146 147 125 124
		f 4 -181 177 160 -180
		mu 0 4 148 146 124 128
		f 4 -183 179 162 -182
		mu 0 4 149 148 128 130
		f 4 -185 181 164 -184
		mu 0 4 150 149 130 132
		f 4 -186 -187 183 166
		mu 0 4 135 151 150 132
		f 4 -189 185 168 167
		mu 0 4 152 151 135 136
		f 4 -191 -168 170 169
		mu 0 4 153 152 136 138
		f 4 -193 -170 172 171
		mu 0 4 154 153 138 140
		f 4 -195 -172 174 -194
		mu 0 4 155 154 140 142
		f 4 -196 193 175 -177
		mu 0 4 156 155 142 144
		f 4 -199 196 178 -198
		mu 0 4 157 158 147 146
		f 4 -201 197 180 -200
		mu 0 4 159 157 146 148
		f 4 -203 199 182 -202
		mu 0 4 160 159 148 149
		f 4 -205 201 184 -204
		mu 0 4 161 160 149 150
		f 4 -206 -207 203 186
		mu 0 4 151 162 161 150
		f 4 -209 205 188 187
		mu 0 4 163 162 151 152
		f 4 -211 -188 190 189
		mu 0 4 164 163 152 153
		f 4 -213 -190 192 191
		mu 0 4 165 164 153 154
		f 4 -215 -192 194 -214
		mu 0 4 166 165 154 155
		f 4 -216 213 195 -197
		mu 0 4 167 166 155 156
		f 4 -219 216 198 -218
		mu 0 4 117 116 158 157
		f 4 -221 217 200 -220
		mu 0 4 121 117 157 159
		f 4 -223 219 202 -222
		mu 0 4 104 121 159 160
		f 4 -225 221 204 -224
		mu 0 4 105 104 160 161
		f 4 -226 -227 223 206
		mu 0 4 162 108 105 161
		f 4 -229 225 208 207
		mu 0 4 109 108 162 163
		f 4 -231 -208 210 209
		mu 0 4 123 109 163 164
		f 4 -233 -210 212 211
		mu 0 4 119 123 164 165
		f 4 -235 -212 214 -234
		mu 0 4 112 119 165 166
		f 4 -236 233 215 -217
		mu 0 4 113 112 166 167
		f 4 239 240 241 242
		mu 0 4 168 169 170 171
		f 4 244 245 246 -241
		mu 0 4 169 172 173 170
		f 4 -258 248 249 250
		mu 0 4 174 175 176 177
		f 4 255 -246 256 257
		mu 0 4 174 173 172 175
		f 4 262 -254 263 -243
		mu 0 4 171 134 133 168
		f 4 -263 -242 264 -244
		mu 0 4 134 171 170 137
		f 4 -265 -247 265 -248
		mu 0 4 137 170 173 139
		f 4 266 -260 -272 -251
		mu 0 4 177 143 141 174
		f 4 -267 -250 267 -252
		mu 0 4 143 177 176 145
		f 4 -268 -249 268 -253
		mu 0 4 145 176 175 178
		f 4 -264 -255 -270 -240
		mu 0 4 168 133 179 169
		f 4 269 -261 -271 -245
		mu 0 4 169 179 180 172
		f 4 -269 -257 270 -259
		mu 0 4 178 175 172 180
		f 4 271 -262 -266 -256
		mu 0 4 174 141 139 173
		f 4 -285 280 281 282
		mu 0 4 181 182 183 184
		f 4 -296 283 284 285
		mu 0 4 185 186 182 181
		f 4 289 290 291 292
		mu 0 4 187 188 189 190
		f 4 295 296 -291 297
		mu 0 4 186 185 189 188
		f 4 302 -282 303 -280
		mu 0 4 191 184 183 102
		f 4 -303 -287 -305 -283
		mu 0 4 192 107 106 193
		f 4 304 -302 -312 -286
		mu 0 4 193 106 122 194
		f 4 -304 -281 305 -288
		mu 0 4 102 183 182 103
		f 4 306 -292 307 -289
		mu 0 4 111 195 196 118
		f 4 -307 -294 308 -293
		mu 0 4 195 111 110 197
		f 4 -309 -299 -311 -290
		mu 0 4 187 115 114 188
		f 4 -306 -284 309 -295
		mu 0 4 103 182 186 120
		f 4 310 -301 -310 -298
		mu 0 4 188 114 120 186
		f 4 -308 -297 311 -300
		mu 0 4 118 196 194 122
		f 4 443 432 380 -430
		mu 0 4 198 199 200 201
		f 4 442 428 384 383
		mu 0 4 202 203 204 205
		f 4 449 430 391 -432
		mu 0 4 206 207 208 209
		f 4 -429 435 429 382
		mu 0 4 204 203 198 201
		f 4 454 431 374 -434
		mu 0 4 210 211 212 213
		f 4 444 -388 390 -431
		mu 0 4 207 214 215 208
		f 4 456 433 376 -435
		mu 0 4 216 210 213 217
		f 4 455 -386 388 387
		mu 0 4 214 218 219 215
		f 4 450 434 378 -433
		mu 0 4 199 216 217 200
		f 4 457 -384 386 385
		mu 0 4 218 202 205 219
		f 4 -315 312 408 -314
		mu 0 4 220 221 222 223
		f 4 -317 313 414 -316
		mu 0 4 224 220 223 225
		f 4 -319 315 416 -318
		mu 0 4 226 224 225 227
		f 4 -321 317 410 -320
		mu 0 4 228 226 227 229
		f 4 409 -322 -323 319
		mu 0 4 229 230 231 228
		f 4 -325 321 399 392
		mu 0 4 232 231 230 233
		f 4 -327 -393 403 394
		mu 0 4 234 232 233 235
		f 4 -329 -395 417 393
		mu 0 4 236 234 235 237
		f 4 -331 -394 415 -330
		mu 0 4 238 236 237 239
		f 4 -332 329 407 -313
		mu 0 4 240 238 239 241
		f 4 -335 332 314 -334
		mu 0 4 242 243 221 220
		f 4 -337 333 316 -336
		mu 0 4 244 242 220 224
		f 4 -339 335 318 -338
		mu 0 4 245 244 224 226
		f 4 -341 337 320 -340
		mu 0 4 246 245 226 228
		f 4 -342 -343 339 322
		mu 0 4 231 247 246 228
		f 4 -345 341 324 323
		mu 0 4 248 247 231 232
		f 4 -347 -324 326 325
		mu 0 4 249 248 232 234
		f 4 -349 -326 328 327
		mu 0 4 250 249 234 236
		f 4 -351 -328 330 -350
		mu 0 4 251 250 236 238
		f 4 -352 349 331 -333
		mu 0 4 252 251 238 240
		f 4 -355 352 334 -354
		mu 0 4 253 254 243 242
		f 4 -357 353 336 -356
		mu 0 4 255 253 242 244
		f 4 -359 355 338 -358
		mu 0 4 256 255 244 245
		f 4 -361 357 340 -360
		mu 0 4 257 256 245 246
		f 4 -362 -363 359 342
		mu 0 4 247 258 257 246
		f 4 -365 361 344 343
		mu 0 4 259 258 247 248
		f 4 -367 -344 346 345
		mu 0 4 260 259 248 249
		f 4 -369 -346 348 347
		mu 0 4 261 260 249 250
		f 4 -371 -348 350 -370
		mu 0 4 262 261 250 251
		f 4 -372 369 351 -353
		mu 0 4 263 262 251 252
		f 4 -375 372 354 -374
		mu 0 4 213 212 254 253
		f 4 -377 373 356 -376
		mu 0 4 217 213 253 255
		f 4 -379 375 358 -378
		mu 0 4 200 217 255 256
		f 4 -381 377 360 -380
		mu 0 4 201 200 256 257
		f 4 -382 -383 379 362
		mu 0 4 258 204 201 257
		f 4 -385 381 364 363
		mu 0 4 205 204 258 259
		f 4 -387 -364 366 365
		mu 0 4 219 205 259 260
		f 4 -389 -366 368 367
		mu 0 4 215 219 260 261
		f 4 -391 -368 370 -390
		mu 0 4 208 215 261 262
		f 4 -392 389 371 -373
		mu 0 4 209 208 262 263
		f 4 395 396 397 398
		mu 0 4 264 265 266 267
		f 4 400 401 402 -397
		mu 0 4 265 268 269 266
		f 4 -414 404 405 406
		mu 0 4 270 271 272 273
		f 4 411 -402 412 413
		mu 0 4 270 269 268 271
		f 4 418 -410 419 -399
		mu 0 4 267 230 229 264
		f 4 -419 -398 420 -400
		mu 0 4 230 267 266 233
		f 4 -421 -403 421 -404
		mu 0 4 233 266 269 235
		f 4 422 -416 -428 -407
		mu 0 4 273 239 237 270
		f 4 -423 -406 423 -408
		mu 0 4 239 273 272 241
		f 4 -424 -405 424 -409
		mu 0 4 241 272 271 274
		f 4 -420 -411 -426 -396
		mu 0 4 264 229 275 265
		f 4 425 -417 -427 -401
		mu 0 4 265 275 276 268
		f 4 -425 -413 426 -415
		mu 0 4 274 271 268 276
		f 4 427 -418 -422 -412
		mu 0 4 270 237 235 269
		f 4 -441 436 437 438
		mu 0 4 277 278 279 280
		f 4 -452 439 440 441
		mu 0 4 281 282 278 277
		f 4 445 446 447 448
		mu 0 4 283 284 285 286
		f 4 451 452 -447 453
		mu 0 4 282 281 285 284
		f 4 458 -438 459 -436
		mu 0 4 287 280 279 198
		f 4 -459 -443 -461 -439
		mu 0 4 280 287 288 277
		f 4 460 -458 -468 -442
		mu 0 4 277 288 289 281
		f 4 -460 -437 461 -444
		mu 0 4 198 279 278 199
		f 4 462 -448 463 -445
		mu 0 4 290 286 285 291
		f 4 -463 -450 464 -449
		mu 0 4 286 290 211 283
		f 4 -465 -455 -467 -446
		mu 0 4 283 211 210 284
		f 4 -462 -440 465 -451
		mu 0 4 199 278 282 216
		f 4 466 -457 -466 -454
		mu 0 4 284 210 216 282
		f 4 -464 -453 467 -456
		mu 0 4 291 285 281 289;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "finger_pinky";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "finger_pinkyShape" -p "finger_pinky";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".vcs" 2;
createNode mesh -n "finger_pinkyShape20Orig" -p "finger_pinky";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 302 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.97108901 0.88378847 0.97065967
		 0.90819085 0.93203354 0.90859938 0.93209141 0.88446438 0.9702096 0.85110903 0.96810704
		 0.87030488 0.93140042 0.87050712 0.93203324 0.84976542 0.97260249 0.77649051 0.96895587
		 0.7896769 0.93217379 0.78740668 0.93338162 0.7733891 0.96944177 0.95638585 0.97155428
		 0.98028439 0.9325341 0.9821198 0.9314912 0.9576596 0.97052664 0.80881059 0.93235707
		 0.80829811 0.96935976 0.9322859 0.93149871 0.93305123 0.97047108 0.8299787 0.93237638
		 0.82905996 0.80756652 0.95698094 0.80610251 0.9814111 0.76729882 0.97914284 0.76979119
		 0.95527589 0.80802292 0.93239754 0.77033859 0.93120742 0.80794179 0.90795553 0.7695176
		 0.90712011 0.8082971 0.88384455 0.76942605 0.88272029 0.77283138 0.86933547 0.80927545
		 0.86990881 0.80889088 0.84917259 0.77085781 0.85021806 0.80884534 0.82848203 0.77090263
		 0.82901442 0.80918097 0.80773258 0.77113992 0.80791211 0.80968696 0.78684521 0.77314103
		 0.78885376 0.80859816 0.77282709 0.76944089 0.7757175 0.84886229 0.95776314 0.84828532
		 0.98223293 0.84917039 0.93314385 0.84935081 0.9085654 0.84967774 0.88412303 0.84989083
		 0.87003434 0.84998876 0.84919769 0.85006821 0.82836503 0.85027605 0.80750561 0.85040098
		 0.78657317 0.85033226 0.77246761 0.89023256 0.95796657 0.89035541 0.98256433 0.89035708
		 0.93332165 0.89061403 0.90877366 0.89073247 0.8843509 0.89075994 0.87023687 0.89095843
		 0.84938264 0.89116746 0.82855123 0.89126742 0.80768561 0.8914451 0.7867887 0.89170796
		 0.77266634 0.76413715 0.88663167 0.7638244 0.90739918 0.75483847 0.90632308 0.75525415
		 0.88796467 0.76458317 0.93128061 0.75561321 0.93145919 0.75500494 0.90933025 0.75523692
		 0.95411241 0.76407009 0.95474768 0.76225322 0.9750396 0.75350082 0.97287834 0.76702243
		 0.8703984 0.7650972 0.87792778 0.76605713 0.85077226 0.76598656 0.82908547 0.76728642
		 0.78794104 0.76630682 0.80738944 0.76510739 0.78048378 0.98551732 0.90747547 0.97609061
		 0.90851331 0.97604758 0.88754296 0.98534584 0.88897729 0.98417026 0.93272841 0.97478724
		 0.93239105 0.98528892 0.91064203 0.97639585 0.97645569 0.9748475 0.95592976 0.98410231
		 0.95535624 0.98559147 0.97428071 0.97357458 0.87142354 0.97475755 0.8517136 0.97512722
		 0.82998407 0.97449589 0.78879738 0.97509986 0.80840003 0.97672027 0.78097475 0.95934719
		 0.63950115 0.96117097 0.66209221 0.92522144 0.66344696 0.92500651 0.63986933 0.96138144
		 0.60693467 0.95955807 0.62676311 0.92524707 0.6255852 0.92599106 0.6054486 0.95459479
		 0.73654425 0.9583317 0.74952221 0.92088681 0.75182867 0.92059737 0.73684764 0.95853513
		 0.71310818 0.92291123 0.71164978 0.95606118 0.53896207 0.9595601 0.5615977 0.92452526
		 0.56291026 0.92259902 0.54138792 0.96009177 0.68753743 0.92435187 0.68711245 0.96103072
		 0.58437508 0.92550451 0.58458358 0.80913144 0.70664346 0.80629671 0.72961044 0.76985675
		 0.72645056 0.77359176 0.70413566 0.81106228 0.68383658 0.77579415 0.68264592 0.81211686
		 0.66175008 0.7768482 0.66117984 0.81297112 0.63974845 0.77573991 0.63872641 0.77918923
		 0.6253463 0.8127377 0.62590724 0.81166124 0.60667574 0.774872 0.60850918 0.81022388
		 0.58743429 0.77460623 0.58900416 0.80917263 0.56751215 0.77349621 0.56922686 0.80854189
		 0.54759288 0.77344787 0.54973739 0.80290163 0.74396741 0.76741439 0.74082577 0.84694445
		 0.70857608 0.84499198 0.73231494 0.84861666 0.68517137 0.84990519 0.66261363 0.85105085
		 0.63985407 0.85055727 0.62567478 0.84990084 0.60621691 0.84880757 0.5863533 0.8478542
		 0.56589556 0.84699452 0.54541802 0.84217203 0.74694633 0.88436598 0.71019757 0.8828004
		 0.73472452 0.88580489 0.68632084 0.88686371 0.6632458 0.88776863 0.63987046 0.88778365
		 0.62542349 0.88739479 0.60565257 0.88670206 0.58538836 0.8858301 0.56438076 0.88474149
		 0.54346204 0.88092512 0.74976325 0.76978987 0.64196169 0.77032232 0.66102308 0.75963569
		 0.66079986 0.75922853 0.64319909 0.76908451 0.68243402 0.75809675 0.68202949 0.75636125
		 0.70329756 0.76704812 0.70380557 0.76434183 0.72282565 0.7539041 0.7208842 0.7729336
		 0.62689233 0.7708807 0.63454199 0.76982337 0.60869807 0.76909971 0.58920729 0.76738852
		 0.55225569 0.76836449 0.56963676 0.762541 0.73712087 0.76372671 0.72936356 0.96670473
		 0.60776317 0.97834116 0.60840809 0.97740024 0.62970072 0.96579301 0.62868768 0.96654731
		 0.5843935 0.97825718 0.58447289 0.97382563 0.53939795 0.97677791 0.56066471 0.96516359
		 0.56125343 0.96236163 0.54155016 0.96645093 0.63756227 0.9676044 0.66161323 0.9633919
		 0.74572182 0.9618789 0.73704803 0.96506733 0.71364051 0.96715307 0.6876511 0.94524074
		 0.30815509 0.94134378 0.33246815 0.91217232 0.33255559 0.91491491 0.30810571 0.93703496
		 0.4842191 0.9367581 0.50541508 0.9079479 0.50407928 0.90837461 0.4829309 0.94687444
		 0.40619266 0.94643003 0.42063215 0.91739321 0.42014655 0.91731369 0.40598422 0.93265402
		 0.51966357 0.90405095 0.51849937 0.94272614 0.38163829 0.9137696 0.38161612 0.94163054
		 0.44155809 0.91271079 0.44090152 0.9413107 0.35704577 0.91223872 0.35712627 0.93879873
		 0.4628056 0.90998763 0.46184987 0.81906676 0.38189581 0.8222726 0.40523824 0.7932108
		 0.40542531 0.7898578 0.382523 0.81723845 0.35904491 0.78768051 0.35973004 0.8165257
		 0.33621186 0.78710651 0.33704108 0.81590319 0.31312078 0.78628379 0.31439757 0.78124487
		 0.50775695 0.78566265 0.4946208 0.81373906 0.49757081 0.81064618 0.5117209 0.81386596
		 0.47793439 0.78408086 0.477606 0.81483895 0.45874429 0.78509283 0.45830423 0.81681639
		 0.43942505 0.78720731 0.43896642 0.81979889 0.41961205 0.79121584 0.41947618 0.85067058
		 0.38164741 0.85375941 0.40540043 0.84896684 0.35819459 0.84841657 0.33478567 0.84850478
		 0.31127188;
	setAttr ".uvst[0].uvsp[250:301]" 0.84449762 0.49997151 0.8420769 0.51434511
		 0.84560251 0.47958213 0.84678835 0.45967725 0.84885788 0.43980712 0.85188156 0.41972995
		 0.88208878 0.38151366 0.88532662 0.40559801 0.88051409 0.35750535 0.88021231 0.33347195
		 0.88147104 0.30944946 0.87606782 0.50203085 0.87293768 0.51662523 0.87687325 0.48131934
		 0.87837362 0.46075937 0.88071668 0.4403196 0.88447994 0.42001903 0.76543164 0.49715585
		 0.76440597 0.47884947 0.77848172 0.47831431 0.77866375 0.49616772 0.76486611 0.45826688
		 0.77932996 0.45839411 0.78147972 0.43864459 0.76738447 0.43777359 0.77139449 0.41959769
		 0.78447157 0.42200875 0.77599841 0.50368083 0.7855382 0.41616458 0.78657842 0.40871823
		 0.76513678 0.41600329 0.75938714 0.43742663 0.75861561 0.50045526 0.75638771 0.47885811
		 0.75663126 0.45812386 0.96408027 0.33404112 0.94923854 0.33303827 0.95219654 0.31186485
		 0.96637917 0.31481975 0.96402669 0.35703519 0.94937086 0.35706192 0.95364213 0.40233299
		 0.95059907 0.38110676 0.96536058 0.37999824 0.96776432 0.39925522 0.97321302 0.31253257
		 0.94800985 0.30720797 0.96981657 0.33457741 0.96971053 0.35700512 0.97461653 0.40149772
		 0.97107446 0.37942913 0.94955176 0.40702835;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 240 ".vt";
	setAttr ".vt[0:165]"  0.3224951 0.16281214 0.28151691 0.37990728 0.15283731 0.28261754
		 0.43293783 0.12865329 0.28299192 0.47812417 0.091839172 0.28261754 0.51251638 0.04479859 0.28151691
		 0.48308051 0.028646253 0.2800419 0.45375744 0.068753779 0.28098041 0.41523072 0.10014204 0.28129941
		 0.37001634 0.12076163 0.28098041 0.32106596 0.12926638 0.2800419 0.32442009 0.16591144 0.20110416
		 0.38184968 0.15596485 0.20147142 0.43488619 0.13179055 0.20159584 0.48006681 0.094966836 0.20147142
		 0.51444089 0.047897898 0.20110416 0.48498213 0.031707712 0.20061165 0.45567384 0.071839325 0.20092508
		 0.41715214 0.10323574 0.2010321 0.37193251 0.12384712 0.20092508 0.32296711 0.13232777 0.20061165
		 0.32442009 0.16591144 0.12063031 0.38184968 0.15596485 0.12026405 0.43488619 0.13179055 0.12013866
		 0.48006681 0.094966836 0.12026405 0.51444089 0.047897898 0.12063031 0.48498213 0.031707712 0.1211228
		 0.45567384 0.071839325 0.12080938 0.41715214 0.10323574 0.12070336 0.37193251 0.12384712 0.12080938
		 0.32296711 0.13232777 0.1211228 0.3224951 0.16281214 0.040218465 0.37990728 0.15283731 0.039117806
		 0.43293783 0.12865329 0.038743459 0.47812417 0.091839172 0.039117806 0.51251638 0.04479859 0.040218465
		 0.48308051 0.028646253 0.041693442 0.45375744 0.068753779 0.040755056 0.41523072 0.10014204 0.040435903
		 0.37001634 0.12076163 0.040755056 0.32106596 0.12926638 0.041693442 0.47960436 0.023048952 0.35254264
		 0.48152873 0.032711118 0.36011761 0.45025125 0.063108332 0.35410377 0.45492935 0.067319013 0.36141208
		 0.31758958 0.12366903 0.35254264 0.32539743 0.12967715 0.36011761 0.31897199 0.15713909 0.35499811
		 0.32612786 0.14735988 0.36141583 0.50899303 0.039125524 0.35499811 0.49705514 0.041204594 0.36141583
		 0.47456601 0.086109631 0.35683066 0.46777543 0.079471067 0.36285347 0.37634888 0.14710772 0.35683066
		 0.37340841 0.13807793 0.36285347 0.36821046 0.12117628 0.36141208 0.36651015 0.11511613 0.35410377
		 0.42936751 0.12290458 0.35745504 0.4243488 0.11482348 0.36345175 0.41502234 0.099806406 0.36196357
		 0.41171429 0.094480127 0.35463694 0.45023409 0.063080929 -0.032724686 0.45466617 0.067070015 -0.039647244
		 0.32496941 0.12933348 -0.038339652 0.31757265 0.12364163 -0.031162597 0.32573417 0.14784716 -0.039697297
		 0.31895483 0.15711169 -0.03361813 0.37354636 0.13852568 -0.041155525 0.37633196 0.1470803 -0.035450615
		 0.36649299 0.11508872 -0.032724686 0.36810386 0.12082983 -0.039647244 0.4245958 0.11522134 -0.04175622
		 0.42935035 0.12287706 -0.036075063 0.41169736 0.094452724 -0.033256926 0.41483113 0.099498674 -0.040198006
		 0.50897586 0.039098155 -0.033618122 0.47454888 0.086082228 -0.035450608 0.47958723 0.023021532 -0.03116259
		 0.46811578 0.079792991 -0.041155517 0.49766654 0.041067734 -0.039697289 0.48141009 0.032175161 -0.038339645
		 0.30985647 0.11493614 0.64111131 0.36189044 0.10768703 0.64592934 0.40939566 0.08672528 0.6475721
		 0.44924456 0.053435594 0.64592934 0.478809 0.010007262 0.64111131 0.45126569 -0.0064966939 0.6346485
		 0.42607078 0.030523181 0.638758 0.39211199 0.058895946 0.64015758 0.3516255 0.076757848 0.638758
		 0.30727297 0.082930729 0.6346485 0.31492698 0.12937187 0.58063322 0.36837763 0.12140334 0.58490002
		 0.41737315 0.099570543 0.58635569 0.45866346 0.065330923 0.58490002 0.48950082 0.020951748 0.58063322
		 0.46141759 0.0045681335 0.57491171 0.4351503 0.042390868 0.57855052 0.39997932 0.071563318 0.57979053
		 0.35823849 0.090157256 0.57855052 0.31269073 0.096935838 0.57491171 0.31811455 0.14076445 0.51944453
		 0.37296212 0.13205041 0.52315325 0.42343971 0.10933864 0.52441651 0.46617442 0.074160233 0.52315325
		 0.49830022 0.028859407 0.51944453 0.46970069 0.012632743 0.51447147 0.44234797 0.051233575 0.5176332
		 0.40596172 0.0811961 0.51871079 0.36297414 0.10052888 0.5176332 0.31624773 0.10793546 0.51447147
		 0.31940904 0.14910021 0.45763606 0.37563434 0.13961364 0.46078116 0.42758605 0.11601493 0.4618535
		 0.4717696 0.079908326 0.46078116 0.50519776 0.03371489 0.45763606 0.47610655 0.017682135 0.45341843
		 0.44765499 0.0570364 0.45610023 0.4100506 0.087779671 0.45701426 0.36582291 0.10785866 0.45610023
		 0.3179343 0.11591588 0.45341843 0.44027802 -0.019346043 0.68857455 0.44196215 -0.010976113 0.69601607
		 0.41604593 0.016906381 0.69314551 0.41992104 0.02028212 0.69980538 0.30062601 0.067385435 0.68857455
		 0.3073819 0.072605759 0.69601607 0.30349982 0.09894444 0.69576311 0.30890027 0.089278713 0.69981581
		 0.46729213 -0.0027797185 0.69576311 0.45623425 -0.0022239536 0.69981581 0.43887189 0.039739326 0.70112622
		 0.43198022 0.032345101 0.70402277 0.35421172 0.092317805 0.70112622 0.35063896 0.082862511 0.70402277
		 0.34517196 0.066705495 0.69980538 0.34386364 0.06173557 0.69314551 0.40033981 0.072143778 0.70295322
		 0.3949587 0.063479304 0.7057789 0.38589975 0.048893064 0.70141917 0.38319299 0.044534892 0.69470388
		 0.48230162 0.029564708 0.39294779 0.47976503 0.019735977 0.39830792 0.45046586 0.0596544 0.4005056
		 0.45551014 0.064410634 0.39479035 0.50906014 0.035701752 0.40176451 0.49853346 0.038399532 0.39486253
		 0.32583907 0.12673661 0.39294779 0.31815347 0.12010561 0.39830792 0.32656261 0.14520304 0.39486253
		 0.31947801 0.1534428 0.40176451 0.46892649 0.077071503 0.3969132 0.47468904 0.082525402 0.40434182
		 0.37435183 0.13580735 0.3969132 0.37668601 0.14339069 0.40434182 0.36692354 0.11153881 0.4005056
		 0.36895052 0.11816884 0.39479035 0.42538545 0.11247131 0.39775914 0.42957851 0.11922292 0.40521872
		 0.41201207 0.090938181 0.40125352 0.41566011 0.09681198 0.39556438 0.28531724 0.042140216 0.85141271
		 0.32743227 0.03516221 0.85889816 0.36624524 0.017592162 0.86145073 0.39920074 -0.0094097257 0.85889816
		 0.42412531 -0.044067323 0.85141271 0.40234721 -0.056256011 0.84137458;
	setAttr ".vt[166:239]" 0.38110647 -0.02671279 0.84775954 0.35302207 -0.0036992729 0.84993351
		 0.31994373 0.011272706 0.84775954 0.28404576 0.017215818 0.84137458 0.2911948 0.056756899 0.82290846
		 0.33448976 0.049213082 0.8301326 0.37453243 0.030935913 0.8325963 0.40866685 0.0031450558 0.8301326
		 0.43462139 -0.032318905 0.82290846 0.41237918 -0.044442475 0.81322062 0.39027014 -0.014218166 0.81938094
		 0.36119458 0.0094596371 0.82148021 0.32708123 0.02502574 0.81938094 0.29018807 0.031445056 0.81322062
		 0.29562929 0.069039971 0.79319769 0.34008825 0.06091018 0.80015272 0.3813543 0.041920036 0.80252224
		 0.41666967 0.013348773 0.80015272 0.44366613 -0.022899061 0.79319769 0.42097747 -0.034929395 0.78387302
		 0.39799091 -0.0040431023 0.78980327 0.3679218 0.020291582 0.79182214 0.33277914 0.036456987 0.78980327
		 0.29490355 0.043369472 0.78387302 0.29860869 0.078973562 0.76232451 0.34421721 0.070237353 0.76899916
		 0.38670036 0.05052796 0.77127218 0.42319992 0.021184564 0.76899916 0.45124939 -0.015824735 0.76232451
		 0.42813292 -0.02773349 0.75337857 0.40425852 0.00379581 0.7590673 0.37319371 0.028780133 0.76100749
		 0.33702719 0.045550346 0.7590673 0.2981818 0.052973405 0.75337857 0.3918688 -0.069149613 0.86600566
		 0.39282385 -0.062963516 0.87179351 0.37140658 -0.040257007 0.87259841 0.37425625 -0.038021207 0.87725747
		 0.27713344 0.0021072999 0.86600566 0.2822552 0.0057057403 0.87179351 0.2786237 0.026633307 0.87637568
		 0.28304258 0.018663123 0.87727362 0.41319233 -0.056941256 0.87637568 0.40408924 -0.056513712 0.87727362
		 0.38919333 -0.023054302 0.88410962 0.38365325 -0.028932765 0.88334024 0.31963816 0.020143181 0.88410962
		 0.31682476 0.012571365 0.88334024 0.31284383 0.00011930824 0.87725747 0.31210294 -0.0034262016 0.87259841
		 0.35731456 0.0032122079 0.88674533 0.35302421 -0.0036959015 0.88587266 0.3461096 -0.014829651 0.87958461
		 0.34422657 -0.017861798 0.87484533 0.43496957 -0.015158534 0.7245127 0.43291911 -0.023179337 0.72509778
		 0.40836447 0.0088386014 0.73053986 0.41255307 0.012817912 0.72907227 0.45622751 -0.011286095 0.73365557
		 0.44788429 -0.008577697 0.72924936 0.30642298 0.064676017 0.7245127 0.30014238 0.059282407 0.72509778
		 0.30659649 0.079169914 0.72924936 0.30047032 0.085447609 0.73365557 0.42310864 0.022467732 0.73433173
		 0.42742208 0.026270598 0.74003804 0.34540781 0.070724085 0.73433173 0.34690443 0.076276273 0.74003804
		 0.33972737 0.051465765 0.73053986 0.34143749 0.056984611 0.72907227 0.38715002 0.051252097 0.7364251
		 0.39016673 0.056109592 0.74221289 0.37660667 0.034275591 0.73239404 0.3796427 0.039164126 0.7309888;
	setAttr -s 467 ".ed";
	setAttr ".ed[0:165]"  0 46 0 1 52 0 0 1 0 2 56 0 1 2 0 3 50 0 2 3 0 4 48 0
		 3 4 0 5 40 0 4 5 0 6 16 0 5 6 0 7 17 0 6 7 0 8 18 0 7 8 0 9 44 0 8 9 0 9 0 0 10 0 0
		 11 1 0 10 11 0 12 2 0 11 12 0 13 3 0 12 13 0 14 4 0 13 14 0 15 5 0 14 15 0 16 26 0
		 15 16 0 17 27 0 16 17 0 18 28 0 17 18 0 19 9 0 18 19 0 19 10 0 20 10 0 21 11 0 20 21 0
		 22 12 0 21 22 0 23 13 0 22 23 0 24 14 0 23 24 0 25 15 0 24 25 0 26 36 0 25 26 0 27 37 0
		 26 27 0 28 38 0 27 28 0 29 19 0 28 29 0 29 20 0 30 20 0 31 21 0 30 31 0 32 22 0 31 32 0
		 33 23 0 32 33 0 34 24 0 33 34 0 35 25 0 34 35 0 36 60 0 35 36 0 37 72 0 36 37 0 38 68 0
		 37 38 0 39 29 0 38 39 0 39 30 0 42 6 0 55 8 0 59 7 0 49 51 0 51 43 1 43 41 0 41 49 0
		 40 42 0 51 57 0 57 58 1 58 43 0 42 59 0 53 47 0 47 45 0 45 54 0 44 46 0 46 52 0 48 40 0
		 50 48 0 54 58 0 57 53 0 53 54 1 52 56 0 55 44 0 56 50 0 59 55 0 41 40 0 48 49 0 43 42 1
		 58 59 1 45 44 0 47 46 0 53 52 1 51 50 1 57 56 1 54 55 1 76 35 0 74 34 0 63 39 0 65 30 0
		 75 33 0 67 31 0 71 32 0 61 77 1 79 61 0 70 77 0 61 73 0 60 76 0 63 68 0 64 66 0 66 69 1
		 69 62 0 62 64 0 65 63 0 75 71 0 70 73 1 73 69 0 66 70 0 67 65 0 68 72 0 71 67 0 72 60 0
		 61 60 1 63 62 0 69 68 1 65 64 0 70 71 1 66 67 1 73 72 1 74 75 0 76 74 0 77 78 0 78 79 0
		 76 79 0 77 75 0 80 126 0 81 132 0 80 81 0 82 136 0 81 82 0 83 130 0 82 83 0 84 128 0
		 83 84 0 85 120 0 84 85 0;
	setAttr ".ed[166:331]" 86 96 0 85 86 0 87 97 0 86 87 0 88 98 0 87 88 0 89 124 0
		 88 89 0 89 80 0 90 80 0 91 81 0 90 91 0 92 82 0 91 92 0 93 83 0 92 93 0 94 84 0 93 94 0
		 95 85 0 94 95 0 96 106 0 95 96 0 97 107 0 96 97 0 98 108 0 97 98 0 99 89 0 98 99 0
		 99 90 0 100 90 0 101 91 0 100 101 0 102 92 0 101 102 0 103 93 0 102 103 0 104 94 0
		 103 104 0 105 95 0 104 105 0 106 116 0 105 106 0 107 117 0 106 107 0 108 118 0 107 108 0
		 109 99 0 108 109 0 109 100 0 110 100 0 111 101 0 110 111 0 112 102 0 111 112 0 113 103 0
		 112 113 0 114 104 0 113 114 0 115 105 0 114 115 0 116 142 0 115 116 0 117 158 0 116 117 0
		 118 154 0 117 118 0 119 109 0 118 119 0 119 110 0 122 86 0 135 88 0 139 87 0 129 131 0
		 131 123 1 123 121 0 121 129 0 120 122 0 131 137 0 137 138 1 138 123 0 122 139 0 133 127 0
		 127 125 0 125 134 0 124 126 0 126 132 0 128 120 0 130 128 0 134 138 0 137 133 0 133 134 1
		 132 136 0 135 124 0 136 130 0 139 135 0 121 120 0 128 129 0 123 122 1 138 139 1 125 124 0
		 127 126 0 133 132 1 131 130 1 137 136 1 134 135 1 141 115 0 144 114 0 147 119 0 149 110 0
		 151 113 0 153 111 0 157 112 0 141 144 0 150 145 0 145 140 0 140 143 0 156 150 0 150 143 1
		 143 159 0 142 141 0 144 151 0 147 154 0 148 152 0 152 155 1 155 146 0 146 148 0 149 147 0
		 151 157 0 156 159 1 159 155 0 152 156 0 153 149 0 154 158 0 157 153 0 158 142 0 141 140 0
		 145 144 0 143 142 1 150 151 1 147 146 0 155 154 1 149 148 0 156 157 1 152 153 1 159 158 1
		 160 206 0 161 212 0 160 161 0 162 216 0 161 162 0 163 210 0 162 163 0 164 208 0 163 164 0
		 165 200 0 164 165 0 166 176 0 165 166 0 167 177 0 166 167 0 168 178 0 167 168 0 169 204 0
		 168 169 0 169 160 0 170 160 0;
	setAttr ".ed[332:466]" 171 161 0 170 171 0 172 162 0 171 172 0 173 163 0 172 173 0
		 174 164 0 173 174 0 175 165 0 174 175 0 176 186 0 175 176 0 177 187 0 176 177 0 178 188 0
		 177 178 0 179 169 0 178 179 0 179 170 0 180 170 0 181 171 0 180 181 0 182 172 0 181 182 0
		 183 173 0 182 183 0 184 174 0 183 184 0 185 175 0 184 185 0 186 196 0 185 186 0 187 197 0
		 186 187 0 188 198 0 187 188 0 189 179 0 188 189 0 189 180 0 190 180 0 191 181 0 190 191 0
		 192 182 0 191 192 0 193 183 0 192 193 0 194 184 0 193 194 0 195 185 0 194 195 0 196 222 0
		 195 196 0 197 238 0 196 197 0 198 234 0 197 198 0 199 189 0 198 199 0 199 190 0 202 166 0
		 215 168 0 219 167 0 209 211 0 211 203 1 203 201 0 201 209 0 200 202 0 211 217 0 217 218 1
		 218 203 0 202 219 0 213 207 0 207 205 0 205 214 0 204 206 0 206 212 0 208 200 0 210 208 0
		 214 218 0 217 213 0 213 214 1 212 216 0 215 204 0 216 210 0 219 215 0 201 200 0 208 209 0
		 203 202 1 218 219 1 205 204 0 207 206 0 213 212 1 211 210 1 217 216 1 214 215 1 221 195 0
		 224 194 0 227 199 0 229 190 0 231 193 0 233 191 0 237 192 0 221 224 0 230 225 0 225 220 0
		 220 223 0 236 230 0 230 223 1 223 239 0 222 221 0 224 231 0 227 234 0 228 232 0 232 235 1
		 235 226 0 226 228 0 229 227 0 231 237 0 236 239 1 239 235 0 232 236 0 233 229 0 234 238 0
		 237 233 0 238 222 0 221 220 0 225 224 0 223 222 1 230 231 1 227 226 0 235 234 1 229 228 0
		 236 237 1 232 233 1 239 238 1;
	setAttr -s 232 -ch 928 ".fc[0:231]" -type "polyFaces" 
		f 4 149 120 68 -118
		mu 0 4 0 1 2 3
		f 4 127 116 72 71
		mu 0 4 4 5 6 7
		f 4 133 118 79 -120
		mu 0 4 8 9 10 11
		f 4 -117 150 117 70
		mu 0 4 6 5 0 3
		f 4 138 119 62 -122
		mu 0 4 12 13 14 15
		f 4 128 -76 78 -119
		mu 0 4 9 16 17 10
		f 4 140 121 64 -123
		mu 0 4 18 12 15 19
		f 4 139 -74 76 75
		mu 0 4 16 20 21 17
		f 4 134 122 66 -121
		mu 0 4 1 18 19 2
		f 4 141 -72 74 73
		mu 0 4 20 4 7 21
		f 4 -3 0 96 -2
		mu 0 4 22 23 24 25
		f 4 -5 1 102 -4
		mu 0 4 26 22 25 27
		f 4 -7 3 104 -6
		mu 0 4 28 26 27 29
		f 4 -9 5 98 -8
		mu 0 4 30 28 29 31
		f 4 97 -10 -11 7
		mu 0 4 31 32 33 30
		f 4 -13 9 87 80
		mu 0 4 34 33 32 35
		f 4 -15 -81 91 82
		mu 0 4 36 34 35 37
		f 4 -17 -83 105 81
		mu 0 4 38 36 37 39
		f 4 -19 -82 103 -18
		mu 0 4 40 38 39 41
		f 4 -20 17 95 -1
		mu 0 4 42 40 41 43
		f 4 -23 20 2 -22
		mu 0 4 44 45 23 22
		f 4 -25 21 4 -24
		mu 0 4 46 44 22 26
		f 4 -27 23 6 -26
		mu 0 4 47 46 26 28
		f 4 -29 25 8 -28
		mu 0 4 48 47 28 30
		f 4 -30 -31 27 10
		mu 0 4 33 49 48 30
		f 4 -33 29 12 11
		mu 0 4 50 49 33 34
		f 4 -35 -12 14 13
		mu 0 4 51 50 34 36
		f 4 -37 -14 16 15
		mu 0 4 52 51 36 38
		f 4 -39 -16 18 -38
		mu 0 4 53 52 38 40
		f 4 -40 37 19 -21
		mu 0 4 54 53 40 42
		f 4 -43 40 22 -42
		mu 0 4 55 56 45 44
		f 4 -45 41 24 -44
		mu 0 4 57 55 44 46
		f 4 -47 43 26 -46
		mu 0 4 58 57 46 47
		f 4 -49 45 28 -48
		mu 0 4 59 58 47 48
		f 4 -50 -51 47 30
		mu 0 4 49 60 59 48
		f 4 -53 49 32 31
		mu 0 4 61 60 49 50
		f 4 -55 -32 34 33
		mu 0 4 62 61 50 51
		f 4 -57 -34 36 35
		mu 0 4 63 62 51 52
		f 4 -59 -36 38 -58
		mu 0 4 64 63 52 53
		f 4 -60 57 39 -41
		mu 0 4 65 64 53 54
		f 4 -63 60 42 -62
		mu 0 4 15 14 56 55
		f 4 -65 61 44 -64
		mu 0 4 19 15 55 57
		f 4 -67 63 46 -66
		mu 0 4 2 19 57 58
		f 4 -69 65 48 -68
		mu 0 4 3 2 58 59
		f 4 -70 -71 67 50
		mu 0 4 60 6 3 59
		f 4 -73 69 52 51
		mu 0 4 7 6 60 61
		f 4 -75 -52 54 53
		mu 0 4 21 7 61 62
		f 4 -77 -54 56 55
		mu 0 4 17 21 62 63
		f 4 -79 -56 58 -78
		mu 0 4 10 17 63 64
		f 4 -80 77 59 -61
		mu 0 4 11 10 64 65
		f 4 83 84 85 86
		mu 0 4 66 67 68 69
		f 4 88 89 90 -85
		mu 0 4 67 70 71 72
		f 4 -102 92 93 94
		mu 0 4 73 74 75 76
		f 4 99 -90 100 101
		mu 0 4 73 71 70 74
		f 4 106 -98 107 -87
		mu 0 4 77 32 31 78
		f 4 -107 -86 108 -88
		mu 0 4 32 77 79 35
		f 4 -109 -91 109 -92
		mu 0 4 35 79 80 37
		f 4 110 -104 -116 -95
		mu 0 4 81 41 39 82
		f 4 -111 -94 111 -96
		mu 0 4 41 81 83 43
		f 4 -112 -93 112 -97
		mu 0 4 24 75 74 25
		f 4 -108 -99 -114 -84
		mu 0 4 66 31 29 67
		f 4 113 -105 -115 -89
		mu 0 4 67 29 27 70
		f 4 -113 -101 114 -103
		mu 0 4 25 74 70 27
		f 4 115 -106 -110 -100
		mu 0 4 82 39 37 80
		f 4 123 151 152 124
		mu 0 4 84 85 86 87
		f 4 -136 125 -124 126
		mu 0 4 88 89 85 90
		f 4 129 130 131 132
		mu 0 4 91 92 93 94
		f 4 135 136 -131 137
		mu 0 4 89 88 93 92
		f 4 -154 -128 -143 -125
		mu 0 4 95 5 4 96
		f 4 142 -142 -149 -127
		mu 0 4 96 4 20 97
		f 4 143 -132 144 -129
		mu 0 4 9 98 99 16
		f 4 -144 -134 145 -133
		mu 0 4 98 9 8 100
		f 4 -146 -139 -148 -130
		mu 0 4 91 13 12 92
		f 4 -155 -126 146 -135
		mu 0 4 1 85 89 18
		f 4 147 -141 -147 -138
		mu 0 4 92 12 18 89
		f 4 -145 -137 148 -140
		mu 0 4 16 99 97 20
		f 4 286 275 223 -273
		mu 0 4 101 102 103 104
		f 4 285 271 227 226
		mu 0 4 105 106 107 108
		f 4 292 273 234 -275
		mu 0 4 109 110 111 112
		f 4 -272 278 272 225
		mu 0 4 107 106 101 104
		f 4 297 274 217 -277
		mu 0 4 113 109 112 114
		f 4 287 -231 233 -274
		mu 0 4 115 116 117 118
		f 4 299 276 219 -278
		mu 0 4 119 113 114 120
		f 4 298 -229 231 230
		mu 0 4 116 121 122 117
		f 4 293 277 221 -276
		mu 0 4 102 119 120 103
		f 4 300 -227 229 228
		mu 0 4 121 105 108 122
		f 4 -158 155 251 -157
		mu 0 4 123 124 125 126
		f 4 -160 156 257 -159
		mu 0 4 127 123 126 128
		f 4 -162 158 259 -161
		mu 0 4 129 127 128 130
		f 4 -164 160 253 -163
		mu 0 4 131 129 130 132
		f 4 252 -165 -166 162
		mu 0 4 132 133 134 131
		f 4 -168 164 242 235
		mu 0 4 135 134 133 136
		f 4 -170 -236 246 237
		mu 0 4 137 135 136 138
		f 4 -172 -238 260 236
		mu 0 4 139 137 138 140
		f 4 -174 -237 258 -173
		mu 0 4 141 139 140 142
		f 4 -175 172 250 -156
		mu 0 4 124 143 144 125
		f 4 -178 175 157 -177
		mu 0 4 145 146 124 123
		f 4 -180 176 159 -179
		mu 0 4 147 145 123 127
		f 4 -182 178 161 -181
		mu 0 4 148 147 127 129
		f 4 -184 180 163 -183
		mu 0 4 149 148 129 131
		f 4 -185 -186 182 165
		mu 0 4 134 150 149 131
		f 4 -188 184 167 166
		mu 0 4 151 150 134 135
		f 4 -190 -167 169 168
		mu 0 4 152 151 135 137
		f 4 -192 -169 171 170
		mu 0 4 153 152 137 139
		f 4 -194 -171 173 -193
		mu 0 4 154 153 139 141
		f 4 -195 192 174 -176
		mu 0 4 146 155 143 124
		f 4 -198 195 177 -197
		mu 0 4 156 157 146 145
		f 4 -200 196 179 -199
		mu 0 4 158 156 145 147
		f 4 -202 198 181 -201
		mu 0 4 159 158 147 148
		f 4 -204 200 183 -203
		mu 0 4 160 159 148 149
		f 4 -205 -206 202 185
		mu 0 4 150 161 160 149
		f 4 -208 204 187 186
		mu 0 4 162 161 150 151
		f 4 -210 -187 189 188
		mu 0 4 163 162 151 152
		f 4 -212 -189 191 190
		mu 0 4 164 163 152 153
		f 4 -214 -191 193 -213
		mu 0 4 165 164 153 154
		f 4 -215 212 194 -196
		mu 0 4 157 166 155 146
		f 4 -218 215 197 -217
		mu 0 4 114 112 157 156
		f 4 -220 216 199 -219
		mu 0 4 120 114 156 158
		f 4 -222 218 201 -221
		mu 0 4 103 120 158 159
		f 4 -224 220 203 -223
		mu 0 4 104 103 159 160
		f 4 -225 -226 222 205
		mu 0 4 161 107 104 160
		f 4 -228 224 207 206
		mu 0 4 108 107 161 162
		f 4 -230 -207 209 208
		mu 0 4 122 108 162 163
		f 4 -232 -209 211 210
		mu 0 4 117 122 163 164
		f 4 -234 -211 213 -233
		mu 0 4 118 117 164 165
		f 4 -235 232 214 -216
		mu 0 4 112 111 166 157
		f 4 238 239 240 241
		mu 0 4 167 168 169 170
		f 4 243 244 245 -240
		mu 0 4 168 171 172 169
		f 4 -257 247 248 249
		mu 0 4 173 174 175 176
		f 4 254 -245 255 256
		mu 0 4 173 172 171 174
		f 4 261 -253 262 -242
		mu 0 4 177 133 132 178
		f 4 -262 -241 263 -243
		mu 0 4 133 177 179 136
		f 4 -264 -246 264 -247
		mu 0 4 136 179 180 138
		f 4 265 -259 -271 -250
		mu 0 4 181 142 140 182
		f 4 -266 -249 266 -251
		mu 0 4 144 183 184 125
		f 4 -267 -248 267 -252
		mu 0 4 125 175 174 126
		f 4 -263 -254 -269 -239
		mu 0 4 167 132 130 168
		f 4 268 -260 -270 -244
		mu 0 4 168 130 128 171
		f 4 -268 -256 269 -258
		mu 0 4 126 174 171 128
		f 4 270 -261 -265 -255
		mu 0 4 182 140 138 180
		f 4 -284 279 280 281
		mu 0 4 185 186 187 188
		f 4 -295 282 283 284
		mu 0 4 189 190 186 185
		f 4 288 289 290 291
		mu 0 4 191 192 193 194
		f 4 294 295 -290 296
		mu 0 4 190 189 193 192
		f 4 301 -281 302 -279
		mu 0 4 106 188 195 101
		f 4 -302 -286 -304 -282
		mu 0 4 188 106 105 185
		f 4 303 -301 -311 -285
		mu 0 4 185 105 121 189
		f 4 -303 -280 304 -287
		mu 0 4 101 195 196 102
		f 4 305 -291 306 -288
		mu 0 4 115 194 193 116
		f 4 -306 -293 307 -292
		mu 0 4 197 110 109 198
		f 4 -308 -298 -310 -289
		mu 0 4 198 109 113 199
		f 4 -305 -283 308 -294
		mu 0 4 102 196 200 119
		f 4 309 -300 -309 -297
		mu 0 4 199 113 119 200
		f 4 -307 -296 310 -299
		mu 0 4 116 193 189 121
		f 4 442 431 379 -429
		mu 0 4 201 202 203 204
		f 4 441 427 383 382
		mu 0 4 205 206 207 208
		f 4 448 429 390 -431
		mu 0 4 209 210 211 212
		f 4 -428 434 428 381
		mu 0 4 207 206 213 214
		f 4 453 430 373 -433
		mu 0 4 215 209 212 216
		f 4 443 -387 389 -430
		mu 0 4 210 217 218 211
		f 4 455 432 375 -434
		mu 0 4 219 215 216 220
		f 4 454 -385 387 386
		mu 0 4 217 221 222 218
		f 4 449 433 377 -432
		mu 0 4 202 219 220 203
		f 4 456 -383 385 384
		mu 0 4 221 205 208 222
		f 4 -314 311 407 -313
		mu 0 4 223 224 225 226
		f 4 -316 312 413 -315
		mu 0 4 227 223 226 228
		f 4 -318 314 415 -317
		mu 0 4 229 227 228 230
		f 4 -320 316 409 -319
		mu 0 4 231 229 230 232
		f 4 408 -321 -322 318
		mu 0 4 233 234 235 236
		f 4 -324 320 398 391
		mu 0 4 237 235 234 238
		f 4 -326 -392 402 393
		mu 0 4 239 237 238 240
		f 4 -328 -394 416 392
		mu 0 4 241 239 240 242
		f 4 -330 -393 414 -329
		mu 0 4 243 241 242 244
		f 4 -331 328 406 -312
		mu 0 4 224 243 244 225
		f 4 -334 331 313 -333
		mu 0 4 245 246 224 223
		f 4 -336 332 315 -335
		mu 0 4 247 245 223 227
		f 4 -338 334 317 -337
		mu 0 4 248 247 227 229
		f 4 -340 336 319 -339
		mu 0 4 249 248 229 231
		f 4 -341 -342 338 321
		mu 0 4 235 250 251 236
		f 4 -344 340 323 322
		mu 0 4 252 250 235 237
		f 4 -346 -323 325 324
		mu 0 4 253 252 237 239
		f 4 -348 -325 327 326
		mu 0 4 254 253 239 241
		f 4 -350 -327 329 -349
		mu 0 4 255 254 241 243
		f 4 -351 348 330 -332
		mu 0 4 246 255 243 224
		f 4 -354 351 333 -353
		mu 0 4 256 257 246 245
		f 4 -356 352 335 -355
		mu 0 4 258 256 245 247
		f 4 -358 354 337 -357
		mu 0 4 259 258 247 248
		f 4 -360 356 339 -359
		mu 0 4 260 259 248 249
		f 4 -361 -362 358 341
		mu 0 4 250 261 262 251
		f 4 -364 360 343 342
		mu 0 4 263 261 250 252
		f 4 -366 -343 345 344
		mu 0 4 264 263 252 253
		f 4 -368 -345 347 346
		mu 0 4 265 264 253 254
		f 4 -370 -347 349 -369
		mu 0 4 266 265 254 255
		f 4 -371 368 350 -352
		mu 0 4 257 266 255 246
		f 4 -374 371 353 -373
		mu 0 4 216 212 257 256
		f 4 -376 372 355 -375
		mu 0 4 220 216 256 258
		f 4 -378 374 357 -377
		mu 0 4 203 220 258 259
		f 4 -380 376 359 -379
		mu 0 4 204 203 259 260
		f 4 -381 -382 378 361
		mu 0 4 261 207 214 262
		f 4 -384 380 363 362
		mu 0 4 208 207 261 263
		f 4 -386 -363 365 364
		mu 0 4 222 208 263 264
		f 4 -388 -365 367 366
		mu 0 4 218 222 264 265
		f 4 -390 -367 369 -389
		mu 0 4 211 218 265 266
		f 4 -391 388 370 -372
		mu 0 4 212 211 266 257
		f 4 394 395 396 397
		mu 0 4 267 268 269 270
		f 4 399 400 401 -396
		mu 0 4 268 271 272 269
		f 4 -413 403 404 405
		mu 0 4 273 274 275 276
		f 4 410 -401 411 412
		mu 0 4 273 272 271 274
		f 4 417 -409 418 -398
		mu 0 4 270 234 233 277
		f 4 -418 -397 419 -399
		mu 0 4 234 270 269 238
		f 4 -420 -402 420 -403
		mu 0 4 238 269 272 240
		f 4 421 -415 -427 -406
		mu 0 4 276 244 242 273
		f 4 -422 -405 422 -407
		mu 0 4 244 278 279 225
		f 4 -423 -404 423 -408
		mu 0 4 280 275 274 281
		f 4 -419 -410 -425 -395
		mu 0 4 267 282 283 268
		f 4 424 -416 -426 -400
		mu 0 4 268 283 284 271
		f 4 -424 -412 425 -414
		mu 0 4 281 274 271 284
		f 4 426 -417 -421 -411
		mu 0 4 273 242 240 272
		f 4 -440 435 436 437
		mu 0 4 285 286 287 288
		f 4 -451 438 439 440
		mu 0 4 289 290 286 285
		f 4 444 445 446 447
		mu 0 4 291 292 293 294
		f 4 450 451 -446 452
		mu 0 4 290 289 293 292
		f 4 457 -437 458 -435
		mu 0 4 295 288 287 296
		f 4 -458 -442 -460 -438
		mu 0 4 288 295 297 285
		f 4 459 -457 -467 -441
		mu 0 4 285 297 298 289
		f 4 -459 -436 460 -443
		mu 0 4 201 287 286 202
		f 4 461 -447 462 -444
		mu 0 4 299 294 293 300
		f 4 -462 -449 463 -448
		mu 0 4 294 299 301 291
		f 4 -464 -454 -466 -445
		mu 0 4 291 209 215 292
		f 4 -461 -439 464 -450
		mu 0 4 202 286 290 219
		f 4 465 -456 -465 -453
		mu 0 4 292 215 219 290
		f 4 -463 -452 466 -455
		mu 0 4 300 293 289 298;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 14 ".lnk";
	setAttr -s 14 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 2;
	setAttr -s 2 ".dli[1:2]"  1 2;
	setAttr -s 3 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n"
		+ "                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n"
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
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph InputOutput1\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n"
		+ "                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n"
		+ "                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n"
		+ "            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 1 -size 12 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 100 -ast 1 -aet 110 ";
	setAttr ".st" 6;
createNode lambert -n "icosahedron:ico_edges";
	setAttr ".c" -type "float3" 0.958 0.958 0.958 ;
createNode shadingEngine -n "icosahedron:lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "icosahedron:materialInfo1";
createNode lambert -n "icosahedron:ico_faces";
	setAttr ".c" -type "float3" 0 0 0 ;
createNode shadingEngine -n "icosahedron:lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "icosahedron:materialInfo2";
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
createNode phong -n "Hand_SHD";
	setAttr ".cp" 2;
createNode shadingEngine -n "Hand_MDLSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "Hand_MDLSG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "psdFileTex12456";
	setAttr ".ftn" -type "string" "D:/WIP/Sixense/Hands/textures/Hands_Diffuse.png";
createNode place2dTexture -n "place2dTexture1";
createNode file -n "file8";
	setAttr ".ftn" -type "string" "D:/WIP/Sixense/Hands/textures/Hands_Specular.png";
createNode place2dTexture -n "place2dTexture2";
createNode bump2d -n "bump2d1";
	setAttr ".bd" 0;
	setAttr ".bi" 1;
createNode file -n "psdFileTex12457";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/WIP/Sixense/Hands/textures/Hands_Normal.png";
createNode place2dTexture -n "place2dTexture3";
createNode phong -n "Hand_SHD1";
	setAttr ".cp" 2;
createNode shadingEngine -n "Hand_MDLSG2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode shadingEngine -n "Hand_MDLSG3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode bump2d -n "bump2d2";
	setAttr ".bi" 1;
createNode animCurveTA -n "root_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 0 30 0 40 0 60 0 69 0 80 0 90 0
		 100 0;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 10 10 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
createNode animCurveTA -n "root_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 0 30 0 40 0 60 0 69 0 80 0 90 0
		 100 0;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 10 10 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
createNode animCurveTA -n "root_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 0 30 0 40 0 60 0 69 0 80 0 90 0
		 100 0;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 10 10 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
createNode animCurveTA -n "index0_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 50 -0.048315642497668045
		 60 0 60.004 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 10 1 9 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
	setAttr -s 9 ".kix[5:8]"  0 1 1 1;
	setAttr -s 9 ".kiy[5:8]"  0 0 0 0;
createNode animCurveTA -n "index0_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 50 -0.035810585099988426
		 60 0 60.004 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 10 1 9 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
	setAttr -s 9 ".kix[5:8]"  0 1 1 1;
	setAttr -s 9 ".kiy[5:8]"  0 0 0 0;
createNode animCurveTA -n "index0_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 -22.331481361867631 20 0 30 0 50 -73.933015710847442
		 60 0 60.004 0 80 -73.856270538598366 90 0 100 0;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 10 1 9 1 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
	setAttr -s 10 ".kix[5:9]"  0 0.54290765523910522 1 1 1;
	setAttr -s 10 ".kiy[5:9]"  0 -0.83979243040084839 0 0 0;
createNode animCurveTA -n "index1_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 50 3.2736536643497591
		 60 0 60.004 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 10 1 9 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
	setAttr -s 9 ".kix[5:8]"  0 1 1 1;
	setAttr -s 9 ".kiy[5:8]"  0 0 0 0;
createNode animCurveTA -n "index1_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 50 3.5799167241974517
		 60 0 60.004 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 10 1 9 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
	setAttr -s 9 ".kix[5:8]"  0 1 1 1;
	setAttr -s 9 ".kiy[5:8]"  0 0 0 0;
createNode animCurveTA -n "index1_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 -31.517515934003878 20 0 30 0 50 -73.694163236903179
		 60 0 60.004 0 80 -73.600660552526776 90 0 100 0;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 10 1 9 1 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
	setAttr -s 10 ".kix[5:9]"  0 0.54423528909683228 1 1 1;
	setAttr -s 10 ".kiy[5:9]"  0 -0.83893263339996338 0 0 0;
createNode animCurveTA -n "index2_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 50 4.3302939423440394
		 60 0 60.004 0 69 0 80 4.2734148945057235 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 1 9 1 
		1 10 9;
	setAttr -s 11 ".kot[10]"  9;
	setAttr -s 11 ".kix[5:10]"  0 1 0 1 1 1;
	setAttr -s 11 ".kiy[5:10]"  0 0 0 0 0 0;
createNode animCurveTA -n "index2_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 50 6.1664792660145276
		 60 0 60.004 0 69 0 80 6.8482221948890247 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 1 9 1 
		1 10 9;
	setAttr -s 11 ".kot[10]"  9;
	setAttr -s 11 ".kix[5:10]"  0 1 0 1 1 1;
	setAttr -s 11 ".kiy[5:10]"  0 0 0 0 0 0;
createNode animCurveTA -n "index2_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 -13.627020572592684 20 0 30 0 50 -73.369730401410166
		 60 0 60.004 0 69 0 80 -79.606417509743309 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 1 9 1 
		1 10 9;
	setAttr -s 11 ".kot[10]"  9;
	setAttr -s 11 ".kix[5:10]"  0 1 0 1 1 1;
	setAttr -s 11 ".kiy[5:10]"  0 0 0 0 0 0;
createNode animCurveTA -n "index3_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 50 73.933051777716329
		 60 0 60.004 0 69 0 80 80.20069941768665 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 10 9 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "index3_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 50 0 60 0 60.004 0 69 0
		 80 0 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 10 9 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "index3_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 -19.161841607781788 20 0 30 0 50 0
		 60 0 60.004 0 69 0 80 0 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 10 10 9 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "middle0_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 -0.43803586322875759
		 90 -0.4496329092050057 100 -0.4496329092050057;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "middle0_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 -0.3221580864751013
		 90 -0.37020995423620923 100 -0.37020995423620923;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "middle0_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 -18.975428636387385 30 0 40 0
		 50 -73.930106213274911 69 0 80 -73.85309946599655 90 -73.85309946599655 100 -73.85309946599655;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 1 9 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
	setAttr -s 10 ".kix[5:9]"  0.77351701259613037 0.99999940395355225 
		1 1 1;
	setAttr -s 10 ".kiy[5:9]"  -0.63377547264099121 0.0010752163361757994 
		0 0 0;
createNode animCurveTA -n "middle1_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 1.568166761140229
		 69 0 100 0;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "middle1_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 1.7945618382200073
		 69 0 100 0;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "middle1_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 -49.106580268871006 30 0 40 0
		 50 -73.875555657962238 69 0 80 -73.794937404686436 100 -73.794937404686436;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "middle2_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 0 30 0 40 0 50 1.9387384120197251
		 69 0 80 1.8919410617665895 90 1.8919410617665895 100 1.8919410617665895;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 10 10 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
createNode animCurveTA -n "middle2_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 10 0 20 0 30 0 40 0 50 3.1067392998193548
		 69 0 80 3.436255877703148 90 3.436255877703148 100 3.436255877703148;
	setAttr -s 10 ".kit[0:9]"  10 9 9 9 9 10 10 10 
		10 9;
	setAttr -s 10 ".kot[9]"  9;
createNode animCurveTA -n "middle2_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 -12.636458337632938 30 0 40 0
		 50 -73.802679306063624 69 0 80 -80.064163950611075 100 -80.064163950611075;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "middle3_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 73.933051777716429
		 60 84.182005316257502 69 0 80 80.200699417686536 90 80.200699417686536 100 80.200699417686536;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "middle3_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 0 60 0 69 0 80 0
		 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "middle3_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 0 60 0 69 0 80 0
		 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "pinky0_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -0.4699351811090508
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky0_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -0.39161546120230378
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky0_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 -28.373637890792487
		 50 -73.929276345063769 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky1_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -6.3918531266275611
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky1_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -5.7548207242802416
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky1_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 -62.748093818754739
		 50 -73.181313948226432 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky2_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -6.7107382091250578
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky2_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -10.233210221234501
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky2_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -72.457550692118673
		 80 0 90 0 100 0;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "pinky3_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 73.582453403763537
		 60 84.04681899257406 69 84.04681899257406 80 0 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "pinky3_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 11.621355359479189
		 60 11.946866208377546 69 11.946866208377546 80 0 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "pinky3_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 9.6164156270341774
		 60 11.867904040445048 69 11.867904040445048 80 0 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "ring0_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 0.07835297063267746
		 90 0.080368931373465222 100 0.080368931373465222;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "ring0_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 0.058618957093920801
		 90 0.067283452843121927 100 0.067283452843121927;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "ring0_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 -8.7288764831536305 30 -26.479343652610734
		 40 -10.843896704647781 50 -73.93295618450783 80 -73.93295618450783 90 -73.93295618450783
		 100 -73.93295618450783;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "ring1_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 -1.3224603495050407
		 90 -1.3399360017191317 100 -1.3399360017191317;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "ring1_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 0 40 0 50 -1.2729893723780477
		 90 -1.4389308141225228 100 -1.4389308141225228;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "ring1_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 0 10 0 20 -19.634316836885269 30 -61.467624643786365
		 40 -5.7985881829370989 50 -73.898823096480456 100 -73.898823096480456;
	setAttr -s 7 ".kit[0:6]"  10 9 9 9 9 10 9;
	setAttr -s 7 ".kot[6]"  9;
createNode animCurveTA -n "ring2_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -2.5988230039965701
		 80 -2.5136821417060502 90 -2.5136821417060502 100 -2.5136821417060502;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "ring2_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 10 0 20 0 30 0 40 0 50 -4.5538617086944688
		 80 -5.0226171813765772 90 -5.0226171813765772 100 -5.0226171813765772;
	setAttr -s 9 ".kit[0:8]"  10 9 9 9 9 10 10 10 
		9;
	setAttr -s 9 ".kot[8]"  9;
createNode animCurveTA -n "ring2_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 10 0 20 0 30 -5.6213687964904073 40 0
		 50 -73.670119815479765 80 -79.926762996924552 100 -79.926762996924552;
	setAttr -s 8 ".kit[0:7]"  10 9 9 9 9 10 10 9;
	setAttr -s 8 ".kot[7]"  9;
createNode animCurveTA -n "ring3_rotateX";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 73.9330517777164
		 60 84.182005316257573 69 84.182005316257573 80 80.200699417686664 90 80.200699417686664
		 100 80.200699417686664;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "ring3_rotateY";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 0 60 0 69 0 80 0
		 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode animCurveTA -n "ring3_rotateZ";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 10 0 20 0 30 0 40 0 50 0 60 0 69 0 80 0
		 90 0 100 0;
	setAttr -s 11 ".kit[0:10]"  10 9 9 9 9 10 10 10 
		10 10 9;
	setAttr -s 11 ".kot[10]"  9;
createNode surfaceShader -n "surfaceShader1";
createNode shadingEngine -n "surfaceShader1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode ramp -n "ramp1";
	setAttr ".t" 7;
	setAttr -s 3 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 1 0 0 ;
	setAttr ".cel[1].ep" 0.5;
	setAttr ".cel[1].ec" -type "float3" 0 1 0 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 0 0 1 ;
createNode place2dTexture -n "place2dTexture4";
createNode checker -n "checker1";
createNode place2dTexture -n "place2dTexture5";
	setAttr ".re" -type "float2" 16 16 ;
createNode blendColors -n "blendColors1";
createNode mentalrayItemsList -s -n "mentalrayItemsList";
createNode mentalrayGlobals -s -n "mentalrayGlobals";
createNode mentalrayOptions -s -n "miDefaultOptions";
	addAttr -ci true -m -sn "stringOptions" -ln "stringOptions" -at "compound" -nc 
		3;
	addAttr -ci true -sn "name" -ln "name" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "value" -ln "value" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "type" -ln "type" -dt "string" -p "stringOptions";
	setAttr -s 45 ".stringOptions";
	setAttr ".stringOptions[0].name" -type "string" "rast motion factor";
	setAttr ".stringOptions[0].value" -type "string" "1.0";
	setAttr ".stringOptions[0].type" -type "string" "scalar";
	setAttr ".stringOptions[1].name" -type "string" "rast transparency depth";
	setAttr ".stringOptions[1].value" -type "string" "8";
	setAttr ".stringOptions[1].type" -type "string" "integer";
	setAttr ".stringOptions[2].name" -type "string" "rast useopacity";
	setAttr ".stringOptions[2].value" -type "string" "true";
	setAttr ".stringOptions[2].type" -type "string" "boolean";
	setAttr ".stringOptions[3].name" -type "string" "importon";
	setAttr ".stringOptions[3].value" -type "string" "false";
	setAttr ".stringOptions[3].type" -type "string" "boolean";
	setAttr ".stringOptions[4].name" -type "string" "importon density";
	setAttr ".stringOptions[4].value" -type "string" "1.0";
	setAttr ".stringOptions[4].type" -type "string" "scalar";
	setAttr ".stringOptions[5].name" -type "string" "importon merge";
	setAttr ".stringOptions[5].value" -type "string" "0.0";
	setAttr ".stringOptions[5].type" -type "string" "scalar";
	setAttr ".stringOptions[6].name" -type "string" "importon trace depth";
	setAttr ".stringOptions[6].value" -type "string" "0";
	setAttr ".stringOptions[6].type" -type "string" "integer";
	setAttr ".stringOptions[7].name" -type "string" "importon traverse";
	setAttr ".stringOptions[7].value" -type "string" "true";
	setAttr ".stringOptions[7].type" -type "string" "boolean";
	setAttr ".stringOptions[8].name" -type "string" "shadowmap pixel samples";
	setAttr ".stringOptions[8].value" -type "string" "3";
	setAttr ".stringOptions[8].type" -type "string" "integer";
	setAttr ".stringOptions[9].name" -type "string" "ambient occlusion";
	setAttr ".stringOptions[9].value" -type "string" "false";
	setAttr ".stringOptions[9].type" -type "string" "boolean";
	setAttr ".stringOptions[10].name" -type "string" "ambient occlusion rays";
	setAttr ".stringOptions[10].value" -type "string" "256";
	setAttr ".stringOptions[10].type" -type "string" "integer";
	setAttr ".stringOptions[11].name" -type "string" "ambient occlusion cache";
	setAttr ".stringOptions[11].value" -type "string" "false";
	setAttr ".stringOptions[11].type" -type "string" "boolean";
	setAttr ".stringOptions[12].name" -type "string" "ambient occlusion cache density";
	setAttr ".stringOptions[12].value" -type "string" "1.0";
	setAttr ".stringOptions[12].type" -type "string" "scalar";
	setAttr ".stringOptions[13].name" -type "string" "ambient occlusion cache points";
	setAttr ".stringOptions[13].value" -type "string" "64";
	setAttr ".stringOptions[13].type" -type "string" "integer";
	setAttr ".stringOptions[14].name" -type "string" "irradiance particles";
	setAttr ".stringOptions[14].value" -type "string" "false";
	setAttr ".stringOptions[14].type" -type "string" "boolean";
	setAttr ".stringOptions[15].name" -type "string" "irradiance particles rays";
	setAttr ".stringOptions[15].value" -type "string" "256";
	setAttr ".stringOptions[15].type" -type "string" "integer";
	setAttr ".stringOptions[16].name" -type "string" "irradiance particles interpolate";
	setAttr ".stringOptions[16].value" -type "string" "1";
	setAttr ".stringOptions[16].type" -type "string" "integer";
	setAttr ".stringOptions[17].name" -type "string" "irradiance particles interppoints";
	setAttr ".stringOptions[17].value" -type "string" "64";
	setAttr ".stringOptions[17].type" -type "string" "integer";
	setAttr ".stringOptions[18].name" -type "string" "irradiance particles indirect passes";
	setAttr ".stringOptions[18].value" -type "string" "0";
	setAttr ".stringOptions[18].type" -type "string" "integer";
	setAttr ".stringOptions[19].name" -type "string" "irradiance particles scale";
	setAttr ".stringOptions[19].value" -type "string" "1.0";
	setAttr ".stringOptions[19].type" -type "string" "scalar";
	setAttr ".stringOptions[20].name" -type "string" "irradiance particles env";
	setAttr ".stringOptions[20].value" -type "string" "true";
	setAttr ".stringOptions[20].type" -type "string" "boolean";
	setAttr ".stringOptions[21].name" -type "string" "irradiance particles env rays";
	setAttr ".stringOptions[21].value" -type "string" "256";
	setAttr ".stringOptions[21].type" -type "string" "integer";
	setAttr ".stringOptions[22].name" -type "string" "irradiance particles env scale";
	setAttr ".stringOptions[22].value" -type "string" "1";
	setAttr ".stringOptions[22].type" -type "string" "integer";
	setAttr ".stringOptions[23].name" -type "string" "irradiance particles rebuild";
	setAttr ".stringOptions[23].value" -type "string" "true";
	setAttr ".stringOptions[23].type" -type "string" "boolean";
	setAttr ".stringOptions[24].name" -type "string" "irradiance particles file";
	setAttr ".stringOptions[24].value" -type "string" "";
	setAttr ".stringOptions[24].type" -type "string" "string";
	setAttr ".stringOptions[25].name" -type "string" "geom displace motion factor";
	setAttr ".stringOptions[25].value" -type "string" "1.0";
	setAttr ".stringOptions[25].type" -type "string" "scalar";
	setAttr ".stringOptions[26].name" -type "string" "contrast all buffers";
	setAttr ".stringOptions[26].value" -type "string" "true";
	setAttr ".stringOptions[26].type" -type "string" "boolean";
	setAttr ".stringOptions[27].name" -type "string" "finalgather normal tolerance";
	setAttr ".stringOptions[27].value" -type "string" "25.842";
	setAttr ".stringOptions[27].type" -type "string" "scalar";
	setAttr ".stringOptions[28].name" -type "string" "trace camera clip";
	setAttr ".stringOptions[28].value" -type "string" "false";
	setAttr ".stringOptions[28].type" -type "string" "boolean";
	setAttr ".stringOptions[29].name" -type "string" "unified sampling";
	setAttr ".stringOptions[29].value" -type "string" "true";
	setAttr ".stringOptions[29].type" -type "string" "boolean";
	setAttr ".stringOptions[30].name" -type "string" "samples quality";
	setAttr ".stringOptions[30].value" -type "string" "0.25 0.25 0.25 0.25";
	setAttr ".stringOptions[30].type" -type "string" "color";
	setAttr ".stringOptions[31].name" -type "string" "samples min";
	setAttr ".stringOptions[31].value" -type "string" "1.0";
	setAttr ".stringOptions[31].type" -type "string" "scalar";
	setAttr ".stringOptions[32].name" -type "string" "samples max";
	setAttr ".stringOptions[32].value" -type "string" "100.0";
	setAttr ".stringOptions[32].type" -type "string" "scalar";
	setAttr ".stringOptions[33].name" -type "string" "samples error cutoff";
	setAttr ".stringOptions[33].value" -type "string" "0.0 0.0 0.0 0.0";
	setAttr ".stringOptions[33].type" -type "string" "color";
	setAttr ".stringOptions[34].name" -type "string" "samples per object";
	setAttr ".stringOptions[34].value" -type "string" "false";
	setAttr ".stringOptions[34].type" -type "string" "boolean";
	setAttr ".stringOptions[35].name" -type "string" "progressive";
	setAttr ".stringOptions[35].value" -type "string" "false";
	setAttr ".stringOptions[35].type" -type "string" "boolean";
	setAttr ".stringOptions[36].name" -type "string" "progressive max time";
	setAttr ".stringOptions[36].value" -type "string" "0";
	setAttr ".stringOptions[36].type" -type "string" "integer";
	setAttr ".stringOptions[37].name" -type "string" "progressive subsampling size";
	setAttr ".stringOptions[37].value" -type "string" "1";
	setAttr ".stringOptions[37].type" -type "string" "integer";
	setAttr ".stringOptions[38].name" -type "string" "iray";
	setAttr ".stringOptions[38].value" -type "string" "false";
	setAttr ".stringOptions[38].type" -type "string" "boolean";
	setAttr ".stringOptions[39].name" -type "string" "light relative scale";
	setAttr ".stringOptions[39].value" -type "string" "0.31831";
	setAttr ".stringOptions[39].type" -type "string" "scalar";
	setAttr ".stringOptions[40].name" -type "string" "trace camera motion vectors";
	setAttr ".stringOptions[40].value" -type "string" "false";
	setAttr ".stringOptions[40].type" -type "string" "boolean";
	setAttr ".stringOptions[41].name" -type "string" "ray differentials";
	setAttr ".stringOptions[41].value" -type "string" "true";
	setAttr ".stringOptions[41].type" -type "string" "boolean";
	setAttr ".stringOptions[42].name" -type "string" "environment lighting mode";
	setAttr ".stringOptions[42].value" -type "string" "off";
	setAttr ".stringOptions[42].type" -type "string" "string";
	setAttr ".stringOptions[43].name" -type "string" "environment lighting quality";
	setAttr ".stringOptions[43].value" -type "string" "0.167";
	setAttr ".stringOptions[43].type" -type "string" "scalar";
	setAttr ".stringOptions[44].name" -type "string" "environment lighting shadow";
	setAttr ".stringOptions[44].value" -type "string" "transparent";
	setAttr ".stringOptions[44].type" -type "string" "string";
createNode mentalrayFramebuffer -s -n "miDefaultFramebuffer";
createNode displayLayer -n "skeleton";
	setAttr ".do" 1;
createNode displayLayer -n "mesh";
	setAttr ".do" 2;
createNode skinCluster -n "skinCluster1";
	setAttr -s 152 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr ".wl[7].w[0]"  1;
	setAttr ".wl[8].w[0]"  1;
	setAttr ".wl[9].w[0]"  1;
	setAttr ".wl[10].w[0]"  1;
	setAttr ".wl[11].w[0]"  1;
	setAttr ".wl[12].w[0]"  1;
	setAttr ".wl[13].w[0]"  1;
	setAttr ".wl[14].w[0]"  1;
	setAttr ".wl[15].w[0]"  1;
	setAttr ".wl[16].w[0]"  1;
	setAttr ".wl[17].w[0]"  1;
	setAttr ".wl[18].w[0]"  1;
	setAttr ".wl[19].w[0]"  1;
	setAttr ".wl[20].w[0]"  1;
	setAttr ".wl[21].w[0]"  1;
	setAttr ".wl[22].w[0]"  1;
	setAttr ".wl[23].w[0]"  1;
	setAttr ".wl[24].w[0]"  1;
	setAttr ".wl[25].w[0]"  1;
	setAttr ".wl[26].w[0]"  1;
	setAttr ".wl[27].w[0]"  1;
	setAttr ".wl[28].w[0]"  1;
	setAttr ".wl[29].w[0]"  1;
	setAttr ".wl[30].w[0]"  1;
	setAttr ".wl[31].w[0]"  1;
	setAttr ".wl[32].w[0]"  1;
	setAttr ".wl[33].w[0]"  1;
	setAttr ".wl[34].w[0]"  1;
	setAttr ".wl[35].w[0]"  1;
	setAttr ".wl[36].w[0]"  1;
	setAttr ".wl[37].w[0]"  1;
	setAttr ".wl[38].w[0]"  1;
	setAttr ".wl[39].w[0]"  1;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr ".wl[43].w[0]"  1;
	setAttr ".wl[44].w[0]"  1;
	setAttr ".wl[45].w[0]"  1;
	setAttr ".wl[46].w[0]"  1;
	setAttr ".wl[47].w[0]"  1;
	setAttr ".wl[48].w[0]"  1;
	setAttr ".wl[49].w[0]"  1;
	setAttr ".wl[50].w[0]"  1;
	setAttr ".wl[51].w[0]"  1;
	setAttr ".wl[52].w[0]"  1;
	setAttr ".wl[53].w[0]"  1;
	setAttr ".wl[54].w[0]"  1;
	setAttr ".wl[55].w[0]"  1;
	setAttr ".wl[56].w[0]"  1;
	setAttr ".wl[57].w[0]"  1;
	setAttr ".wl[58].w[0]"  1;
	setAttr ".wl[59].w[0]"  1;
	setAttr ".wl[60].w[0]"  1;
	setAttr ".wl[61].w[0]"  1;
	setAttr ".wl[62].w[0]"  1;
	setAttr ".wl[63].w[0]"  1;
	setAttr ".wl[64].w[0]"  1;
	setAttr ".wl[65].w[0]"  1;
	setAttr ".wl[66].w[0]"  1;
	setAttr ".wl[67].w[0]"  1;
	setAttr ".wl[68].w[0]"  1;
	setAttr ".wl[69].w[0]"  1;
	setAttr ".wl[70].w[0]"  1;
	setAttr ".wl[71].w[0]"  1;
	setAttr ".wl[72].w[0]"  1;
	setAttr ".wl[73].w[0]"  1;
	setAttr ".wl[74].w[0]"  1;
	setAttr ".wl[75].w[0]"  1;
	setAttr ".wl[76].w[0]"  1;
	setAttr ".wl[77].w[0]"  1;
	setAttr ".wl[78].w[0]"  1;
	setAttr ".wl[79].w[0]"  1;
	setAttr ".wl[80].w[0]"  1;
	setAttr ".wl[81].w[0]"  1;
	setAttr ".wl[82].w[0]"  1;
	setAttr ".wl[83].w[0]"  1;
	setAttr ".wl[84].w[0]"  1;
	setAttr ".wl[85].w[0]"  1;
	setAttr ".wl[86].w[0]"  1;
	setAttr ".wl[87].w[0]"  1;
	setAttr ".wl[88].w[0]"  1;
	setAttr ".wl[89].w[0]"  1;
	setAttr ".wl[90].w[0]"  1;
	setAttr ".wl[91].w[0]"  1;
	setAttr ".wl[92].w[0]"  1;
	setAttr ".wl[93].w[0]"  1;
	setAttr ".wl[94].w[0]"  1;
	setAttr ".wl[95].w[0]"  1;
	setAttr ".wl[96].w[0]"  1;
	setAttr ".wl[97].w[0]"  1;
	setAttr ".wl[98].w[0]"  1;
	setAttr ".wl[99].w[0]"  1;
	setAttr ".wl[100].w[0]"  1;
	setAttr ".wl[101].w[0]"  1;
	setAttr ".wl[102].w[0]"  1;
	setAttr ".wl[103].w[0]"  1;
	setAttr ".wl[104].w[0]"  1;
	setAttr ".wl[105].w[0]"  1;
	setAttr ".wl[106].w[0]"  1;
	setAttr ".wl[107].w[0]"  1;
	setAttr ".wl[108].w[0]"  1;
	setAttr ".wl[109].w[0]"  1;
	setAttr ".wl[110].w[0]"  1;
	setAttr ".wl[111].w[0]"  1;
	setAttr ".wl[112].w[0]"  1;
	setAttr ".wl[113].w[0]"  1;
	setAttr ".wl[114].w[0]"  1;
	setAttr ".wl[115].w[0]"  1;
	setAttr ".wl[116].w[0]"  1;
	setAttr ".wl[117].w[0]"  1;
	setAttr ".wl[118].w[0]"  1;
	setAttr ".wl[119].w[0]"  1;
	setAttr ".wl[120].w[0]"  1;
	setAttr ".wl[121].w[0]"  1;
	setAttr ".wl[122].w[0]"  1;
	setAttr ".wl[123].w[0]"  1;
	setAttr ".wl[124].w[0]"  1;
	setAttr ".wl[125].w[0]"  1;
	setAttr ".wl[126].w[0]"  1;
	setAttr ".wl[127].w[0]"  1;
	setAttr ".wl[128].w[0]"  1;
	setAttr ".wl[129].w[0]"  1;
	setAttr ".wl[130].w[0]"  1;
	setAttr ".wl[131].w[0]"  1;
	setAttr ".wl[132].w[0]"  1;
	setAttr ".wl[133].w[0]"  1;
	setAttr ".wl[134].w[0]"  1;
	setAttr ".wl[135].w[0]"  1;
	setAttr ".wl[136].w[0]"  1;
	setAttr ".wl[137].w[0]"  1;
	setAttr ".wl[138].w[0]"  1;
	setAttr ".wl[139].w[0]"  1;
	setAttr ".wl[140].w[0]"  1;
	setAttr ".wl[141].w[0]"  1;
	setAttr ".wl[142].w[0]"  1;
	setAttr ".wl[143].w[0]"  1;
	setAttr ".wl[144].w[0]"  1;
	setAttr ".wl[145].w[0]"  1;
	setAttr ".wl[146].w[0]"  1;
	setAttr ".wl[147].w[0]"  1;
	setAttr ".wl[148].w[0]"  1;
	setAttr ".wl[149].w[0]"  1;
	setAttr ".wl[150].w[0]"  1;
	setAttr ".wl[151].w[0]"  1;
	setAttr ".pm[0]" -type "matrix" -0.67728063612412592 0.033420956500576054 -0.73496529142394595 -0
		 0.049285833269673673 0.99878471486047182 -1.5612511283791261e-016 -0 0.73407209902720949 -0.036223376812117833 -0.67810472672155464 -0
		 0.32982201455776367 -0.10540503156560241 -0.28744054354975201 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".dpf[0]"  4;
	setAttr ".mmi" yes;
	setAttr ".mi" 1;
	setAttr ".ucm" yes;
createNode tweak -n "tweak1";
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId77";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.015645977945217826
		 0.089021381578947373 -0.44084605594059406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.022579723962865207 -0.91571967294939016 0.0098893192649908198 0.40106089064342565 1
		 1 1 yes;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster2";
	setAttr -s 240 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr ".wl[7].w[0]"  1;
	setAttr ".wl[8].w[0]"  1;
	setAttr ".wl[9].w[0]"  1;
	setAttr -s 3 ".wl[10].w[0:2]"  0.91170555353164673 0.085831036048315906 
		0.0024634104200373613;
	setAttr -s 3 ".wl[11].w[0:2]"  0.98235899209976196 0.017312708411809159 
		0.00032829948842887845;
	setAttr -s 3 ".wl[12].w[0:2]"  0.99907094240188599 0.00091528543667297583 
		1.3772161441037853e-005;
	setAttr -s 3 ".wl[13].w[0:2]"  0.99341744184494019 0.0064793154965500175 
		0.00010324265850979727;
	setAttr -s 3 ".wl[14].w[0:2]"  0.94143569469451904 0.057317912121266086 
		0.0012463931842148733;
	setAttr -s 3 ".wl[15].w[0:2]"  0.9592166543006897 0.039982679326937887 
		0.00080066637237241416;
	setAttr -s 3 ".wl[16].w[0:2]"  0.99757200479507446 0.0023918281071739801 
		3.6167097751557081e-005;
	setAttr -s 3 ".wl[17].w[0:2]"  0.99998992681503296 9.9305414454201287e-006 
		1.4264352162088616e-007;
	setAttr -s 3 ".wl[18].w[0:2]"  0.99032145738601685 0.0095105687563100585 
		0.00016797385767309652;
	setAttr -s 3 ".wl[19].w[0:2]"  0.93321597576141357 0.065106150023180029 
		0.0016778742154063902;
	setAttr -s 3 ".wl[20].w[0:2]"  0.96974396705627441 0.028817171939299283 
		0.001438861004426302;
	setAttr -s 3 ".wl[21].w[0:2]"  0.99579000473022461 0.0040468603061559697 
		0.00016313496361942061;
	setAttr -s 3 ".wl[22].w[0:2]"  0.99987012147903442 0.0001253594177046057 
		4.5191032609704753e-006;
	setAttr -s 3 ".wl[23].w[0:2]"  0.99835097789764404 0.0015904665696437512 
		5.8555532712205746e-005;
	setAttr -s 3 ".wl[24].w[0:2]"  0.98046910762786865 0.018733181455806408 
		0.00079771091632493865;
	setAttr -s 3 ".wl[25].w[0:2]"  0.98643547296524048 0.01303178270028074 
		0.00053274433447878075;
	setAttr -s 3 ".wl[26].w[0:2]"  0.99925011396408081 0.00072386893890105013 
		2.601709701813935e-005;
	setAttr -s 3 ".wl[27].w[0:2]"  0.99999713897705078 2.763527346732876e-006 
		9.7495602485873888e-008;
	setAttr -s 3 ".wl[28].w[0:2]"  0.99756276607513428 0.0023459285865948276 
		9.1305338270895257e-005;
	setAttr -s 3 ".wl[29].w[0:2]"  0.97785282135009766 0.021151242188631614 
		0.00099593646127073103;
	setAttr -s 3 ".wl[30].w[0:2]"  0.9877704381942749 0.01135923015416446 
		0.00087033165156063673;
	setAttr -s 3 ".wl[31].w[0:2]"  0.99869632720947266 0.0012211412405463264 
		8.2531549981017406e-005;
	setAttr -s 3 ".wl[32].w[0:2]"  0.99998700618743896 1.2219471059806658e-005 
		7.7434150122849881e-007;
	setAttr -s 3 ".wl[33].w[0:2]"  0.99943721294403076 0.00052897156073820927 
		3.3815495231028963e-005;
	setAttr -s 3 ".wl[34].w[0:2]"  0.99170458316802979 0.0077585297105659421 
		0.00053688712140427259;
	setAttr -s 3 ".wl[35].w[0:2]"  0.99379456043243408 0.0058121140265534263 
		0.00039332554101249162;
	setAttr -s 3 ".wl[36].w[0:2]"  0.99961459636688232 0.00036251656070621086 
		2.2887072411464923e-005;
	setAttr -s 3 ".wl[37].w[0:2]"  0.99999523162841797 4.4872398357703974e-006 
		2.8113174626085238e-007;
	setAttr -s 3 ".wl[38].w[0:2]"  0.99906158447265625 0.00088008935198093346 
		5.8326175362816564e-005;
	setAttr -s 3 ".wl[39].w[0:2]"  0.9906657338142395 0.0086910985911688339 
		0.00064316759459166393;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr ".wl[43].w[0]"  1;
	setAttr ".wl[44].w[0]"  1;
	setAttr ".wl[45].w[0]"  1;
	setAttr ".wl[46].w[0]"  1;
	setAttr ".wl[47].w[0]"  1;
	setAttr ".wl[48].w[0]"  1;
	setAttr ".wl[49].w[0]"  1;
	setAttr ".wl[50].w[0]"  1;
	setAttr ".wl[51].w[0]"  1;
	setAttr ".wl[52].w[0]"  1;
	setAttr ".wl[53].w[0]"  1;
	setAttr ".wl[54].w[0]"  1;
	setAttr ".wl[55].w[0]"  1;
	setAttr ".wl[56].w[0]"  1;
	setAttr ".wl[57].w[0]"  1;
	setAttr ".wl[58].w[0]"  1;
	setAttr ".wl[59].w[0]"  1;
	setAttr -s 3 ".wl[60].w[0:2]"  0.99969947338104248 0.00027534049221930416 
		2.518612673821535e-005;
	setAttr -s 3 ".wl[61].w[0:2]"  0.99974501132951776 0.00023307427031044132 
		2.1914400171791104e-005;
	setAttr -s 3 ".wl[62].w[0:2]"  0.99613064527511597 0.0035070889473026146 
		0.00036226577758141859;
	setAttr -s 3 ".wl[63].w[0:2]"  0.99482178688049316 0.0047000311721452507 
		0.00047818194736158528;
	setAttr -s 3 ".wl[64].w[0:2]"  0.99567681550979614 0.0039139739963965775 
		0.00040921049380727997;
	setAttr -s 3 ".wl[65].w[0:2]"  0.99378287792205811 0.0056309393820977533 
		0.00058618269584414118;
	setAttr -s 3 ".wl[66].w[0:2]"  0.99953931570053101 0.00041961898761791542 
		4.1065311851078713e-005;
	setAttr -s 3 ".wl[67].w[0:2]"  0.99945873022079468 0.00049395022463408439 
		4.7319554571237841e-005;
	setAttr -s 3 ".wl[68].w[0:2]"  0.99945259094238281 0.00050009441618834667 
		4.7314641428840843e-005;
	setAttr -s 3 ".wl[69].w[0:2]"  0.99952036142349243 0.00043712571716617975 
		4.2512859341388625e-005;
	setAttr ".wl[70].w[0]"  1;
	setAttr -s 3 ".wl[71].w[0:2]"  0.99999958276748657 3.8215334492184652e-007 
		3.5079168505887867e-008;
	setAttr -s 3 ".wl[72].w[0:2]"  0.99998581409454346 1.300071998228966e-005 
		1.1851854742533092e-006;
	setAttr -s 3 ".wl[73].w[0:2]"  0.99999505281448364 4.5232965057915827e-006 
		4.2388901056583932e-007;
	setAttr -s 3 ".wl[74].w[0:2]"  0.99544554948806763 0.0041524054416896073 
		0.00040204507024276594;
	setAttr -s 3 ".wl[75].w[0:2]"  0.99973136186599731 0.0002459715980602993 
		2.2666535942386241e-005;
	setAttr -s 3 ".wl[76].w[0:2]"  0.99619132280349731 0.0034766528061673635 
		0.00033202439033532184;
	setAttr -s 3 ".wl[77].w[0:2]"  0.99977213144302368 0.00020822257223479114 
		1.9645984741527209e-005;
	setAttr -s 3 ".wl[78].w[0:2]"  0.99691694974899292 0.0028078559407706352 
		0.0002751943102364448;
	setAttr -s 3 ".wl[79].w[0:2]"  0.99723130464553833 0.0025231347134790374 
		0.00024556064098263261;
	setAttr ".wl[80].w[1]"  1;
	setAttr ".wl[81].w[1]"  1;
	setAttr ".wl[82].w[1]"  1;
	setAttr ".wl[83].w[1]"  1;
	setAttr ".wl[84].w[1]"  1;
	setAttr ".wl[85].w[1]"  1;
	setAttr ".wl[86].w[1]"  1;
	setAttr ".wl[87].w[1]"  1;
	setAttr ".wl[88].w[1]"  1;
	setAttr ".wl[89].w[1]"  1;
	setAttr ".wl[90].w[1]"  1;
	setAttr ".wl[91].w[1]"  1;
	setAttr ".wl[92].w[1]"  1;
	setAttr ".wl[93].w[1]"  1;
	setAttr ".wl[94].w[1]"  1;
	setAttr ".wl[95].w[1]"  1;
	setAttr ".wl[96].w[1]"  1;
	setAttr ".wl[97].w[1]"  1;
	setAttr ".wl[98].w[1]"  1;
	setAttr ".wl[99].w[1]"  1;
	setAttr ".wl[100].w[1]"  1;
	setAttr ".wl[101].w[1]"  1;
	setAttr ".wl[102].w[1]"  1;
	setAttr ".wl[103].w[1]"  1;
	setAttr ".wl[104].w[1]"  1;
	setAttr ".wl[105].w[1]"  1;
	setAttr ".wl[106].w[1]"  1;
	setAttr ".wl[107].w[1]"  1;
	setAttr ".wl[108].w[1]"  1;
	setAttr ".wl[109].w[1]"  1;
	setAttr ".wl[110].w[1]"  1;
	setAttr ".wl[111].w[1]"  1;
	setAttr ".wl[112].w[1]"  1;
	setAttr ".wl[113].w[1]"  1;
	setAttr ".wl[114].w[1]"  1;
	setAttr ".wl[115].w[1]"  1;
	setAttr ".wl[116].w[1]"  1;
	setAttr ".wl[117].w[1]"  1;
	setAttr ".wl[118].w[1]"  1;
	setAttr ".wl[119].w[1]"  1;
	setAttr ".wl[120].w[1]"  1;
	setAttr ".wl[121].w[1]"  1;
	setAttr ".wl[122].w[1]"  1;
	setAttr ".wl[123].w[1]"  1;
	setAttr ".wl[124].w[1]"  1;
	setAttr ".wl[125].w[1]"  1;
	setAttr ".wl[126].w[1]"  1;
	setAttr ".wl[127].w[1]"  1;
	setAttr ".wl[128].w[1]"  1;
	setAttr ".wl[129].w[1]"  1;
	setAttr ".wl[130].w[1]"  1;
	setAttr ".wl[131].w[1]"  1;
	setAttr ".wl[132].w[1]"  1;
	setAttr ".wl[133].w[1]"  1;
	setAttr ".wl[134].w[1]"  1;
	setAttr ".wl[135].w[1]"  1;
	setAttr ".wl[136].w[1]"  1;
	setAttr ".wl[137].w[1]"  1;
	setAttr ".wl[138].w[1]"  1;
	setAttr ".wl[139].w[1]"  1;
	setAttr ".wl[140].w[1]"  1;
	setAttr ".wl[141].w[1]"  1;
	setAttr ".wl[142].w[1]"  1;
	setAttr ".wl[143].w[1]"  1;
	setAttr ".wl[144].w[1]"  1;
	setAttr ".wl[145].w[1]"  1;
	setAttr ".wl[146].w[1]"  1;
	setAttr ".wl[147].w[1]"  1;
	setAttr ".wl[148].w[1]"  1;
	setAttr ".wl[149].w[1]"  1;
	setAttr ".wl[150].w[1]"  1;
	setAttr ".wl[151].w[1]"  1;
	setAttr ".wl[152].w[1]"  1;
	setAttr ".wl[153].w[1]"  1;
	setAttr ".wl[154].w[1]"  1;
	setAttr ".wl[155].w[1]"  1;
	setAttr ".wl[156].w[1]"  1;
	setAttr ".wl[157].w[1]"  1;
	setAttr ".wl[158].w[1]"  1;
	setAttr ".wl[159].w[1]"  1;
	setAttr ".wl[160].w[2]"  1;
	setAttr ".wl[161].w[2]"  1;
	setAttr ".wl[162].w[2]"  1;
	setAttr ".wl[163].w[2]"  1;
	setAttr ".wl[164].w[2]"  1;
	setAttr ".wl[165].w[2]"  1;
	setAttr ".wl[166].w[2]"  1;
	setAttr ".wl[167].w[2]"  1;
	setAttr ".wl[168].w[2]"  1;
	setAttr ".wl[169].w[2]"  1;
	setAttr ".wl[170].w[2]"  1;
	setAttr ".wl[171].w[2]"  1;
	setAttr ".wl[172].w[2]"  1;
	setAttr ".wl[173].w[2]"  1;
	setAttr ".wl[174].w[2]"  1;
	setAttr ".wl[175].w[2]"  1;
	setAttr ".wl[176].w[2]"  1;
	setAttr ".wl[177].w[2]"  1;
	setAttr ".wl[178].w[2]"  1;
	setAttr ".wl[179].w[2]"  1;
	setAttr ".wl[180].w[2]"  1;
	setAttr ".wl[181].w[2]"  1;
	setAttr ".wl[182].w[2]"  1;
	setAttr ".wl[183].w[2]"  1;
	setAttr ".wl[184].w[2]"  1;
	setAttr ".wl[185].w[2]"  1;
	setAttr ".wl[186].w[2]"  1;
	setAttr ".wl[187].w[2]"  1;
	setAttr ".wl[188].w[2]"  1;
	setAttr ".wl[189].w[2]"  1;
	setAttr ".wl[190].w[2]"  1;
	setAttr ".wl[191].w[2]"  1;
	setAttr ".wl[192].w[2]"  1;
	setAttr ".wl[193].w[2]"  1;
	setAttr ".wl[194].w[2]"  1;
	setAttr ".wl[195].w[2]"  1;
	setAttr ".wl[196].w[2]"  1;
	setAttr ".wl[197].w[2]"  1;
	setAttr ".wl[198].w[2]"  1;
	setAttr ".wl[199].w[2]"  1;
	setAttr -s 3 ".wl[200].w[0:2]"  0.00054223871665778835 0.025888500958715876 
		0.97356926032462632;
	setAttr -s 3 ".wl[201].w[0:2]"  0.00038947867951522969 0.018925801836450762 
		0.98068471948403402;
	setAttr -s 3 ".wl[202].w[0:2]"  4.9494811808374698e-005 0.0030513937598143502 
		0.99689911142837728;
	setAttr -s 3 ".wl[203].w[0:2]"  4.1039783080679922e-005 0.0024609852911608231 
		0.99749797492575853;
	setAttr -s 3 ".wl[204].w[0:2]"  0.00051888171490632978 0.028499961967107156 
		0.97098115631798654;
	setAttr -s 3 ".wl[205].w[0:2]"  0.00037738242542512617 0.020968746253130902 
		0.97865387132144399;
	setAttr ".wl[206].w[2]"  1;
	setAttr ".wl[207].w[2]"  1;
	setAttr ".wl[208].w[2]"  1;
	setAttr ".wl[209].w[2]"  1;
	setAttr ".wl[210].w[2]"  1;
	setAttr ".wl[211].w[2]"  1;
	setAttr ".wl[212].w[2]"  1;
	setAttr ".wl[213].w[2]"  1;
	setAttr -s 3 ".wl[214].w[0:2]"  4.0215262349403378e-005 0.0026142407497524952 
		0.99734554398789821;
	setAttr -s 3 ".wl[215].w[0:2]"  4.7601317022580761e-005 0.003178988580074274 
		0.9967734101029031;
	setAttr ".wl[216].w[2]"  1;
	setAttr ".wl[217].w[2]"  1;
	setAttr -s 3 ".wl[218].w[0:2]"  6.2758695169522921e-007 4.252714183748877e-005 
		0.99995684527121076;
	setAttr -s 3 ".wl[219].w[0:2]"  2.1625332452207239e-006 0.00015060617151694273 
		0.99984723129523778;
	setAttr ".wl[220].w[2]"  1;
	setAttr ".wl[221].w[2]"  1;
	setAttr ".wl[222].w[2]"  1;
	setAttr ".wl[223].w[2]"  1;
	setAttr ".wl[224].w[2]"  1;
	setAttr ".wl[225].w[2]"  1;
	setAttr ".wl[226].w[2]"  1;
	setAttr ".wl[227].w[2]"  1;
	setAttr ".wl[228].w[2]"  1;
	setAttr ".wl[229].w[2]"  1;
	setAttr ".wl[230].w[2]"  1;
	setAttr ".wl[231].w[2]"  1;
	setAttr ".wl[232].w[2]"  1;
	setAttr ".wl[233].w[2]"  1;
	setAttr ".wl[234].w[2]"  1;
	setAttr ".wl[235].w[2]"  1;
	setAttr ".wl[236].w[2]"  1;
	setAttr ".wl[237].w[2]"  1;
	setAttr ".wl[238].w[2]"  1;
	setAttr ".wl[239].w[2]"  1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.008866168199901131 -0.00044000133933507537 -0.99996059795387526 0
		 -0.04956600212875216 0.99877085031200852 4.4054928975689725e-014 0 0.99873149669689665 0.049564049126850453 -0.0088770794593465933 -0
		 0.074805601145429515 -0.11036484850156428 0.42875259149764178 1;
	setAttr ".pm[1]" -type "matrix" -0.12402689021420538 -0.011727514255339695 -0.9922095524198421 0
		 -0.094136328422531015 0.99555931599836123 2.2792531750859253e-014 0 0.98780346333413827 0.093402964290569615 -0.12458011112057869 -0
		 -0.31514515740836729 -0.12197964957335242 0.46956055395867408 1;
	setAttr ".pm[2]" -type "matrix" -0.16569870383128718 -0.062133734505570554 -0.98421711963622238 0
		 -0.35110719473290564 0.93633526997907612 1.8041124150158786e-016 0 0.92155720243261108 0.34556571188357477 -0.17696514180758124 -0
		 -0.57925717288224143 -0.28073189952245076 0.50422108616125716 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  4 4 4;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode tweak -n "tweak2";
createNode objectSet -n "skinCluster2Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster2GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster2GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId80";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose2";
	setAttr -s 4 ".wm";
	setAttr ".wm[0]" -type "matrix" -0.67728063612412615 0.04928583326967368 0.73407209902720949 0
		 0.033420956500576061 0.99878471486047182 -0.036223376812117833 0 -0.73496529142394607 -1.5265566588595902e-016 -0.67810472672155453 0
		 0.015645977945217826 0.089021381578947373 -0.44084605594059406 1;
	setAttr ".wm[1]" -type "matrix" -0.0088661681999010478 -0.049566002128752146 0.99873149669689698 0
		 -0.00044000133933507629 0.99877085031200852 0.049564049126850473 0 -0.99996059795387593 4.4059887472634543e-014 -0.0088770794593466817 0
		 0.42935037612914967 0.1139370081680614 -0.065434510397151591 1;
	setAttr ".wm[2]" -type "matrix" -0.12402689021420539 -0.094136328422531029 0.98780346333413871 0
		 -0.0117275142553397 0.99555931599836156 0.093402964290569684 0 -0.99220955241984277 2.2793440126440225e-014 -0.12458011112057883 0
		 0.42538547515869063 0.091771368456391583 0.3811926447842558 1;
	setAttr ".wm[3]" -type "matrix" -0.16569870383128721 -0.35110719473290569 0.92155720243261141 0
		 -0.062133734505570554 0.93633526997907623 0.34556571188357482 0 -0.98421711963622294 1.6926614454031457e-016 -0.17696514180758136 0
		 0.3828379410377446 0.059477817931495196 0.7200594944521852 1;
	setAttr -s 4 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.015645977945217826 0.089021381578947373
		 -0.44084605594059406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.022579723962865207 -0.91571967294939016 0.0098893192649908198 0.40106089064342565 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.0033868493153578769
		 0.025113069820340769 -0.55862671707347411 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-5.0476917435926527e-005 0.35989170112386748 -0.046114089266782489 0.93185377162156979 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.44719442278383792 -3.1202082812576681e-017
		 -1.1179806112604468e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0041670557908411688 -0.057831247666410422 -0.022305352313696705 0.99806846142814487 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.34305088233255449 4.7607873522947172e-018
		 4.7607873522947172e-018 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0059504526767637381 -0.025818786152941323 -0.13180733514511739 0.99092119202107731 1
		 1 1 yes;
	setAttr -s 4 ".m";
	setAttr -s 4 ".p";
	setAttr -s 4 ".g[0:3]" yes no no no;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster3";
	setAttr -s 240 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr ".wl[7].w[0]"  1;
	setAttr ".wl[8].w[0]"  1;
	setAttr ".wl[9].w[0]"  1;
	setAttr -s 3 ".wl[10].w[0:2]"  0.9512697423937776 0.047596176821180183 
		0.0011340807850421274;
	setAttr ".wl[11].w[0]"  1;
	setAttr ".wl[12].w[0]"  1;
	setAttr ".wl[13].w[0]"  1;
	setAttr ".wl[14].w[0]"  1;
	setAttr -s 3 ".wl[15].w[0:2]"  0.96983790838784101 0.029516701136977765 
		0.00064539047518110358;
	setAttr -s 3 ".wl[16].w[0:2]"  0.99724066783276477 0.0027132220328894051 
		4.6110134345865118e-005;
	setAttr -s 3 ".wl[17].w[0:2]"  0.99999730417089983 2.6547859803414254e-006 
		4.1043119687356583e-008;
	setAttr -s 3 ".wl[18].w[0:2]"  0.99721127208783089 0.0027419864739957537 
		4.6741438173348135e-005;
	setAttr -s 3 ".wl[19].w[0:2]"  0.9697542572806227 0.029595181874261973 
		0.00065056084511522726;
	setAttr ".wl[20].w[0]"  1;
	setAttr ".wl[21].w[0]"  1;
	setAttr ".wl[22].w[0]"  1;
	setAttr ".wl[23].w[0]"  1;
	setAttr ".wl[24].w[0]"  1;
	setAttr -s 3 ".wl[25].w[0:2]"  0.99111864135867278 0.0085058220809409186 
		0.00037553656038628576;
	setAttr -s 3 ".wl[26].w[0:2]"  0.99930718578961708 0.00066664911106499613 
		2.6165099318035551e-005;
	setAttr -s 3 ".wl[27].w[0:2]"  0.99999927602926497 6.9770521477075051e-007 
		2.6265520121310329e-008;
	setAttr -s 3 ".wl[28].w[0:2]"  0.99930785750690576 0.00066595912331340694 
		2.6183369780929848e-005;
	setAttr -s 3 ".wl[29].w[0:2]"  0.99113409849220313 0.0084898666401274463 
		0.00037603486766945801;
	setAttr ".wl[30].w[0]"  1;
	setAttr ".wl[31].w[0]"  1;
	setAttr ".wl[32].w[0]"  1;
	setAttr ".wl[33].w[0]"  1;
	setAttr -s 3 ".wl[34].w[0:2]"  0.9941103323027376 0.0054831503400561482 
		0.00040651735720623498;
	setAttr -s 3 ".wl[35].w[0:2]"  0.9964884666916215 0.003274725973831247 
		0.00023680733454721397;
	setAttr -s 3 ".wl[36].w[0:2]"  0.99975006645710929 0.00023406307824292355 
		1.5870464647692527e-005;
	setAttr -s 3 ".wl[37].w[0:2]"  0.9999999629387325 3.4756398932853086e-008 
		2.3048685416713877e-009;
	setAttr -s 3 ".wl[38].w[0:2]"  0.99975335811763522 0.00023096356675386131 
		1.5678315610966294e-005;
	setAttr -s 3 ".wl[39].w[0:2]"  0.99651376304362438 0.0032506588290718693 
		0.0002355781273037739;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr ".wl[43].w[0]"  1;
	setAttr ".wl[44].w[0]"  1;
	setAttr ".wl[45].w[0]"  1;
	setAttr ".wl[46].w[0]"  1;
	setAttr ".wl[47].w[0]"  1;
	setAttr ".wl[48].w[0]"  1;
	setAttr ".wl[49].w[0]"  1;
	setAttr ".wl[50].w[0]"  1;
	setAttr ".wl[51].w[0]"  1;
	setAttr ".wl[52].w[0]"  1;
	setAttr ".wl[53].w[0]"  1;
	setAttr ".wl[54].w[0]"  1;
	setAttr ".wl[55].w[0]"  1;
	setAttr ".wl[56].w[0]"  1;
	setAttr ".wl[57].w[0]"  1;
	setAttr ".wl[58].w[0]"  1;
	setAttr ".wl[59].w[0]"  1;
	setAttr -s 3 ".wl[60].w[0:2]"  0.99860100952547193 0.0012680271194512286 
		0.00013096335507687499;
	setAttr -s 3 ".wl[61].w[0:2]"  0.99816890832510574 0.0016628314691066416 
		0.00016826020578762239;
	setAttr -s 3 ".wl[62].w[0:2]"  0.99987533902119197 0.00011361840589504031 
		1.1042572913044468e-005;
	setAttr -s 3 ".wl[63].w[0:2]"  0.99987191389656327 0.00011644883051256476 
		1.1637272924221628e-005;
	setAttr -s 3 ".wl[64].w[0:2]"  0.9971201246576602 0.0026110966403960138 
		0.00026877870194366656;
	setAttr -s 3 ".wl[65].w[0:2]"  0.99813764778032632 0.0016865913147772746 
		0.00017576090489646658;
	setAttr -s 3 ".wl[66].w[0:2]"  0.99862002306114417 0.0012506140872845179 
		0.00012936285157132002;
	setAttr -s 3 ".wl[67].w[0:2]"  0.99819122334068033 0.0016423216762276335 
		0.00016645498309207049;
	setAttr -s 3 ".wl[68].w[0:2]"  0.99816181251132707 0.0016644451108330388 
		0.00017374237783992084;
	setAttr -s 3 ".wl[69].w[0:2]"  0.99715312423908731 0.0025807258714091079 
		0.00026614988950356019;
	setAttr -s 3 ".wl[70].w[0:2]"  0.99978975498685185 0.00019104476777998309 
		1.9200245368164039e-005;
	setAttr -s 3 ".wl[71].w[0:2]"  0.99969399497653555 0.00027862147477255862 
		2.7383548691906416e-005;
	setAttr ".wl[72].w[0]"  1;
	setAttr ".wl[73].w[0]"  1;
	setAttr -s 3 ".wl[74].w[0:2]"  0.99987832008941069 0.00011089304128192713 
		1.0786869307389793e-005;
	setAttr -s 3 ".wl[75].w[0:2]"  0.99987507371606876 0.00011356725325235117 
		1.1359030678878335e-005;
	setAttr ".wl[76].w[0]"  1;
	setAttr ".wl[77].w[0]"  1;
	setAttr ".wl[78].w[0]"  1;
	setAttr -s 3 ".wl[79].w[0:2]"  0.99999998858926098 1.0386814597337935e-008 
		1.0239243894007406e-009;
	setAttr ".wl[80].w[1]"  1;
	setAttr ".wl[81].w[1]"  1;
	setAttr ".wl[82].w[1]"  1;
	setAttr ".wl[83].w[1]"  1;
	setAttr ".wl[84].w[1]"  1;
	setAttr ".wl[85].w[1]"  1;
	setAttr ".wl[86].w[1]"  1;
	setAttr ".wl[87].w[1]"  1;
	setAttr ".wl[88].w[1]"  1;
	setAttr ".wl[89].w[1]"  1;
	setAttr ".wl[90].w[1]"  1;
	setAttr ".wl[91].w[1]"  1;
	setAttr ".wl[92].w[1]"  1;
	setAttr ".wl[93].w[1]"  1;
	setAttr ".wl[94].w[1]"  1;
	setAttr ".wl[95].w[1]"  1;
	setAttr -s 3 ".wl[96].w[0:2]"  0.0018793059267529371 0.99020263256486618 
		0.0079180615083809559;
	setAttr ".wl[97].w[1]"  1;
	setAttr ".wl[98].w[1]"  1;
	setAttr ".wl[99].w[1]"  1;
	setAttr ".wl[100].w[1]"  1;
	setAttr ".wl[101].w[1]"  1;
	setAttr -s 3 ".wl[102].w[0:2]"  0.0013538288290712494 0.99828591665391908 
		0.0003602545170097054;
	setAttr -s 3 ".wl[103].w[0:2]"  0.016249369493579819 0.97908667382122572 
		0.0046639566851945195;
	setAttr ".wl[104].w[1]"  1;
	setAttr ".wl[105].w[1]"  1;
	setAttr -s 3 ".wl[106].w[0:2]"  0.0076965034933235586 0.99030627262428672 
		0.0019972238823897899;
	setAttr ".wl[107].w[1]"  1;
	setAttr ".wl[108].w[1]"  1;
	setAttr ".wl[109].w[1]"  1;
	setAttr ".wl[110].w[1]"  1;
	setAttr ".wl[111].w[1]"  1;
	setAttr ".wl[112].w[1]"  1;
	setAttr ".wl[113].w[1]"  1;
	setAttr ".wl[114].w[1]"  1;
	setAttr ".wl[115].w[1]"  1;
	setAttr ".wl[116].w[1]"  1;
	setAttr ".wl[117].w[1]"  1;
	setAttr ".wl[118].w[1]"  1;
	setAttr ".wl[119].w[1]"  1;
	setAttr ".wl[120].w[1]"  1;
	setAttr ".wl[121].w[1]"  1;
	setAttr ".wl[122].w[1]"  1;
	setAttr ".wl[123].w[1]"  1;
	setAttr ".wl[124].w[1]"  1;
	setAttr ".wl[125].w[1]"  1;
	setAttr ".wl[126].w[1]"  1;
	setAttr ".wl[127].w[1]"  1;
	setAttr ".wl[128].w[1]"  1;
	setAttr ".wl[129].w[1]"  1;
	setAttr ".wl[130].w[1]"  1;
	setAttr ".wl[131].w[1]"  1;
	setAttr ".wl[132].w[1]"  1;
	setAttr ".wl[133].w[1]"  1;
	setAttr ".wl[134].w[1]"  1;
	setAttr ".wl[135].w[1]"  1;
	setAttr ".wl[136].w[1]"  1;
	setAttr ".wl[137].w[1]"  1;
	setAttr ".wl[138].w[1]"  1;
	setAttr ".wl[139].w[1]"  1;
	setAttr ".wl[140].w[1]"  1;
	setAttr ".wl[141].w[1]"  1;
	setAttr ".wl[142].w[1]"  1;
	setAttr ".wl[143].w[1]"  1;
	setAttr ".wl[144].w[1]"  1;
	setAttr ".wl[145].w[1]"  1;
	setAttr ".wl[146].w[1]"  1;
	setAttr ".wl[147].w[1]"  1;
	setAttr ".wl[148].w[1]"  1;
	setAttr ".wl[149].w[1]"  1;
	setAttr ".wl[150].w[1]"  1;
	setAttr ".wl[151].w[1]"  1;
	setAttr ".wl[152].w[1]"  1;
	setAttr ".wl[153].w[1]"  1;
	setAttr ".wl[154].w[1]"  1;
	setAttr ".wl[155].w[1]"  1;
	setAttr ".wl[156].w[1]"  1;
	setAttr ".wl[157].w[1]"  1;
	setAttr ".wl[158].w[1]"  1;
	setAttr ".wl[159].w[1]"  1;
	setAttr -s 3 ".wl[160].w[0:2]"  0.00037719468931035827 0.019904186396351699 
		0.97971861891433798;
	setAttr -s 3 ".wl[161].w[0:2]"  2.7504189649673393e-005 0.0017799050703333698 
		0.99819259074001698;
	setAttr -s 3 ".wl[162].w[0:2]"  2.374974628736854e-007 1.6456186147726786e-005 
		0.99998330631638943;
	setAttr -s 3 ".wl[163].w[0:2]"  2.9339297135554535e-005 0.0018714905875860781 
		0.99809917011527838;
	setAttr -s 3 ".wl[164].w[0:2]"  0.00038970462203933892 0.020058450869053085 
		0.97955184450890764;
	setAttr -s 3 ".wl[165].w[0:2]"  0.00032566057552638189 0.016803771823417975 
		0.98287056760105573;
	setAttr -s 3 ".wl[166].w[0:2]"  2.5999712438492606e-005 0.001625417552901661 
		0.99834858273465987;
	setAttr -s 3 ".wl[167].w[0:2]"  4.0906595869759638e-007 2.7523571286186767e-005 
		0.99997206736275512;
	setAttr -s 3 ".wl[168].w[0:2]"  2.4472592415754506e-005 0.0015490265790873907 
		0.99842650082849682;
	setAttr -s 3 ".wl[169].w[0:2]"  0.00031552783680085866 0.016637440919202565 
		0.98304703124399662;
	setAttr -s 3 ".wl[170].w[0:2]"  0.00054867448914633799 0.04818106782300316 
		0.95127025768785056;
	setAttr ".wl[171].w[2]"  1;
	setAttr -s 3 ".wl[172].w[0:2]"  6.7380279302196492e-007 9.4005755576711554e-005 
		0.99990532044163027;
	setAttr -s 3 ".wl[173].w[0:2]"  4.8705291563572827e-005 0.0058734073663573192 
		0.99407788734207914;
	setAttr ".wl[174].w[2]"  1;
	setAttr ".wl[175].w[2]"  1;
	setAttr ".wl[176].w[2]"  1;
	setAttr ".wl[177].w[2]"  1;
	setAttr ".wl[178].w[2]"  1;
	setAttr ".wl[179].w[2]"  1;
	setAttr ".wl[180].w[2]"  1;
	setAttr ".wl[181].w[2]"  1;
	setAttr ".wl[182].w[2]"  1;
	setAttr ".wl[183].w[2]"  1;
	setAttr ".wl[184].w[2]"  1;
	setAttr ".wl[185].w[2]"  1;
	setAttr ".wl[186].w[2]"  1;
	setAttr ".wl[187].w[2]"  1;
	setAttr ".wl[188].w[2]"  1;
	setAttr ".wl[189].w[2]"  1;
	setAttr ".wl[190].w[2]"  1;
	setAttr ".wl[191].w[2]"  1;
	setAttr ".wl[192].w[2]"  1;
	setAttr ".wl[193].w[2]"  1;
	setAttr ".wl[194].w[2]"  1;
	setAttr ".wl[195].w[2]"  1;
	setAttr ".wl[196].w[2]"  1;
	setAttr ".wl[197].w[2]"  1;
	setAttr ".wl[198].w[2]"  1;
	setAttr ".wl[199].w[2]"  1;
	setAttr -s 3 ".wl[200].w[0:2]"  0.00025624046856314144 0.008930547536471406 
		0.99081321199496553;
	setAttr -s 3 ".wl[201].w[0:2]"  0.00018299590717792548 0.0063496398773494932 
		0.99346736421547255;
	setAttr -s 3 ".wl[202].w[0:2]"  2.2971696943575755e-005 0.00091158333592771901 
		0.99906544496712868;
	setAttr -s 3 ".wl[203].w[0:2]"  1.9054752579832783e-005 0.00073444530954857993 
		0.99924649993787162;
	setAttr -s 3 ".wl[204].w[0:2]"  0.00025552627585445517 0.0090393075774151486 
		0.99070516614673043;
	setAttr -s 3 ".wl[205].w[0:2]"  0.00018297655632482765 0.0064391171978438119 
		0.99337790624583144;
	setAttr -s 3 ".wl[206].w[0:2]"  0.00027595320483965192 0.0098567280250987099 
		0.98986731877006162;
	setAttr -s 3 ".wl[207].w[0:2]"  0.00019170208237242336 0.0067823508336407922 
		0.99302594708398684;
	setAttr -s 3 ".wl[208].w[0:2]"  0.00027656207293983999 0.0097096907997963715 
		0.99001374712726387;
	setAttr -s 3 ".wl[209].w[0:2]"  0.00019162725699882753 0.0066765725692384918 
		0.99313180017376279;
	setAttr -s 3 ".wl[210].w[0:2]"  1.8431764770339217e-005 0.00074773584651075485 
		0.99923383238871888;
	setAttr -s 3 ".wl[211].w[0:2]"  1.610854193319412e-005 0.00062870118882000278 
		0.9993551902692468;
	setAttr -s 3 ".wl[212].w[0:2]"  1.8340102647632917e-005 0.00075119958336208046 
		0.99923046031399032;
	setAttr -s 3 ".wl[213].w[0:2]"  1.6112665047138332e-005 0.00063453559844855805 
		0.9993493517365043;
	setAttr -s 3 ".wl[214].w[0:2]"  1.9043041241901177e-005 0.00074009421707338027 
		0.99924086274168478;
	setAttr -s 3 ".wl[215].w[0:2]"  2.2850012974523409e-005 0.0009142619587672277 
		0.99906288802825816;
	setAttr -s 3 ".wl[216].w[0:2]"  2.3925956555115424e-008 1.0245079962806916e-006 
		0.99999895156604712;
	setAttr ".wl[217].w[2]"  1;
	setAttr -s 3 ".wl[218].w[0:2]"  2.9309440750350459e-007 1.1855731994277152e-005 
		0.99998785117359823;
	setAttr -s 3 ".wl[219].w[0:2]"  1.0258416473769963e-006 4.2725423231451908e-005 
		0.99995624873512112;
	setAttr ".wl[220].w[2]"  1;
	setAttr ".wl[221].w[2]"  1;
	setAttr ".wl[222].w[2]"  1;
	setAttr ".wl[223].w[2]"  1;
	setAttr ".wl[224].w[2]"  1;
	setAttr ".wl[225].w[2]"  1;
	setAttr ".wl[226].w[2]"  1;
	setAttr ".wl[227].w[2]"  1;
	setAttr ".wl[228].w[2]"  1;
	setAttr ".wl[229].w[2]"  1;
	setAttr ".wl[230].w[2]"  1;
	setAttr ".wl[231].w[2]"  1;
	setAttr ".wl[232].w[2]"  1;
	setAttr ".wl[233].w[2]"  1;
	setAttr ".wl[234].w[2]"  1;
	setAttr ".wl[235].w[2]"  1;
	setAttr ".wl[236].w[2]"  1;
	setAttr ".wl[237].w[2]"  1;
	setAttr ".wl[238].w[2]"  1;
	setAttr ".wl[239].w[2]"  1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.0014200295544245451 -4.0850147895223542e-006 -0.99999899174917994 -0
		 0.0028766992006705422 0.99999586229229398 -2.788170729180454e-015 -0 0.99999485404564603 -0.0028766963002362276 0.0014200354301160448 -0
		 0.064604278556659567 -0.20314781957313266 0.17335462550631672 1;
	setAttr ".pm[1]" -type "matrix" -0.02643929101900367 -0.0032269145239395471 -0.99964521251945559 0
		 -0.1211509557797696 0.99263409467620478 2.354887118638515e-014 0 0.99228192052665176 0.12110797293740355 -0.02663548548332436 -0
		 -0.41708105953439145 -0.25686548223029632 0.18591587779461743 1;
	setAttr ".pm[2]" -type "matrix" -0.069756283551086623 -0.030274339729157759 -0.99710457087464177 0
		 -0.39812349500951677 0.91733182803247781 8.9442342421364158e-015 0 0.91467575873997409 0.39697075664657744 -0.076042585048747974 -0
		 -0.6877992615362708 -0.47037758140481561 0.22665959094158769 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  4 4 4;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode tweak -n "tweak3";
createNode objectSet -n "skinCluster3Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster3GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster3GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId83";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose3";
	setAttr -s 4 ".wm";
	setAttr ".wm[0]" -type "matrix" -0.67728063612412615 0.04928583326967368 0.73407209902720949 0
		 0.033420956500576061 0.99878471486047182 -0.036223376812117833 0 -0.73496529142394607 -1.5265566588595902e-016 -0.67810472672155453 0
		 0.015645977945217826 0.089021381578947373 -0.44084605594059406 1;
	setAttr ".wm[1]" -type "matrix" 0.0014200295544244956 0.0028766992006705595 0.99999485404564648 0
		 -4.0850147895268342e-006 0.99999586229229409 -0.002876696300236212 0 -0.9999989917491805 -2.7835236587091313e-015 0.0014200354301160956 0
		 0.17326188087463337 0.20296113193035081 -0.065434510397151646 1;
	setAttr ".wm[2]" -type "matrix" -0.026439291019003726 -0.12115095577976957 0.99228192052665209 0
		 -0.003226914523939558 0.99263409467620456 0.12110797293740358 0 -0.99964521251945582 2.3553018940799505e-014 -0.026635485483324318 0
		 0.1739937067018896 0.20444366640700196 0.44992241230469476 1;
	setAttr ".wm[3]" -type "matrix" -0.069756283551086706 -0.39812349500951677 0.91467575873997453 0
		 -0.030274339729157791 0.91733182803247759 0.39697075664657755 0 -0.9971045708746421 8.9464470109838797e-015 -0.076042585048747932 0
		 0.1637846231460526 0.15766328074778815 0.83307523702762953 1;
	setAttr -s 4 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.015645977945217826 0.089021381578947373
		 -0.44084605594059406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.022579723962865207 -0.91571967294939016 0.0098893192649908198 0.40106089064342565 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.17444455777541806 0.10547028142776317
		 -0.37041056152841872 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0095141546576651345 0.36456641649018179 -0.02161379665958264 0.93087789350838901 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.51535957471869354 -4.3930447322193605e-017
		 -5.5511151231257359e-017 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.00083123294603596853 -0.014004228117122113 -0.062116858954721361 0.99797028336530758 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.38613303013681538 -5.0152478973430691e-017
		 -1.2057012580114784e-017 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0064896136100887382 -0.023869729827765373 -0.14346934312637691 0.98934557587125604 1
		 1 1 yes;
	setAttr -s 4 ".m";
	setAttr -s 4 ".p";
	setAttr -s 4 ".g[0:3]" yes no no no;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster4";
	setAttr -s 240 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr ".wl[7].w[0]"  1;
	setAttr ".wl[8].w[0]"  1;
	setAttr ".wl[9].w[0]"  1;
	setAttr -s 3 ".wl[10].w[0:2]"  0.95674291645385445 0.042411374615813048 
		0.00084570893033248252;
	setAttr ".wl[11].w[0]"  1;
	setAttr ".wl[12].w[0]"  1;
	setAttr ".wl[13].w[0]"  1;
	setAttr -s 3 ".wl[14].w[0:2]"  0.95292659014967429 0.046113589993184198 
		0.00095981985714158036;
	setAttr ".wl[15].w[0]"  1;
	setAttr ".wl[16].w[0]"  1;
	setAttr ".wl[17].w[0]"  1;
	setAttr -s 3 ".wl[18].w[0:2]"  0.99781568817929056 0.0021527613863215893 
		3.1550434387871899e-005;
	setAttr -s 3 ".wl[19].w[0:2]"  0.97327155114664232 0.026234986829144862 
		0.00049346202421286648;
	setAttr -s 3 ".wl[20].w[0:2]"  0.98699120555398456 0.012497019230815146 
		0.00051177521520034454;
	setAttr -s 3 ".wl[21].w[0:2]"  0.99813740259501182 0.0017980925783990251 
		6.4504826589165175e-005;
	setAttr ".wl[22].w[0]"  1;
	setAttr -s 3 ".wl[23].w[0:2]"  0.99789271202785124 0.0020334545990294706 
		7.3833373119315876e-005;
	setAttr -s 3 ".wl[24].w[0:2]"  0.98607025869867504 0.01337040325812738 
		0.0005593380431976457;
	setAttr ".wl[25].w[0]"  1;
	setAttr ".wl[26].w[0]"  1;
	setAttr ".wl[27].w[0]"  1;
	setAttr -s 3 ".wl[28].w[0:2]"  0.9994512609508942 0.00052994526243197739 
		1.8793786673824137e-005;
	setAttr -s 3 ".wl[29].w[0:2]"  0.99239803468799515 0.0073108175741435294 
		0.00029114773786130906;
	setAttr -s 3 ".wl[30].w[0:2]"  0.99497901303878666 0.0047010856198098161 
		0.00031990134140347497;
	setAttr -s 3 ".wl[31].w[0:2]"  0.99936802009611092 0.00059438637151523494 
		3.7593532373846048e-005;
	setAttr -s 3 ".wl[32].w[0:2]"  0.99991844438681399 7.680977514568126e-005 
		4.7458380403440498e-006;
	setAttr -s 3 ".wl[33].w[0:2]"  0.99932174977303179 0.0006376526590126557 
		4.0597567955604155e-005;
	setAttr -s 3 ".wl[34].w[0:2]"  0.99478706221495783 0.0048770142472957887 
		0.00033592353774642819;
	setAttr ".wl[35].w[0]"  1;
	setAttr ".wl[36].w[0]"  1;
	setAttr -s 3 ".wl[37].w[0:2]"  0.99999997164653331 2.6708231033984845e-008 
		1.645235560904582e-009;
	setAttr -s 3 ".wl[38].w[0:2]"  0.99979727408491503 0.00019073582101654447 
		1.1990094068379803e-005;
	setAttr -s 3 ".wl[39].w[0:2]"  0.9970269073324356 0.0027864067741703159 
		0.00018668589339399536;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr ".wl[43].w[0]"  1;
	setAttr ".wl[44].w[0]"  1;
	setAttr ".wl[45].w[0]"  1;
	setAttr ".wl[46].w[0]"  1;
	setAttr ".wl[47].w[0]"  1;
	setAttr ".wl[48].w[0]"  1;
	setAttr ".wl[49].w[0]"  1;
	setAttr ".wl[50].w[0]"  1;
	setAttr ".wl[51].w[0]"  1;
	setAttr ".wl[52].w[0]"  1;
	setAttr ".wl[53].w[0]"  1;
	setAttr ".wl[54].w[0]"  1;
	setAttr ".wl[55].w[0]"  1;
	setAttr ".wl[56].w[0]"  1;
	setAttr ".wl[57].w[0]"  1;
	setAttr ".wl[58].w[0]"  1;
	setAttr ".wl[59].w[0]"  1;
	setAttr -s 3 ".wl[60].w[0:2]"  0.9988127258360272 0.0010814771633238735 
		0.00010579700064895721;
	setAttr -s 3 ".wl[61].w[0:2]"  0.99844271098421222 0.0014209988894775525 
		0.0001362901263102104;
	setAttr -s 3 ".wl[62].w[0:2]"  0.99989401834242619 9.7067137072514239e-005 
		8.9145205013915212e-006;
	setAttr -s 3 ".wl[63].w[0:2]"  0.99989105557176894 9.9546204725257307e-005 
		9.3982235057276319e-006;
	setAttr -s 3 ".wl[64].w[0:2]"  0.99753155522856607 0.0022501799279301153 
		0.00021826484350388856;
	setAttr -s 3 ".wl[65].w[0:2]"  0.9984108239776831 0.0014468159556451756 
		0.00014236006667163481;
	setAttr -s 3 ".wl[66].w[0:2]"  0.99881898376055667 0.0010763891154267477 
		0.00010462712401666188;
	setAttr -s 3 ".wl[67].w[0:2]"  0.99845491500882166 0.0014107065783455198 
		0.0001343784128327794;
	setAttr -s 3 ".wl[68].w[0:2]"  0.99841562772770409 0.0014433382801356644 
		0.00014103399216027897;
	setAttr -s 3 ".wl[69].w[0:2]"  0.99754119799667096 0.0022429424561390297 
		0.00021585954719009366;
	setAttr -s 3 ".wl[70].w[0:2]"  0.99981843162811224 0.00016587362375183138 
		1.5694748135864836e-005;
	setAttr -s 3 ".wl[71].w[0:2]"  0.99973399626368453 0.00024353105287099934 
		2.2472683444510035e-005;
	setAttr -s 3 ".wl[72].w[0:2]"  0.99982091956513552 0.00016365621341114827 
		1.5424221453182184e-005;
	setAttr -s 3 ".wl[73].w[0:2]"  0.99973824590900084 0.00023972540148360047 
		2.2028689515417053e-005;
	setAttr -s 3 ".wl[74].w[0:2]"  0.99989692782851525 9.4431330302843824e-005 
		8.6408411820083789e-006;
	setAttr -s 3 ".wl[75].w[0:2]"  0.99989314851725308 9.7664348556887067e-005 
		9.1871341900808275e-006;
	setAttr -s 3 ".wl[76].w[0:2]"  0.99999455758560041 4.9794755643690779e-006 
		4.6293883528405176e-007;
	setAttr -s 3 ".wl[77].w[0:2]"  0.99997989830040479 1.8432410787891871e-005 
		1.6692888072424316e-006;
	setAttr ".wl[78].w[0]"  1;
	setAttr -s 3 ".wl[79].w[0:2]"  0.99999998357066444 1.5032936244042791e-008 
		1.3963992922639185e-009;
	setAttr ".wl[80].w[1]"  1;
	setAttr ".wl[81].w[1]"  1;
	setAttr ".wl[82].w[1]"  1;
	setAttr ".wl[83].w[1]"  1;
	setAttr ".wl[84].w[1]"  1;
	setAttr ".wl[85].w[1]"  1;
	setAttr ".wl[86].w[1]"  1;
	setAttr ".wl[87].w[1]"  1;
	setAttr ".wl[88].w[1]"  1;
	setAttr ".wl[89].w[1]"  1;
	setAttr ".wl[90].w[1]"  1;
	setAttr ".wl[91].w[1]"  1;
	setAttr ".wl[92].w[1]"  1;
	setAttr ".wl[93].w[1]"  1;
	setAttr ".wl[94].w[1]"  1;
	setAttr ".wl[95].w[1]"  1;
	setAttr -s 3 ".wl[96].w[0:2]"  0.0011254812639648335 0.99373316114892007 
		0.0051413575871151031;
	setAttr -s 3 ".wl[97].w[0:2]"  7.0555103832176518e-007 0.99999582160797085 
		3.4728409908608898e-006;
	setAttr -s 3 ".wl[98].w[0:2]"  0.00087567720548729835 0.99509601252158297 
		0.0040283102729297623;
	setAttr -s 3 ".wl[99].w[0:2]"  0.011328233224973672 0.94489686192287659 
		0.043774904852149812;
	setAttr ".wl[100].w[1]"  1;
	setAttr ".wl[101].w[1]"  1;
	setAttr ".wl[102].w[1]"  1;
	setAttr -s 3 ".wl[103].w[0:2]"  0.014452717122757454 0.98144039882494427 
		0.0041068840522983487;
	setAttr ".wl[104].w[1]"  1;
	setAttr ".wl[105].w[1]"  1;
	setAttr -s 3 ".wl[106].w[0:2]"  0.0049861556298307821 0.99359719329931329 
		0.0014166510708560199;
	setAttr -s 3 ".wl[107].w[0:2]"  8.3118254603586145e-007 0.99999895107792514 
		2.1773952895868626e-007;
	setAttr -s 3 ".wl[108].w[0:2]"  0.0039132202378020431 0.9949867922639074 
		0.001099987498290593;
	setAttr -s 3 ".wl[109].w[0:2]"  0.042329709341722144 0.94339750695268842 
		0.01427278370558945;
	setAttr ".wl[110].w[1]"  1;
	setAttr ".wl[111].w[1]"  1;
	setAttr ".wl[112].w[1]"  1;
	setAttr ".wl[113].w[1]"  1;
	setAttr ".wl[114].w[1]"  1;
	setAttr ".wl[115].w[1]"  1;
	setAttr ".wl[116].w[1]"  1;
	setAttr ".wl[117].w[1]"  1;
	setAttr ".wl[118].w[1]"  1;
	setAttr ".wl[119].w[1]"  1;
	setAttr ".wl[120].w[1]"  1;
	setAttr ".wl[121].w[1]"  1;
	setAttr ".wl[122].w[1]"  1;
	setAttr ".wl[123].w[1]"  1;
	setAttr ".wl[124].w[1]"  1;
	setAttr ".wl[125].w[1]"  1;
	setAttr ".wl[126].w[1]"  1;
	setAttr ".wl[127].w[1]"  1;
	setAttr ".wl[128].w[1]"  1;
	setAttr ".wl[129].w[1]"  1;
	setAttr ".wl[130].w[1]"  1;
	setAttr ".wl[131].w[1]"  1;
	setAttr ".wl[132].w[1]"  1;
	setAttr ".wl[133].w[1]"  1;
	setAttr ".wl[134].w[1]"  1;
	setAttr ".wl[135].w[1]"  1;
	setAttr ".wl[136].w[1]"  1;
	setAttr ".wl[137].w[1]"  1;
	setAttr ".wl[138].w[1]"  1;
	setAttr ".wl[139].w[1]"  1;
	setAttr ".wl[140].w[1]"  1;
	setAttr ".wl[141].w[1]"  1;
	setAttr ".wl[142].w[1]"  1;
	setAttr ".wl[143].w[1]"  1;
	setAttr ".wl[144].w[1]"  1;
	setAttr ".wl[145].w[1]"  1;
	setAttr ".wl[146].w[1]"  1;
	setAttr ".wl[147].w[1]"  1;
	setAttr ".wl[148].w[1]"  1;
	setAttr ".wl[149].w[1]"  1;
	setAttr ".wl[150].w[1]"  1;
	setAttr ".wl[151].w[1]"  1;
	setAttr ".wl[152].w[1]"  1;
	setAttr ".wl[153].w[1]"  1;
	setAttr ".wl[154].w[1]"  1;
	setAttr ".wl[155].w[1]"  1;
	setAttr ".wl[156].w[1]"  1;
	setAttr ".wl[157].w[1]"  1;
	setAttr ".wl[158].w[1]"  1;
	setAttr ".wl[159].w[1]"  1;
	setAttr -s 3 ".wl[160].w[0:2]"  0.00027523050388473754 0.01546274453931829 
		0.98426202495679693;
	setAttr -s 3 ".wl[161].w[0:2]"  2.1717945947275702e-005 0.0014432057128606478 
		0.9985350763411921;
	setAttr -s 3 ".wl[162].w[0:2]"  3.0833217672029232e-007 2.1852690797233344e-005 
		0.99997783897702608;
	setAttr -s 3 ".wl[163].w[0:2]"  2.0225654778524542e-005 0.0013620481194760116 
		0.99861772622574541;
	setAttr -s 3 ".wl[164].w[0:2]"  0.00026533016872119618 0.015260102323506171 
		0.98447456750777262;
	setAttr -s 3 ".wl[165].w[0:2]"  0.00021170528457106676 0.012502979385499208 
		0.98728531532992969;
	setAttr -s 3 ".wl[166].w[0:2]"  1.5539796788722232e-005 0.0010593290396518833 
		0.99892513116355941;
	setAttr -s 3 ".wl[167].w[0:2]"  1.5291809313148105e-007 1.0921349924808086e-005 
		0.99998892573198206;
	setAttr -s 3 ".wl[168].w[0:2]"  1.672069985726118e-005 0.0011266796643451715 
		0.99885659963579754;
	setAttr -s 3 ".wl[169].w[0:2]"  0.00021972070876282303 0.012711646917559443 
		0.9870686323736777;
	setAttr -s 3 ".wl[170].w[0:2]"  0.00041665667000031538 0.039492242194640891 
		0.96009110113535878;
	setAttr -s 3 ".wl[171].w[0:2]"  3.8474364733203863e-005 0.0048559922208819759 
		0.9951055334143849;
	setAttr -s 3 ".wl[172].w[0:2]"  1.2605162504036729e-006 0.00017857950477726423 
		0.99982015997897233;
	setAttr -s 3 ".wl[173].w[0:2]"  3.3708725759450167e-005 0.0043533466097819646 
		0.9956129446644586;
	setAttr -s 3 ".wl[174].w[0:2]"  0.00038779346428367942 0.038178847569673199 
		0.96143335896604309;
	setAttr -s 3 ".wl[175].w[0:2]"  0.00028266058074789574 0.029363297568906994 
		0.97035404185034513;
	setAttr -s 3 ".wl[176].w[0:2]"  1.9050094015922098e-005 0.0025332305381054626 
		0.99744771936787857;
	setAttr -s 3 ".wl[177].w[0:2]"  3.3520968760377535e-008 4.8474260931510277e-006 
		0.99999511905293814;
	setAttr -s 3 ".wl[178].w[0:2]"  2.222735686140304e-005 0.0028965845305810221 
		0.99708118811255764;
	setAttr ".wl[179].w[2]"  1;
	setAttr ".wl[180].w[2]"  1;
	setAttr ".wl[181].w[2]"  1;
	setAttr ".wl[182].w[2]"  1;
	setAttr ".wl[183].w[2]"  1;
	setAttr ".wl[184].w[2]"  1;
	setAttr ".wl[185].w[2]"  1;
	setAttr ".wl[186].w[2]"  1;
	setAttr ".wl[187].w[2]"  1;
	setAttr ".wl[188].w[2]"  1;
	setAttr ".wl[189].w[2]"  1;
	setAttr ".wl[190].w[2]"  1;
	setAttr ".wl[191].w[2]"  1;
	setAttr ".wl[192].w[2]"  1;
	setAttr ".wl[193].w[2]"  1;
	setAttr ".wl[194].w[2]"  1;
	setAttr ".wl[195].w[2]"  1;
	setAttr ".wl[196].w[2]"  1;
	setAttr ".wl[197].w[2]"  1;
	setAttr ".wl[198].w[2]"  1;
	setAttr ".wl[199].w[2]"  1;
	setAttr -s 3 ".wl[200].w[0:2]"  0.00017848435289687938 0.0069437460148812774 
		0.99287776963222185;
	setAttr -s 3 ".wl[201].w[0:2]"  0.00012865220266541748 0.0049215210598105349 
		0.99494982673752408;
	setAttr -s 3 ".wl[202].w[0:2]"  1.5844085148714959e-005 0.00067749149151686845 
		0.99930666442333438;
	setAttr -s 3 ".wl[203].w[0:2]"  1.3372950487738327e-005 0.00055186830886418527 
		0.99943475874064813;
	setAttr -s 3 ".wl[204].w[0:2]"  0.00017912850225593766 0.0068731414371199853 
		0.99294773006062409;
	setAttr -s 3 ".wl[205].w[0:2]"  0.00012871283407203272 0.0048602299806732602 
		0.99501105718525473;
	setAttr -s 3 ".wl[206].w[0:2]"  0.00019585450607992124 0.0074072660033127893 
		0.99239687949060729;
	setAttr -s 3 ".wl[207].w[0:2]"  0.000135503511112562 0.0050798140020064759 
		0.99478468248688101;
	setAttr -s 3 ".wl[208].w[0:2]"  0.00019545142031391269 0.0075101477809120156 
		0.99229440079877407;
	setAttr -s 3 ".wl[209].w[0:2]"  0.00013558368747836061 0.0051548548866801897 
		0.99470956142584155;
	setAttr -s 3 ".wl[210].w[0:2]"  1.3015639141543923e-005 0.00055465407654286213 
		0.99943233028431566;
	setAttr -s 3 ".wl[211].w[0:2]"  1.1396579900402036e-005 0.00046993850289832122 
		0.99951866491720121;
	setAttr -s 3 ".wl[212].w[0:2]"  1.3081343954567284e-005 0.00055261385017370669 
		0.99943430480587181;
	setAttr -s 3 ".wl[213].w[0:2]"  1.1392762077611648e-005 0.00046596281648422891 
		0.99952264442143823;
	setAttr -s 3 ".wl[214].w[0:2]"  1.3393089089551866e-005 0.00054853535742225581 
		0.99943807155348829;
	setAttr -s 3 ".wl[215].w[0:2]"  1.5955874933792194e-005 0.00067713009344518233 
		0.99930691403162109;
	setAttr -s 3 ".wl[216].w[0:2]"  1.8340666891468254e-008 8.0746220953113648e-007 
		0.99999917419712359;
	setAttr ".wl[217].w[2]"  1;
	setAttr -s 3 ".wl[218].w[0:2]"  2.0395224082880051e-007 8.6707046901681146e-006 
		0.999991125343069;
	setAttr -s 3 ".wl[219].w[0:2]"  6.8744444404591527e-007 3.0289275224992049e-005 
		0.99996902328033099;
	setAttr ".wl[220].w[2]"  1;
	setAttr ".wl[221].w[2]"  1;
	setAttr ".wl[222].w[2]"  1;
	setAttr ".wl[223].w[2]"  1;
	setAttr ".wl[224].w[2]"  1;
	setAttr ".wl[225].w[2]"  1;
	setAttr ".wl[226].w[2]"  1;
	setAttr ".wl[227].w[2]"  1;
	setAttr ".wl[228].w[2]"  1;
	setAttr ".wl[229].w[2]"  1;
	setAttr ".wl[230].w[2]"  1;
	setAttr ".wl[231].w[2]"  1;
	setAttr ".wl[232].w[2]"  1;
	setAttr ".wl[233].w[2]"  1;
	setAttr ".wl[234].w[2]"  1;
	setAttr ".wl[235].w[2]"  1;
	setAttr ".wl[236].w[2]"  1;
	setAttr ".wl[237].w[2]"  1;
	setAttr ".wl[238].w[2]"  1;
	setAttr ".wl[239].w[2]"  1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.0078902165385730545 8.70502128245308e-005 -0.99996886796801554 -0
		 0.011032005903614549 0.99993914557124042 -7.8375619796261489e-016 -0 0.99990801543377827 -0.011031662454853916 -0.0078906967224146828 -0
		 0.06242246729922888 -0.20366217070317236 -0.097716679097526904 1;
	setAttr ".pm[1]" -type "matrix" 0.033834508825753049 0.0071389224900778253 -0.99940195206843596 -0
		 -0.20644987034906079 0.97845717894696638 -3.8294888093925999e-014 0 0.97787201465497331 0.20632640343112821 0.034579447679211041 -0
		 -0.41181590825278852 -0.30034426748768578 -0.11756653648106538 1;
	setAttr ".pm[2]" -type "matrix" 0.049552283122038979 0.019156991331155004 -0.9985877932963787 -0
		 -0.36059238668836607 0.93272350172084106 -2.9941327195359683e-015 0 0.93140630333908569 0.36008315570261018 0.053126444257720173 -0
		 -0.76925899098722539 -0.42868787510213352 -0.13377907337537617 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  4 4 4;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode tweak -n "tweak4";
createNode objectSet -n "skinCluster4Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster4GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster4GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet4";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId86";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose4";
	setAttr -s 4 ".wm";
	setAttr ".wm[0]" -type "matrix" -0.67728063612412615 0.04928583326967368 0.73407209902720949 0
		 0.033420956500576061 0.99878471486047182 -0.036223376812117833 0 -0.73496529142394607 -1.5265566588595902e-016 -0.67810472672155453 0
		 0.015645977945217826 0.089021381578947373 -0.44084605594059406 1;
	setAttr ".wm[1]" -type "matrix" -0.007890216538573136 0.01103200590361455 0.99990801543377827 0
		 8.7050212824527073e-005 0.99993914557124064 -0.011031662454853913 0 -0.99996886796801587 -7.7914375536477223e-016 -0.007890696722414603 0
		 -0.097203381359580926 0.20296113193035098 -0.065434510397152201 1;
	setAttr ".wm[2]" -type "matrix" 0.033834508825752972 -0.20644987034906082 0.97787201465497309 0
		 0.0071389224900778054 0.9784571789469666 0.20632640343112821 0 -0.99940195206843629 -3.8290264029082515e-014 0.034579447679211131 0
		 -0.10141850262880354 0.20885466381242077 0.4687375902690859 1;
	setAttr ".wm[3]" -type "matrix" 0.049552283122038923 -0.36059238668836613 0.93140630333908581 0
		 0.019156991331154977 0.93272350172084117 0.36008315570261018 0 -0.99858779329637892 -2.9907164652190364e-015 0.053126444257720264 0
		 -0.087259240448475439 0.12245832046896021 0.8779631624685158 1;
	setAttr -s 4 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.015645977945217826 0.089021381578947373
		 -0.44084605594059406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.022579723962865207 -0.91571967294939016 0.0098893192649908198 0.40106089064342565 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.35762544263088486 0.09643107366371681
		 -0.17162798125039513 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.010869811905951224 0.36018784347384403 -0.01785002274117254 0.9326456675988638 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.53422124077533728 -1.9507456899031332e-017
		 -7.5986418880041755e-018 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0020875410790050495 0.021134114886280447 -0.10924548192869345 0.99378791300678671 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.41848582029808751 -2.8361475489709085e-017
		 2.9038287073350821e-018 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0026403105078319214 0.008899002448003325 -0.080388520825511955 0.99672038317440803 1
		 1 1 yes;
	setAttr -s 4 ".m";
	setAttr -s 4 ".p";
	setAttr -s 4 ".g[0:3]" yes no no no;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster5";
	setAttr -s 240 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr ".wl[7].w[0]"  1;
	setAttr ".wl[8].w[0]"  1;
	setAttr ".wl[9].w[0]"  1;
	setAttr ".wl[10].w[0]"  1;
	setAttr ".wl[11].w[0]"  1;
	setAttr ".wl[12].w[0]"  1;
	setAttr ".wl[13].w[0]"  1;
	setAttr ".wl[14].w[0]"  1;
	setAttr -s 3 ".wl[15].w[0:2]"  0.96737674180549627 0.031975533663990377 
		0.00064772453051328003;
	setAttr -s 3 ".wl[16].w[0:2]"  0.99715003109800571 0.0028066777183278014 
		4.3291183666562085e-005;
	setAttr -s 3 ".wl[17].w[0:2]"  0.99999998371444609 1.6061271619163463e-008 
		2.2428233313570247e-010;
	setAttr -s 3 ".wl[18].w[0:2]"  0.99686721771119924 0.003084594180561776 
		4.8188108239077396e-005;
	setAttr -s 3 ".wl[19].w[0:2]"  0.96622443070622255 0.033090354432902494 
		0.00068521486087499723;
	setAttr -s 3 ".wl[20].w[0:2]"  0.98434120176393125 0.015007214606869518 
		0.00065158362919922014;
	setAttr -s 3 ".wl[21].w[0:2]"  0.99790498651424941 0.0020197296620009914 
		7.5283823749440232e-005;
	setAttr -s 3 ".wl[22].w[0:2]"  0.99977930679890126 0.00021319598726327369 
		7.4972138354614774e-006;
	setAttr -s 3 ".wl[23].w[0:2]"  0.99799605794475077 0.0019324947672247331 
		7.1447288024559371e-005;
	setAttr -s 3 ".wl[24].w[0:2]"  0.98469383282143141 0.014678288505176921 
		0.00062787867339164942;
	setAttr -s 3 ".wl[25].w[0:2]"  0.99048935665947657 0.0091311587596224954 
		0.00037948458090095264;
	setAttr -s 3 ".wl[26].w[0:2]"  0.99929665841557636 0.00067852622204812765 
		2.4815362375493625e-005;
	setAttr -s 3 ".wl[27].w[0:2]"  0.99999999057076849 9.1102477816514596e-009 
		3.1898361931248554e-010;
	setAttr -s 3 ".wl[28].w[0:2]"  0.99924705313661832 0.00072619909015168003 
		2.674777322994804e-005;
	setAttr -s 3 ".wl[29].w[0:2]"  0.99022176685050201 0.0093831567534363169 
		0.00039507639606169783;
	setAttr -s 3 ".wl[30].w[0:2]"  0.9939753070013625 0.0056266908685880324 
		0.00039800213004953776;
	setAttr -s 3 ".wl[31].w[0:2]"  0.99931410304522439 0.00064407488371809058 
		4.1822071057510313e-005;
	setAttr -s 3 ".wl[32].w[0:2]"  0.99994561823078065 5.1164265286860791e-005 
		3.2175039325155546e-006;
	setAttr -s 3 ".wl[33].w[0:2]"  0.99933158725923166 0.00062786099669932555 
		4.0551744069113904e-005;
	setAttr -s 3 ".wl[34].w[0:2]"  0.99405158714284314 0.0055591222559561761 
		0.00038929060120069999;
	setAttr -s 3 ".wl[35].w[0:2]"  0.9962418171739631 0.0035158729737287068 
		0.0002423098523082107;
	setAttr -s 3 ".wl[36].w[0:2]"  0.99973981847248594 0.00024447879561796475 
		1.5702731896075616e-005;
	setAttr ".wl[37].w[0]"  1;
	setAttr -s 3 ".wl[38].w[0:2]"  0.99972977919570793 0.00025384094282552156 
		1.6379861466475879e-005;
	setAttr -s 3 ".wl[39].w[0:2]"  0.99618334810337461 0.0035685505633745369 
		0.00024810133325092558;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr ".wl[43].w[0]"  1;
	setAttr ".wl[44].w[0]"  1;
	setAttr ".wl[45].w[0]"  1;
	setAttr ".wl[46].w[0]"  1;
	setAttr ".wl[47].w[0]"  1;
	setAttr ".wl[48].w[0]"  1;
	setAttr ".wl[49].w[0]"  1;
	setAttr ".wl[50].w[0]"  1;
	setAttr ".wl[51].w[0]"  1;
	setAttr ".wl[52].w[0]"  1;
	setAttr ".wl[53].w[0]"  1;
	setAttr ".wl[54].w[0]"  1;
	setAttr ".wl[55].w[0]"  1;
	setAttr ".wl[56].w[0]"  1;
	setAttr ".wl[57].w[0]"  1;
	setAttr ".wl[58].w[0]"  1;
	setAttr ".wl[59].w[0]"  1;
	setAttr -s 3 ".wl[60].w[0:2]"  0.99851313266635555 0.0013527536375866267 
		0.00013411369605790681;
	setAttr -s 3 ".wl[61].w[0:2]"  0.99802739363437554 0.0017977165478679201 
		0.00017488981775663518;
	setAttr -s 3 ".wl[62].w[0:2]"  0.99986367729049619 0.00012471804461558974 
		1.1604664888307652e-005;
	setAttr -s 3 ".wl[63].w[0:2]"  0.99986641517835906 0.0001219279971167256 
		1.1656824524169399e-005;
	setAttr -s 3 ".wl[64].w[0:2]"  0.99706992229997105 0.0026678468721849815 
		0.00026223082784385799;
	setAttr -s 3 ".wl[65].w[0:2]"  0.99809166087947265 0.0017353838198567357 
		0.00017295530067060744;
	setAttr -s 3 ".wl[66].w[0:2]"  0.998510103134997 0.0013547595592876486 
		0.00013513730571538795;
	setAttr -s 3 ".wl[67].w[0:2]"  0.99802183567056979 0.0018017407814885 
		0.00017642354794171754;
	setAttr -s 3 ".wl[68].w[0:2]"  0.99808903596566334 0.0017367186889077006 
		0.00017424534542901475;
	setAttr -s 3 ".wl[69].w[0:2]"  0.99706508099514057 0.0026704605686722759 
		0.00026445843618717668;
	setAttr -s 3 ".wl[70].w[0:2]"  0.99980435243999122 0.00017855088182230263 
		1.7096678186552964e-005;
	setAttr -s 3 ".wl[71].w[0:2]"  0.99972424142043381 0.00025220654523652882 
		2.3552034329679535e-005;
	setAttr -s 3 ".wl[72].w[0:2]"  0.9998032851758818 0.00017946655302050567 
		1.7248271097688177e-005;
	setAttr -s 3 ".wl[73].w[0:2]"  0.99972248903646532 0.00025372390739095401 
		2.3787056143656433e-005;
	setAttr -s 3 ".wl[74].w[0:2]"  0.99986238982817288 0.0001258593544569547 
		1.1750817370203203e-005;
	setAttr -s 3 ".wl[75].w[0:2]"  0.99986548394454566 0.0001227411940049837 
		1.1774861449265939e-005;
	setAttr -s 3 ".wl[76].w[0:2]"  0.99999782652435198 1.9862034384415618e-006 
		1.8727220962277348e-007;
	setAttr -s 3 ".wl[77].w[0:2]"  0.99998878306759209 1.0273254131858557e-005 
		9.4367827612930819e-007;
	setAttr -s 3 ".wl[78].w[0:2]"  0.99999996966750271 2.7783945573867881e-008 
		2.5485517516846902e-009;
	setAttr ".wl[79].w[0]"  1;
	setAttr ".wl[80].w[1]"  1;
	setAttr ".wl[81].w[1]"  1;
	setAttr ".wl[82].w[1]"  1;
	setAttr ".wl[83].w[1]"  1;
	setAttr ".wl[84].w[1]"  1;
	setAttr ".wl[85].w[1]"  1;
	setAttr ".wl[86].w[1]"  1;
	setAttr ".wl[87].w[1]"  1;
	setAttr ".wl[88].w[1]"  1;
	setAttr ".wl[89].w[1]"  1;
	setAttr ".wl[90].w[1]"  1;
	setAttr ".wl[91].w[1]"  1;
	setAttr ".wl[92].w[1]"  1;
	setAttr -s 3 ".wl[93].w[0:2]"  0.0026000119304630319 0.98546438021040628 
		0.011935607859130727;
	setAttr ".wl[94].w[1]"  1;
	setAttr ".wl[95].w[1]"  1;
	setAttr ".wl[96].w[1]"  1;
	setAttr ".wl[97].w[1]"  1;
	setAttr ".wl[98].w[1]"  1;
	setAttr ".wl[99].w[1]"  1;
	setAttr ".wl[100].w[1]"  1;
	setAttr ".wl[101].w[1]"  1;
	setAttr ".wl[102].w[1]"  1;
	setAttr ".wl[103].w[1]"  1;
	setAttr ".wl[104].w[1]"  1;
	setAttr ".wl[105].w[1]"  1;
	setAttr ".wl[106].w[1]"  1;
	setAttr ".wl[107].w[1]"  1;
	setAttr ".wl[108].w[1]"  1;
	setAttr ".wl[109].w[1]"  1;
	setAttr ".wl[110].w[1]"  1;
	setAttr ".wl[111].w[1]"  1;
	setAttr ".wl[112].w[1]"  1;
	setAttr ".wl[113].w[1]"  1;
	setAttr ".wl[114].w[1]"  1;
	setAttr ".wl[115].w[1]"  1;
	setAttr ".wl[116].w[1]"  1;
	setAttr ".wl[117].w[1]"  1;
	setAttr ".wl[118].w[1]"  1;
	setAttr ".wl[119].w[1]"  1;
	setAttr ".wl[120].w[1]"  1;
	setAttr ".wl[121].w[1]"  1;
	setAttr ".wl[122].w[1]"  1;
	setAttr ".wl[123].w[1]"  1;
	setAttr ".wl[124].w[1]"  1;
	setAttr ".wl[125].w[1]"  1;
	setAttr ".wl[126].w[1]"  1;
	setAttr ".wl[127].w[1]"  1;
	setAttr ".wl[128].w[1]"  1;
	setAttr ".wl[129].w[1]"  1;
	setAttr ".wl[130].w[1]"  1;
	setAttr ".wl[131].w[1]"  1;
	setAttr ".wl[132].w[1]"  1;
	setAttr ".wl[133].w[1]"  1;
	setAttr ".wl[134].w[1]"  1;
	setAttr ".wl[135].w[1]"  1;
	setAttr ".wl[136].w[1]"  1;
	setAttr ".wl[137].w[1]"  1;
	setAttr ".wl[138].w[1]"  1;
	setAttr ".wl[139].w[1]"  1;
	setAttr ".wl[140].w[1]"  1;
	setAttr ".wl[141].w[1]"  1;
	setAttr ".wl[142].w[1]"  1;
	setAttr ".wl[143].w[1]"  1;
	setAttr ".wl[144].w[1]"  1;
	setAttr ".wl[145].w[1]"  1;
	setAttr ".wl[146].w[1]"  1;
	setAttr ".wl[147].w[1]"  1;
	setAttr ".wl[148].w[1]"  1;
	setAttr ".wl[149].w[1]"  1;
	setAttr ".wl[150].w[1]"  1;
	setAttr ".wl[151].w[1]"  1;
	setAttr ".wl[152].w[1]"  1;
	setAttr ".wl[153].w[1]"  1;
	setAttr ".wl[154].w[1]"  1;
	setAttr ".wl[155].w[1]"  1;
	setAttr ".wl[156].w[1]"  1;
	setAttr ".wl[157].w[1]"  1;
	setAttr ".wl[158].w[1]"  1;
	setAttr ".wl[159].w[1]"  1;
	setAttr -s 3 ".wl[160].w[0:2]"  0.00038170381369513108 0.023921652007411177 
		0.97569664417889368;
	setAttr -s 3 ".wl[161].w[0:2]"  3.2768685121863066e-005 0.0025402373460336252 
		0.99742699396884449;
	setAttr -s 3 ".wl[162].w[0:2]"  6.2528469308552579e-007 5.327044719533689e-005 
		0.99994610426811159;
	setAttr -s 3 ".wl[163].w[0:2]"  2.6272421898149658e-005 0.0021388375862645124 
		0.99783488999183734;
	setAttr -s 3 ".wl[164].w[0:2]"  0.00034179962482794909 0.023293162159742378 
		0.97636503821542964;
	setAttr -s 3 ".wl[165].w[0:2]"  0.00026618357801610061 0.019004879015482597 
		0.98072893740650136;
	setAttr -s 3 ".wl[166].w[0:2]"  1.8144723360300367e-005 0.0015274915070502188 
		0.99845436376958951;
	setAttr -s 3 ".wl[167].w[0:2]"  1.2390393364879022e-007 1.0887232034204834e-005 
		0.9999889888640322;
	setAttr -s 3 ".wl[168].w[0:2]"  2.3216176937929612e-005 0.0018713056828081887 
		0.99810547814025385;
	setAttr -s 3 ".wl[169].w[0:2]"  0.00029947954352072253 0.019835368894260616 
		0.97986515156221865;
	setAttr ".wl[170].w[2]"  1;
	setAttr -s 3 ".wl[171].w[0:2]"  6.4539372112803908e-005 0.0095657063484168529 
		0.99036975427947038;
	setAttr -s 3 ".wl[172].w[0:2]"  3.1281877712397503e-006 0.00054977869206379094 
		0.999447093120165;
	setAttr -s 3 ".wl[173].w[0:2]"  4.3158292168268741e-005 0.0069819261360289748 
		0.99297491557180284;
	setAttr -s 3 ".wl[174].w[0:2]"  0.00047311364875795051 0.056254958449921372 
		0.94327192790132075;
	setAttr ".wl[175].w[2]"  1;
	setAttr -s 3 ".wl[176].w[0:2]"  1.9399506827408179e-005 0.0033706677397224295 
		0.99660993275345011;
	setAttr ".wl[177].w[2]"  1;
	setAttr ".wl[178].w[2]"  1;
	setAttr ".wl[179].w[2]"  1;
	setAttr ".wl[180].w[2]"  1;
	setAttr ".wl[181].w[2]"  1;
	setAttr ".wl[182].w[2]"  1;
	setAttr ".wl[183].w[2]"  1;
	setAttr ".wl[184].w[2]"  1;
	setAttr ".wl[185].w[2]"  1;
	setAttr ".wl[186].w[2]"  1;
	setAttr ".wl[187].w[2]"  1;
	setAttr ".wl[188].w[2]"  1;
	setAttr ".wl[189].w[2]"  1;
	setAttr ".wl[190].w[2]"  1;
	setAttr ".wl[191].w[2]"  1;
	setAttr ".wl[192].w[2]"  1;
	setAttr ".wl[193].w[2]"  1;
	setAttr ".wl[194].w[2]"  1;
	setAttr ".wl[195].w[2]"  1;
	setAttr ".wl[196].w[2]"  1;
	setAttr ".wl[197].w[2]"  1;
	setAttr ".wl[198].w[2]"  1;
	setAttr ".wl[199].w[2]"  1;
	setAttr -s 3 ".wl[200].w[0:2]"  0.00024170663098024264 0.011071035765654979 
		0.98868725760336473;
	setAttr -s 3 ".wl[201].w[0:2]"  0.00017565655730801316 0.0079049029385487163 
		0.99191944050414338;
	setAttr -s 3 ".wl[202].w[0:2]"  2.1304926793309995e-005 0.001087238852467503 
		0.99889145622073927;
	setAttr -s 3 ".wl[203].w[0:2]"  1.8245092914759354e-005 0.00089495384047314538 
		0.99908680106661218;
	setAttr -s 3 ".wl[204].w[0:2]"  0.00024370007995262432 0.010632807115282712 
		0.98912349280476464;
	setAttr -s 3 ".wl[205].w[0:2]"  0.00017529486105724966 0.0075365772482177493 
		0.99228812789072496;
	setAttr -s 3 ".wl[206].w[0:2]"  0.00026547448458431785 0.01124228120142815 
		0.98849224431398752;
	setAttr -s 3 ".wl[207].w[0:2]"  0.00018396219092950235 0.0077898555167868182 
		0.99202618229228368;
	setAttr -s 3 ".wl[208].w[0:2]"  0.00026553649380931714 0.011881407473839964 
		0.98785305603235074;
	setAttr -s 3 ".wl[209].w[0:2]"  0.00018533447188973532 0.0082428821001492552 
		0.99157178342796104;
	setAttr -s 3 ".wl[210].w[0:2]"  1.7715531499950089e-005 0.00089078979150320294 
		0.99909149467699687;
	setAttr -s 3 ".wl[211].w[0:2]"  1.5607324685120408e-005 0.00076072805784349693 
		0.99922366461747136;
	setAttr -s 3 ".wl[212].w[0:2]"  1.7916576967696519e-005 0.00087343645486563084 
		0.99910864696816659;
	setAttr -s 3 ".wl[213].w[0:2]"  1.5544081421774398e-005 0.00073600543575371509 
		0.99924845048282451;
	setAttr -s 3 ".wl[214].w[0:2]"  1.8330548397159635e-005 0.00087519075622650988 
		0.99910647869537628;
	setAttr -s 3 ".wl[215].w[0:2]"  2.1810065839925501e-005 0.0010831976852554842 
		0.99889499224890455;
	setAttr -s 3 ".wl[216].w[0:2]"  2.6381753495997223e-008 1.3658527770298821e-006 
		0.99999860776546956;
	setAttr ".wl[217].w[2]"  1;
	setAttr -s 3 ".wl[218].w[0:2]"  2.7572210786203247e-007 1.3900832500011543e-005 
		0.99998582344539222;
	setAttr -s 3 ".wl[219].w[0:2]"  9.0515522149874985e-007 4.7491626542391722e-005 
		0.99995160321823606;
	setAttr ".wl[220].w[2]"  1;
	setAttr ".wl[221].w[2]"  1;
	setAttr ".wl[222].w[2]"  1;
	setAttr ".wl[223].w[2]"  1;
	setAttr ".wl[224].w[2]"  1;
	setAttr ".wl[225].w[2]"  1;
	setAttr ".wl[226].w[2]"  1;
	setAttr ".wl[227].w[2]"  1;
	setAttr ".wl[228].w[2]"  1;
	setAttr ".wl[229].w[2]"  1;
	setAttr ".wl[230].w[2]"  1;
	setAttr ".wl[231].w[2]"  1;
	setAttr ".wl[232].w[2]"  1;
	setAttr ".wl[233].w[2]"  1;
	setAttr ".wl[234].w[2]"  1;
	setAttr ".wl[235].w[2]"  1;
	setAttr ".wl[236].w[2]"  1;
	setAttr ".wl[237].w[2]"  1;
	setAttr ".wl[238].w[2]"  1;
	setAttr ".wl[239].w[2]"  1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.00087271464250723255 6.417336517355807e-006 -0.99999961916391256 -0
		 0.0073531057152183372 0.99997296555273973 2.6297882735381094e-015 -0 0.99997258472694817 -0.0073531029148903287 -0.0008727382365031122 -0
		 0.064605613141398524 -0.11468457073224569 -0.33050134161981937 1;
	setAttr ".pm[1]" -type "matrix" 0.069129200428093021 0.013078460148440458 -0.99752198348122523 -0
		 -0.18589115722295757 0.98257034235026131 -8.6198409521287529e-015 0 0.98013551681105926 0.1854305158646655 0.070355472222719109 -0
		 -0.39254428476767578 -0.19432851732114623 -0.3614643989959157 1;
	setAttr ".pm[2]" -type "matrix" 0.10370546758295085 0.03419814777805593 -0.99401995084703976 -0
		 -0.31317382610263333 0.94969582216846549 4.2188474935755941e-015 0 0.94401659447153741 0.31130103122911856 0.10919861408483267 -0
		 -0.74248766230858165 -0.29150864583699204 -0.39281857421988126 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  4 4 4;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode tweak -n "tweak5";
createNode objectSet -n "skinCluster5Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster5GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster5GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet5";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId89";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose5";
	setAttr -s 4 ".wm";
	setAttr ".wm[0]" -type "matrix" -0.67728063612412615 0.04928583326967368 0.73407209902720949 0
		 0.033420956500576061 0.99878471486047182 -0.036223376812117833 0 -0.73496529142394607 -1.5265566588595902e-016 -0.67810472672155453 0
		 0.015645977945217826 0.089021381578947373 -0.44084605594059406 1;
	setAttr ".wm[1]" -type "matrix" -0.00087271464250726627 0.0073531057152183407 0.99997258472694817 0
		 6.417336517350325e-006 0.99997296555273973 -0.0073531029148903252 0 -0.999999619163913 2.6355150698777747e-015 -0.00087273823650307891 0
		 -0.33044409751892129 0.11420641839504234 -0.065735570570264967 1;
	setAttr ".wm[2]" -type "matrix" 0.069129200428093021 -0.18589115722295751 0.98013551681105926 0
		 0.013078460148440456 0.98257034235026131 0.18543051586466555 0 -0.99752198348122567 -8.6126204120727469e-015 0.070355472222719137 0
		 -0.33089089393615778 0.11797092643593279 0.44621203111912838 1;
	setAttr ".wm[3]" -type "matrix" 0.10370546758295085 -0.31317382610263328 0.94401659447153741 0
		 0.034198147778055937 0.94969582216846549 0.31130103122911856 0 -0.9940199508470402 4.2126688436012377e-015 0.10919861408483272 0
		 -0.30350041389465282 0.044316841038201382 0.83456286036253058 1;
	setAttr -s 4 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.015645977945217826 0.089021381578947373
		 -0.44084605594059406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.022579723962865207 -0.91571967294939016 0.0098893192649908198 0.40106089064342565 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.51099951335492033 -1.9196444919991282e-017
		 -2.7877694745491963e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.010299872642119949 0.36347696336983221 -0.0195389775601198 0.93134131127042086 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.51196163725747079 4.9966690983138883e-018
		 -1.1506183498308742e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0031962355900088156 0.035492016553064519 -0.096951520848770026 0.99465094553022004 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.39622156587787916 -1.5029959878034262e-016
		 -1.7203213250989995e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0048765154656569432 0.018880759319635527 -0.065717273810851448 0.99764772161685256 1
		 1 1 yes;
	setAttr -s 4 ".m";
	setAttr -s 4 ".p";
	setAttr -s 4 ".g[0:3]" yes no no no;
	setAttr ".bp" yes;
createNode lambert -n "lambert2";
	setAttr ".c" -type "float3" 1 0 0 ;
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
createNode lambert -n "lambert3";
	setAttr ".c" -type "float3" 1 1 1 ;
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
createNode lambert -n "lambert4";
	setAttr ".c" -type "float3" 0 0 1 ;
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
createNode lambert -n "lambert5";
	setAttr ".c" -type "float3" 1 0.91011661 0 ;
createNode shadingEngine -n "lambert5SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
createNode lambert -n "lambert6";
	setAttr ".c" -type "float3" 0.11234999 1 0 ;
createNode shadingEngine -n "lambert6SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo10";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 14 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 12 ".s";
select -ne :defaultTextureList1;
	setAttr -s 5 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 8 ".u";
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
connectAttr "root_rotateX.o" "root.rx";
connectAttr "root_rotateY.o" "root.ry";
connectAttr "root_rotateZ.o" "root.rz";
connectAttr "skeleton.di" "root.do";
connectAttr "root.s" "index0.is";
connectAttr "index0_rotateX.o" "index0.rx";
connectAttr "index0_rotateY.o" "index0.ry";
connectAttr "index0_rotateZ.o" "index0.rz";
connectAttr "index0.s" "index1.is";
connectAttr "index1_rotateX.o" "index1.rx";
connectAttr "index1_rotateY.o" "index1.ry";
connectAttr "index1_rotateZ.o" "index1.rz";
connectAttr "index1.s" "index2.is";
connectAttr "index2_rotateX.o" "index2.rx";
connectAttr "index2_rotateY.o" "index2.ry";
connectAttr "index2_rotateZ.o" "index2.rz";
connectAttr "index2.s" "index3.is";
connectAttr "index3_rotateX.o" "index3.rx";
connectAttr "index3_rotateY.o" "index3.ry";
connectAttr "index3_rotateZ.o" "index3.rz";
connectAttr "root.s" "middle0.is";
connectAttr "middle0_rotateX.o" "middle0.rx";
connectAttr "middle0_rotateY.o" "middle0.ry";
connectAttr "middle0_rotateZ.o" "middle0.rz";
connectAttr "middle0.s" "middle1.is";
connectAttr "middle1_rotateX.o" "middle1.rx";
connectAttr "middle1_rotateY.o" "middle1.ry";
connectAttr "middle1_rotateZ.o" "middle1.rz";
connectAttr "middle1.s" "middle2.is";
connectAttr "middle2_rotateX.o" "middle2.rx";
connectAttr "middle2_rotateY.o" "middle2.ry";
connectAttr "middle2_rotateZ.o" "middle2.rz";
connectAttr "middle2.s" "middle3.is";
connectAttr "middle3_rotateX.o" "middle3.rx";
connectAttr "middle3_rotateY.o" "middle3.ry";
connectAttr "middle3_rotateZ.o" "middle3.rz";
connectAttr "root.s" "ring0.is";
connectAttr "ring0_rotateX.o" "ring0.rx";
connectAttr "ring0_rotateY.o" "ring0.ry";
connectAttr "ring0_rotateZ.o" "ring0.rz";
connectAttr "ring0.s" "ring1.is";
connectAttr "ring1_rotateX.o" "ring1.rx";
connectAttr "ring1_rotateY.o" "ring1.ry";
connectAttr "ring1_rotateZ.o" "ring1.rz";
connectAttr "ring1.s" "ring2.is";
connectAttr "ring2_rotateX.o" "ring2.rx";
connectAttr "ring2_rotateY.o" "ring2.ry";
connectAttr "ring2_rotateZ.o" "ring2.rz";
connectAttr "ring2.s" "ring3.is";
connectAttr "ring3_rotateX.o" "ring3.rx";
connectAttr "ring3_rotateY.o" "ring3.ry";
connectAttr "ring3_rotateZ.o" "ring3.rz";
connectAttr "root.s" "pinky0.is";
connectAttr "pinky0_rotateX.o" "pinky0.rx";
connectAttr "pinky0_rotateY.o" "pinky0.ry";
connectAttr "pinky0_rotateZ.o" "pinky0.rz";
connectAttr "pinky0.s" "pinky1.is";
connectAttr "pinky1_rotateX.o" "pinky1.rx";
connectAttr "pinky1_rotateY.o" "pinky1.ry";
connectAttr "pinky1_rotateZ.o" "pinky1.rz";
connectAttr "pinky1.s" "pinky2.is";
connectAttr "pinky2_rotateX.o" "pinky2.rx";
connectAttr "pinky2_rotateY.o" "pinky2.ry";
connectAttr "pinky2_rotateZ.o" "pinky2.rz";
connectAttr "pinky2.s" "pinky3.is";
connectAttr "pinky3_rotateX.o" "pinky3.rx";
connectAttr "pinky3_rotateY.o" "pinky3.ry";
connectAttr "pinky3_rotateZ.o" "pinky3.rz";
connectAttr "mesh.di" "techHand.do";
connectAttr "skinCluster1.og[0]" "hand_baseShape.i";
connectAttr "skinCluster1GroupId.id" "hand_baseShape.iog.og[3].gid";
connectAttr "skinCluster1Set.mwc" "hand_baseShape.iog.og[3].gco";
connectAttr "groupId77.id" "hand_baseShape.iog.og[4].gid";
connectAttr "tweakSet1.mwc" "hand_baseShape.iog.og[4].gco";
connectAttr "tweak1.vl[0].vt[0]" "hand_baseShape.twl";
connectAttr "skinCluster5.og[0]" "finger_indexShape.i";
connectAttr "skinCluster5GroupId.id" "finger_indexShape.iog.og[1].gid";
connectAttr "skinCluster5Set.mwc" "finger_indexShape.iog.og[1].gco";
connectAttr "groupId89.id" "finger_indexShape.iog.og[2].gid";
connectAttr "tweakSet5.mwc" "finger_indexShape.iog.og[2].gco";
connectAttr "tweak5.vl[0].vt[0]" "finger_indexShape.twl";
connectAttr "skinCluster4.og[0]" "finger_middleShape.i";
connectAttr "skinCluster4GroupId.id" "finger_middleShape.iog.og[1].gid";
connectAttr "skinCluster4Set.mwc" "finger_middleShape.iog.og[1].gco";
connectAttr "groupId86.id" "finger_middleShape.iog.og[2].gid";
connectAttr "tweakSet4.mwc" "finger_middleShape.iog.og[2].gco";
connectAttr "tweak4.vl[0].vt[0]" "finger_middleShape.twl";
connectAttr "skinCluster3.og[0]" "finger_ringShape.i";
connectAttr "skinCluster3GroupId.id" "finger_ringShape.iog.og[1].gid";
connectAttr "skinCluster3Set.mwc" "finger_ringShape.iog.og[1].gco";
connectAttr "groupId83.id" "finger_ringShape.iog.og[2].gid";
connectAttr "tweakSet3.mwc" "finger_ringShape.iog.og[2].gco";
connectAttr "tweak3.vl[0].vt[0]" "finger_ringShape.twl";
connectAttr "skinCluster2.og[0]" "finger_pinkyShape.i";
connectAttr "skinCluster2GroupId.id" "finger_pinkyShape.iog.og[1].gid";
connectAttr "skinCluster2Set.mwc" "finger_pinkyShape.iog.og[1].gco";
connectAttr "groupId80.id" "finger_pinkyShape.iog.og[2].gid";
connectAttr "tweakSet2.mwc" "finger_pinkyShape.iog.og[2].gco";
connectAttr "tweak2.vl[0].vt[0]" "finger_pinkyShape.twl";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "icosahedron:lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "icosahedron:lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Hand_MDLSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Hand_MDLSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Hand_MDLSG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Hand_MDLSG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "icosahedron:lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "icosahedron:lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Hand_MDLSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Hand_MDLSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Hand_MDLSG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Hand_MDLSG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "icosahedron:ico_edges.oc" "icosahedron:lambert2SG.ss";
connectAttr "icosahedron:lambert2SG.msg" "icosahedron:materialInfo1.sg";
connectAttr "icosahedron:ico_edges.msg" "icosahedron:materialInfo1.m";
connectAttr "icosahedron:ico_faces.oc" "icosahedron:lambert3SG.ss";
connectAttr "icosahedron:lambert3SG.msg" "icosahedron:materialInfo2.sg";
connectAttr "icosahedron:ico_faces.msg" "icosahedron:materialInfo2.m";
connectAttr "icosahedron:hyperView1.msg" "icosahedron:nodeEditorPanel2Info.b[0]"
		;
connectAttr "icosahedron:hyperLayout1.msg" "icosahedron:hyperView1.hl";
connectAttr "psdFileTex12456.oc" "Hand_SHD.c";
connectAttr "file8.oc" "Hand_SHD.sc";
connectAttr "bump2d1.o" "Hand_SHD.n";
connectAttr "Hand_SHD.oc" "Hand_MDLSG.ss";
connectAttr "Hand_MDLSG.msg" "materialInfo1.sg";
connectAttr "Hand_SHD.msg" "materialInfo1.m";
connectAttr "psdFileTex12456.msg" "materialInfo1.t" -na;
connectAttr "Hand_SHD.oc" "Hand_MDLSG1.ss";
connectAttr "Hand_MDLSG1.msg" "materialInfo2.sg";
connectAttr "Hand_SHD.msg" "materialInfo2.m";
connectAttr "psdFileTex12456.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture1.o" "psdFileTex12456.uv";
connectAttr "place2dTexture1.ofu" "psdFileTex12456.ofu";
connectAttr "place2dTexture1.ofv" "psdFileTex12456.ofv";
connectAttr "place2dTexture1.rf" "psdFileTex12456.rf";
connectAttr "place2dTexture1.reu" "psdFileTex12456.reu";
connectAttr "place2dTexture1.rev" "psdFileTex12456.rev";
connectAttr "place2dTexture1.vt1" "psdFileTex12456.vt1";
connectAttr "place2dTexture1.vt2" "psdFileTex12456.vt2";
connectAttr "place2dTexture1.vt3" "psdFileTex12456.vt3";
connectAttr "place2dTexture1.vc1" "psdFileTex12456.vc1";
connectAttr "place2dTexture1.ofs" "psdFileTex12456.fs";
connectAttr "place2dTexture2.o" "file8.uv";
connectAttr "place2dTexture2.ofu" "file8.ofu";
connectAttr "place2dTexture2.ofv" "file8.ofv";
connectAttr "place2dTexture2.rf" "file8.rf";
connectAttr "place2dTexture2.reu" "file8.reu";
connectAttr "place2dTexture2.rev" "file8.rev";
connectAttr "place2dTexture2.vt1" "file8.vt1";
connectAttr "place2dTexture2.vt2" "file8.vt2";
connectAttr "place2dTexture2.vt3" "file8.vt3";
connectAttr "place2dTexture2.vc1" "file8.vc1";
connectAttr "place2dTexture2.ofs" "file8.fs";
connectAttr "psdFileTex12457.oa" "bump2d1.bv";
connectAttr "place2dTexture3.o" "psdFileTex12457.uv";
connectAttr "place2dTexture3.ofu" "psdFileTex12457.ofu";
connectAttr "place2dTexture3.ofv" "psdFileTex12457.ofv";
connectAttr "place2dTexture3.rf" "psdFileTex12457.rf";
connectAttr "place2dTexture3.reu" "psdFileTex12457.reu";
connectAttr "place2dTexture3.rev" "psdFileTex12457.rev";
connectAttr "place2dTexture3.vt1" "psdFileTex12457.vt1";
connectAttr "place2dTexture3.vt2" "psdFileTex12457.vt2";
connectAttr "place2dTexture3.vt3" "psdFileTex12457.vt3";
connectAttr "place2dTexture3.vc1" "psdFileTex12457.vc1";
connectAttr "place2dTexture3.ofs" "psdFileTex12457.fs";
connectAttr "psdFileTex12456.oc" "Hand_SHD1.c";
connectAttr "file8.oc" "Hand_SHD1.sc";
connectAttr "bump2d2.o" "Hand_SHD1.n";
connectAttr "Hand_SHD1.oc" "Hand_MDLSG2.ss";
connectAttr "Hand_MDLSG2.msg" "materialInfo3.sg";
connectAttr "Hand_SHD1.msg" "materialInfo3.m";
connectAttr "psdFileTex12456.msg" "materialInfo3.t" -na;
connectAttr "Hand_SHD1.oc" "Hand_MDLSG3.ss";
connectAttr "Hand_MDLSG3.msg" "materialInfo4.sg";
connectAttr "Hand_SHD1.msg" "materialInfo4.m";
connectAttr "psdFileTex12456.msg" "materialInfo4.t" -na;
connectAttr "psdFileTex12457.oa" "bump2d2.bv";
connectAttr "blendColors1.op" "surfaceShader1.oc";
connectAttr "surfaceShader1.oc" "surfaceShader1SG.ss";
connectAttr "surfaceShader1SG.msg" "materialInfo5.sg";
connectAttr "surfaceShader1.msg" "materialInfo5.m";
connectAttr "ramp1.msg" "materialInfo5.t" -na;
connectAttr "place2dTexture4.o" "ramp1.uv";
connectAttr "place2dTexture4.ofs" "ramp1.fs";
connectAttr "place2dTexture5.o" "checker1.uv";
connectAttr "place2dTexture5.ofs" "checker1.fs";
connectAttr "ramp1.oc" "blendColors1.c1";
connectAttr "checker1.oc" "blendColors1.c2";
connectAttr ":mentalrayGlobals.msg" ":mentalrayItemsList.glb";
connectAttr ":miDefaultOptions.msg" ":mentalrayItemsList.opt" -na;
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayItemsList.fb" -na;
connectAttr ":miDefaultOptions.msg" ":mentalrayGlobals.opt";
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayGlobals.fb";
connectAttr "layerManager.dli[1]" "skeleton.id";
connectAttr "layerManager.dli[2]" "mesh.id";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "root.wm" "skinCluster1.ma[0]";
connectAttr "root.liw" "skinCluster1.lw[0]";
connectAttr "root.obcc" "skinCluster1.ifcl[0]";
connectAttr "root.msg" "skinCluster1.ptt";
connectAttr "groupParts3.og" "tweak1.ip[0].ig";
connectAttr "groupId77.id" "tweak1.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "hand_baseShape.iog.og[3]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId77.msg" "tweakSet1.gn" -na;
connectAttr "hand_baseShape.iog.og[4]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "hand_baseShape16Orig.w" "groupParts3.ig";
connectAttr "groupId77.id" "groupParts3.gi";
connectAttr "root.msg" "bindPose1.m[0]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "root.bps" "bindPose1.wm[0]";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "bindPose2.msg" "skinCluster2.bp";
connectAttr "pinky0.wm" "skinCluster2.ma[0]";
connectAttr "pinky1.wm" "skinCluster2.ma[1]";
connectAttr "pinky2.wm" "skinCluster2.ma[2]";
connectAttr "pinky0.liw" "skinCluster2.lw[0]";
connectAttr "pinky1.liw" "skinCluster2.lw[1]";
connectAttr "pinky2.liw" "skinCluster2.lw[2]";
connectAttr "pinky0.obcc" "skinCluster2.ifcl[0]";
connectAttr "pinky1.obcc" "skinCluster2.ifcl[1]";
connectAttr "pinky2.obcc" "skinCluster2.ifcl[2]";
connectAttr "pinky0.msg" "skinCluster2.ptt";
connectAttr "groupParts6.og" "tweak2.ip[0].ig";
connectAttr "groupId80.id" "tweak2.ip[0].gi";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "finger_pinkyShape.iog.og[1]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "tweak2.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupId80.msg" "tweakSet2.gn" -na;
connectAttr "finger_pinkyShape.iog.og[2]" "tweakSet2.dsm" -na;
connectAttr "tweak2.msg" "tweakSet2.ub[0]";
connectAttr "finger_pinkyShape20Orig.w" "groupParts6.ig";
connectAttr "groupId80.id" "groupParts6.gi";
connectAttr "root.msg" "bindPose2.m[0]";
connectAttr "pinky0.msg" "bindPose2.m[1]";
connectAttr "pinky1.msg" "bindPose2.m[2]";
connectAttr "pinky2.msg" "bindPose2.m[3]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "skinCluster3GroupParts.og" "skinCluster3.ip[0].ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3.ip[0].gi";
connectAttr "bindPose3.msg" "skinCluster3.bp";
connectAttr "ring0.wm" "skinCluster3.ma[0]";
connectAttr "ring1.wm" "skinCluster3.ma[1]";
connectAttr "ring2.wm" "skinCluster3.ma[2]";
connectAttr "ring0.liw" "skinCluster3.lw[0]";
connectAttr "ring1.liw" "skinCluster3.lw[1]";
connectAttr "ring2.liw" "skinCluster3.lw[2]";
connectAttr "ring0.obcc" "skinCluster3.ifcl[0]";
connectAttr "ring1.obcc" "skinCluster3.ifcl[1]";
connectAttr "ring2.obcc" "skinCluster3.ifcl[2]";
connectAttr "groupParts9.og" "tweak3.ip[0].ig";
connectAttr "groupId83.id" "tweak3.ip[0].gi";
connectAttr "skinCluster3GroupId.msg" "skinCluster3Set.gn" -na;
connectAttr "finger_ringShape.iog.og[1]" "skinCluster3Set.dsm" -na;
connectAttr "skinCluster3.msg" "skinCluster3Set.ub[0]";
connectAttr "tweak3.og[0]" "skinCluster3GroupParts.ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3GroupParts.gi";
connectAttr "groupId83.msg" "tweakSet3.gn" -na;
connectAttr "finger_ringShape.iog.og[2]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "finger_ringShape19Orig.w" "groupParts9.ig";
connectAttr "groupId83.id" "groupParts9.gi";
connectAttr "root.msg" "bindPose3.m[0]";
connectAttr "ring0.msg" "bindPose3.m[1]";
connectAttr "ring1.msg" "bindPose3.m[2]";
connectAttr "ring2.msg" "bindPose3.m[3]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.m[0]" "bindPose3.p[1]";
connectAttr "bindPose3.m[1]" "bindPose3.p[2]";
connectAttr "bindPose3.m[2]" "bindPose3.p[3]";
connectAttr "skinCluster4GroupParts.og" "skinCluster4.ip[0].ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4.ip[0].gi";
connectAttr "bindPose4.msg" "skinCluster4.bp";
connectAttr "middle0.wm" "skinCluster4.ma[0]";
connectAttr "middle1.wm" "skinCluster4.ma[1]";
connectAttr "middle2.wm" "skinCluster4.ma[2]";
connectAttr "middle0.liw" "skinCluster4.lw[0]";
connectAttr "middle1.liw" "skinCluster4.lw[1]";
connectAttr "middle2.liw" "skinCluster4.lw[2]";
connectAttr "middle0.obcc" "skinCluster4.ifcl[0]";
connectAttr "middle1.obcc" "skinCluster4.ifcl[1]";
connectAttr "middle2.obcc" "skinCluster4.ifcl[2]";
connectAttr "middle2.msg" "skinCluster4.ptt";
connectAttr "groupParts12.og" "tweak4.ip[0].ig";
connectAttr "groupId86.id" "tweak4.ip[0].gi";
connectAttr "skinCluster4GroupId.msg" "skinCluster4Set.gn" -na;
connectAttr "finger_middleShape.iog.og[1]" "skinCluster4Set.dsm" -na;
connectAttr "skinCluster4.msg" "skinCluster4Set.ub[0]";
connectAttr "tweak4.og[0]" "skinCluster4GroupParts.ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4GroupParts.gi";
connectAttr "groupId86.msg" "tweakSet4.gn" -na;
connectAttr "finger_middleShape.iog.og[2]" "tweakSet4.dsm" -na;
connectAttr "tweak4.msg" "tweakSet4.ub[0]";
connectAttr "finger_middleShape18Orig.w" "groupParts12.ig";
connectAttr "groupId86.id" "groupParts12.gi";
connectAttr "root.msg" "bindPose4.m[0]";
connectAttr "middle0.msg" "bindPose4.m[1]";
connectAttr "middle1.msg" "bindPose4.m[2]";
connectAttr "middle2.msg" "bindPose4.m[3]";
connectAttr "bindPose4.w" "bindPose4.p[0]";
connectAttr "bindPose4.m[0]" "bindPose4.p[1]";
connectAttr "bindPose4.m[1]" "bindPose4.p[2]";
connectAttr "bindPose4.m[2]" "bindPose4.p[3]";
connectAttr "skinCluster5GroupParts.og" "skinCluster5.ip[0].ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5.ip[0].gi";
connectAttr "bindPose5.msg" "skinCluster5.bp";
connectAttr "index0.wm" "skinCluster5.ma[0]";
connectAttr "index1.wm" "skinCluster5.ma[1]";
connectAttr "index2.wm" "skinCluster5.ma[2]";
connectAttr "index0.liw" "skinCluster5.lw[0]";
connectAttr "index1.liw" "skinCluster5.lw[1]";
connectAttr "index2.liw" "skinCluster5.lw[2]";
connectAttr "index0.obcc" "skinCluster5.ifcl[0]";
connectAttr "index1.obcc" "skinCluster5.ifcl[1]";
connectAttr "index2.obcc" "skinCluster5.ifcl[2]";
connectAttr "index2.msg" "skinCluster5.ptt";
connectAttr "groupParts15.og" "tweak5.ip[0].ig";
connectAttr "groupId89.id" "tweak5.ip[0].gi";
connectAttr "skinCluster5GroupId.msg" "skinCluster5Set.gn" -na;
connectAttr "finger_indexShape.iog.og[1]" "skinCluster5Set.dsm" -na;
connectAttr "skinCluster5.msg" "skinCluster5Set.ub[0]";
connectAttr "tweak5.og[0]" "skinCluster5GroupParts.ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5GroupParts.gi";
connectAttr "groupId89.msg" "tweakSet5.gn" -na;
connectAttr "finger_indexShape.iog.og[2]" "tweakSet5.dsm" -na;
connectAttr "tweak5.msg" "tweakSet5.ub[0]";
connectAttr "finger_indexShape17Orig.w" "groupParts15.ig";
connectAttr "groupId89.id" "groupParts15.gi";
connectAttr "root.msg" "bindPose5.m[0]";
connectAttr "index0.msg" "bindPose5.m[1]";
connectAttr "index1.msg" "bindPose5.m[2]";
connectAttr "index2.msg" "bindPose5.m[3]";
connectAttr "bindPose5.w" "bindPose5.p[0]";
connectAttr "bindPose5.m[0]" "bindPose5.p[1]";
connectAttr "bindPose5.m[1]" "bindPose5.p[2]";
connectAttr "bindPose5.m[2]" "bindPose5.p[3]";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "hand_baseShape.iog" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo6.sg";
connectAttr "lambert2.msg" "materialInfo6.m";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "finger_indexShape.iog" "lambert3SG.dsm" -na;
connectAttr "lambert3SG.msg" "materialInfo7.sg";
connectAttr "lambert3.msg" "materialInfo7.m";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "finger_middleShape.iog" "lambert4SG.dsm" -na;
connectAttr "lambert4SG.msg" "materialInfo8.sg";
connectAttr "lambert4.msg" "materialInfo8.m";
connectAttr "lambert5.oc" "lambert5SG.ss";
connectAttr "finger_ringShape.iog" "lambert5SG.dsm" -na;
connectAttr "lambert5SG.msg" "materialInfo9.sg";
connectAttr "lambert5.msg" "materialInfo9.m";
connectAttr "lambert6.oc" "lambert6SG.ss";
connectAttr "finger_pinkyShape.iog" "lambert6SG.dsm" -na;
connectAttr "lambert6SG.msg" "materialInfo10.sg";
connectAttr "lambert6.msg" "materialInfo10.m";
connectAttr "icosahedron:lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "icosahedron:lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "Hand_MDLSG.pa" ":renderPartition.st" -na;
connectAttr "Hand_MDLSG1.pa" ":renderPartition.st" -na;
connectAttr "Hand_MDLSG2.pa" ":renderPartition.st" -na;
connectAttr "Hand_MDLSG3.pa" ":renderPartition.st" -na;
connectAttr "surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "lambert6SG.pa" ":renderPartition.st" -na;
connectAttr "icosahedron:ico_edges.msg" ":defaultShaderList1.s" -na;
connectAttr "icosahedron:ico_faces.msg" ":defaultShaderList1.s" -na;
connectAttr "Hand_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "Hand_SHD1.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShader1.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert5.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "psdFileTex12456.msg" ":defaultTextureList1.tx" -na;
connectAttr "file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "psdFileTex12457.msg" ":defaultTextureList1.tx" -na;
connectAttr "ramp1.msg" ":defaultTextureList1.tx" -na;
connectAttr "checker1.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of techGloves.ma
