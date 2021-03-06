; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "MeshLab"
!define PRODUCT_VERSION "1.3.2"
!define PRODUCT_PUBLISHER "Paolo Cignoni, Guido Ranzuglia VCG - ISTI - CNR"
!define PRODUCT_WEB_SITE "http://meshlab.sourceforge.net"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\meshlab.exe"
!define PRODUCT_DIR_REGKEY_S "Software\Microsoft\Windows\CurrentVersion\App Paths\meshlabserver.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define QT_BASE "C:\QtSDK\Desktop\Qt\4.7.4\mingw"
!define MINGW_BASE "C:\QtSDK\mingw"
!define DISTRIB_FOLDER "../distrib"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\docs\gpl.txt"
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\docs\privacy.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES


; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\meshlab.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------
!define /date NOW "%Y_%m_%d"

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "MeshLabDevel_v132BETA_${NOW}.exe"
InstallDir "$PROGRAMFILES\VCG\MeshLab"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "${DISTRIB_FOLDER}\meshlab.exe"
  File "${DISTRIB_FOLDER}\meshlabserver.exe"

  CreateDirectory "$SMPROGRAMS\MeshLab"
  CreateShortCut "$SMPROGRAMS\MeshLab\MeshLab.lnk" "$INSTDIR\meshlab.exe"
  CreateShortCut "$DESKTOP\MeshLab.lnk" "$INSTDIR\meshlab.exe"
  CreateShortCut "$SMPROGRAMS\MeshLab\MeshLabServer.lnk" "cmd.exe"

  ;Let's delete all the dangerous stuff from previous releases.
  Delete "$INSTDIR\qt*.dll"
  Delete "$INSTDIR\ming*.dll"
  Delete "$INSTDIR\plugins\*.dll"
  Delete "$INSTDIR\imageformats\*.dll"
  
  SetOutPath "$INSTDIR\shaders"
  File "${DISTRIB_FOLDER}\shaders\*.frag"
  File "${DISTRIB_FOLDER}\shaders\*.gdp"
  File "${DISTRIB_FOLDER}\shaders\*.vert"
  SetOutPath "$INSTDIR\shaders\decorate_shadow\ao"
  SetOutPath "$INSTDIR\shaders\decorate_shadow\sm"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\sm\*.frag"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\sm\*.vert"
  SetOutPath "$INSTDIR\shaders\decorate_shadow\ssao"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\ssao\*.frag"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\ssao\*.vert"
  SetOutPath "$INSTDIR\shaders\decorate_shadow\vsm"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\vsm\*.frag"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\vsm\*.vert"
  SetOutPath "$INSTDIR\shaders\decorate_shadow\vsmb"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\vsmb\*.frag"
  File "${DISTRIB_FOLDER}\shaders\decorate_shadow\vsmb\*.vert"
  File "${DISTRIB_FOLDER}\shaders\*.frag"
  SetOutPath "$INSTDIR\shaders\shadersrm"
  File "${DISTRIB_FOLDER}\shaders\shadersrm\*.rfx"
  SetOutPath "$INSTDIR\plugins"
  ; IO Plugins (9)
  File "${DISTRIB_FOLDER}/plugins\io_base.dll"
  File "${DISTRIB_FOLDER}/plugins\io_bre.dll"
  File "${DISTRIB_FOLDER}/plugins\io_ctm.dll"
  File "${DISTRIB_FOLDER}/plugins\io_collada.dll"
  File "${DISTRIB_FOLDER}/plugins\io_3ds.dll"
  File "${DISTRIB_FOLDER}/plugins\io_json.dll"
  File "${DISTRIB_FOLDER}/plugins\io_u3d.dll"
  File "${DISTRIB_FOLDER}/plugins\io_x3d.dll"
  File "${DISTRIB_FOLDER}/plugins\io_tri.dll"
  File "${DISTRIB_FOLDER}/plugins\io_expe.dll"
  File "${DISTRIB_FOLDER}/plugins\io_gts.dll"
  File "${DISTRIB_FOLDER}/plugins\io_pdb.dll"
  File "${DISTRIB_FOLDER}/plugins\io_m.dll"

  ; filter plugins (23)
  File "${DISTRIB_FOLDER}/plugins\filter_ao.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_aging.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_autoalign.dll"

  File "${DISTRIB_FOLDER}/plugins\filter_bnpts.dll"
  
  File "${DISTRIB_FOLDER}/plugins\filter_camera.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_clean.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_colorproc.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_color_projection.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_colorize.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_create.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_csg.dll"

  File "${DISTRIB_FOLDER}/plugins\filter_dirt.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_fractal.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_func.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_img_patch_param.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_isoparametrization.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_layer.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_measure.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_measure.xml"
  File "${DISTRIB_FOLDER}/plugins\filter_meshing.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_mls.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_mutualinfo.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_mutualinfo.xml"
  
  File "${DISTRIB_FOLDER}/plugins\filter_photosynth.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_plymc.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_poisson.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_qhull.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_quality.dll"
  
  File "${DISTRIB_FOLDER}/plugins\filter_sampling.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_sdfgpu.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_select.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_ssynth.dll"
  
  
  
  File "${DISTRIB_FOLDER}/plugins\filter_texture.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_trioptimize.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_unsharp.dll"
  File "${DISTRIB_FOLDER}/plugins\filter_zippering.dll"
  

  File "${DISTRIB_FOLDER}/plugins\samplefilter.dll"
  ;File "${DISTRIB_FOLDER}/plugins\samplefilterdoc.dll"
  File "${DISTRIB_FOLDER}/plugins\samplefilterdyn.dll"

  File "${DISTRIB_FOLDER}/plugins\filtergeodesic.dll"
  File "${DISTRIB_FOLDER}/plugins\filtercreateiso.dll"
  ;File "${DISTRIB_FOLDER}/plugins\filterborder.dll"
 

  ; edit plugins (14)
  File "${DISTRIB_FOLDER}/plugins\edit_align.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_arc3D.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_measure.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_paint.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_point.dll"
  ;File "${DISTRIB_FOLDER}/plugins\editrgbtri.dll"
  ;File "${DISTRIB_FOLDER}/plugins\editsegment.dll"

  File "${DISTRIB_FOLDER}/plugins\sampleedit.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_pickpoints.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_quality.dll"
  
  File "${DISTRIB_FOLDER}/plugins\edit_select.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_texture.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_hole.dll"
  File "${DISTRIB_FOLDER}/plugins\edit_manipulators.dll"
  ;File "${DISTRIB_FOLDER}/plugins\edit_topo.dll"

  ; decorate plugins (2)
  File "${DISTRIB_FOLDER}/plugins\decorate_base.dll"
  File "${DISTRIB_FOLDER}/plugins\decorate_background.dll"
  ;File "${DISTRIB_FOLDER}/plugins\sampledecoration.dll"
  File "${DISTRIB_FOLDER}/plugins\decorate_shadow.dll"
  File "${DISTRIB_FOLDER}/plugins\decorate_raster_proj.dll"
  
  ; render plugins (1)
  File "${DISTRIB_FOLDER}/plugins\render_splatting.dll"
  File "${DISTRIB_FOLDER}/plugins\render_radiance_scaling.dll"
  File "${DISTRIB_FOLDER}/plugins\render_gdp.dll"
  File "${DISTRIB_FOLDER}/plugins\render_rfx.dll"

  
  ; All the U3D binary stuff
  SetOutPath "$INSTDIR\plugins\U3D_W32"
  File "${DISTRIB_FOLDER}/plugins\U3D_W32\IDTFConverter.exe"
  File "${DISTRIB_FOLDER}/plugins\U3D_W32\*.dll"
  File "${DISTRIB_FOLDER}/plugins\U3D_W32\*.txt"
  SetOutPath "$INSTDIR\plugins\U3D_W32\plugins"
  File "${DISTRIB_FOLDER}/plugins\U3D_W32\Plugins\IFXExporting.dll"

  SetOutPath "$INSTDIR\textures"
  File "${DISTRIB_FOLDER}/textures\chrome.png"
  File "${DISTRIB_FOLDER}/textures\*.dds"
  File "${DISTRIB_FOLDER}/textures\fur.png"
  File "${DISTRIB_FOLDER}/textures\glyphmosaic.png"
  ;File "${DISTRIB_FOLDER}/textures\NPR Metallic Outline.tga"
  File "${DISTRIB_FOLDER}/textures\hatch*.jpg"

  SetOutPath "$INSTDIR\textures\litspheres"
  File "${DISTRIB_FOLDER}/textures\litspheres\*.png"
    
  SetOutPath "$INSTDIR\textures\cubemaps"
  File "${DISTRIB_FOLDER}/textures\cubemaps\uffizi*.jpg"
  SetOutPath "$INSTDIR\samples"
  File "${DISTRIB_FOLDER}/sample\texturedknot.ply"
  File "${DISTRIB_FOLDER}/sample\texturedknot.obj"
  File "${DISTRIB_FOLDER}/sample\texturedknot.mtl"
  File "${DISTRIB_FOLDER}/sample\TextureDouble_A.png"
  File "${DISTRIB_FOLDER}/sample\Laurana50k.ply"
  File "${DISTRIB_FOLDER}/sample\duck_triangulate.dae"
  File "${DISTRIB_FOLDER}/sample\seashell.gts"
  File "${DISTRIB_FOLDER}/sample\chameleon4k.pts"
  File "${DISTRIB_FOLDER}/sample\normalmap\laurana500.*"
  File "${DISTRIB_FOLDER}/sample\normalmap\matteonormb.*"
  SetOutPath "$INSTDIR\samples\images"
  File "${DISTRIB_FOLDER}/sample\images\duckCM.jpg"
  SetOutPath "$INSTDIR\imageformats"
  File ${QT_BASE}\plugins\imageformats\qjpeg4.dll
  File ${QT_BASE}\plugins\imageformats\qgif4.dll
  File ${QT_BASE}\plugins\imageformats\qtiff4.dll
  SetOutPath "$INSTDIR"
  File "${DISTRIB_FOLDER}\common.dll"
  File "${QT_BASE}\bin\QtCore4.dll"
  File "${QT_BASE}\bin\QtGui4.dll"
  File "${QT_BASE}\bin\QtOpenGL4.dll"
  File "${QT_BASE}\bin\QtXml4.dll"
  File "${QT_BASE}\bin\QtNetwork4.dll"
  File "${QT_BASE}\bin\QtScript4.dll"
  File "${QT_BASE}\bin\QtXmlPatterns4.dll"
  ;File "C:\MinGW\bin\mingwm10.dll"
  File "${MINGW_BASE}\bin\mingwm10.dll"
  File "${MINGW_BASE}\bin\libgcc_s_dw2-1.dll"
  File "${MINGW_BASE}\bin\libgomp-1.dll"
  
  File "..\..\docs\readme.txt"
  ;File "..\..\docs\history.txt"
  File "..\..\docs\gpl.txt"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\MeshLab\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\MeshLab\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\meshlab.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY_S}" "" "$INSTDIR\meshlabserver.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\meshlab.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\*.dll"
  Delete "$INSTDIR\*.txt"
  Delete "$INSTDIR\*.exe"
  Delete "$INSTDIR\shaders\*.frag"
  Delete "$INSTDIR\shaders\*.vert"
  Delete "$INSTDIR\shaders\*.gdp"
  Delete "$INSTDIR\shadersrm\*.rfx"
  Delete "$INSTDIR\samples\*.*"
  Delete "$INSTDIR\samples\images\*.*"
  Delete "$INSTDIR\plugins\*.dll"
  Delete "$INSTDIR\plugins\U3D_W32\*.dll"
  Delete "$INSTDIR\plugins\U3D_W32\*.exe"
  Delete "$INSTDIR\plugins\U3D_W32\*.txt"
  Delete "$INSTDIR\plugins\U3D_W32\plugins\*.dll"
  Delete "$INSTDIR\plugins\*.dll"
  Delete "$INSTDIR\imageformats\*.dll"
  Delete "$INSTDIR\textures\*.png"
  Delete "$INSTDIR\textures\*.dds"
  Delete "$INSTDIR\textures\cubemaps\*.jpg"
  Delete "$INSTDIR\textures\*.jpg"
  Delete "$INSTDIR\textures\*.tga"

  Delete "$SMPROGRAMS\MeshLab\Uninstall.lnk"
  Delete "$SMPROGRAMS\MeshLab\Website.lnk"
  Delete "$DESKTOP\MeshLab.lnk"
  Delete "$SMPROGRAMS\MeshLab\MeshLab.lnk"

  RMDir "$SMPROGRAMS\MeshLab"
  RMDir "$INSTDIR\CVS"
  RMDir "$INSTDIR\imageformats"
  RMDir "$INSTDIR\plugins\U3D_W32\plugins"
  RMDir "$INSTDIR\plugins\U3D_W32"
  RMDir "$INSTDIR\plugins"
  RMDir "$INSTDIR\samples\images"
  RMDir "$INSTDIR\samples"
  RMDir "$INSTDIR\textures\cubemaps"
  RMDir /r "$INSTDIR\textures"
  RMDir /r "$INSTDIR\shaders"
  RMDir /r "$INSTDIR\shadersrm"
  RMDir /r "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}" 
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY_S}"
  SetAutoClose true
SectionEnd

  ;******************** PARTE SPERIMENTALE SULLE ASSOCIAZIONI FILE ****************
;Things that need to be extracted on startup (keep these lines before any File command!)
;Only useful for BZIP2 compression
;Use ReserveFile for your own InstallOptions INI files too!

!define TEMP1 $R0 ;Temp variable

ReserveFile "${NSISDIR}\Plugins\InstallOptions.dll"
; ReserveFile "fileassociation_nsis.ini"

;Order of pages
; la prox linea se scommnentata serve ad abilitare il loading di una pagine aggiuntiva
; in cui si settano le associazioni file extensions-registro per il meshlab.
; Page custom SetCustom ValidateCustom ": Testing InstallOptions" ;Custom page. InstallOptions gets called in SetCustom.
;Page instfiles

Section "Components"

  ;Get Install Options dialog user input

  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 2" "State"
  DetailPrint "Install X=${TEMP1}"
  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 3" "State"
  DetailPrint "Install Y=${TEMP1}"
  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 4" "State"
  DetailPrint "Install Z=${TEMP1}"
  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 5" "State"
  DetailPrint "File=${TEMP1}"
  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 6" "State"
  DetailPrint "Dir=${TEMP1}"
  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 8" "State"
  DetailPrint "Info=${TEMP1}"

SectionEnd

Function .onInit

  ;Extract InstallOptions files
  ;$PLUGINSDIR will automatically be removed when the installer closes

  InitPluginsDir
;  File /oname=$PLUGINSDIR\fileassociation_nsis.ini "fileassociation_nsis.ini"

FunctionEnd

Function SetCustom

  ;Display the InstallOptions dialog

  Push ${TEMP1}

    InstallOptions::dialog "$PLUGINSDIR\fileassociation_nsis.ini"
    Pop ${TEMP1}

  Pop ${TEMP1}

FunctionEnd

Function ValidateCustom

  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 2" "State"
  StrCmp ${TEMP1} 1 done

  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 3" "State"
  StrCmp ${TEMP1} 1 done

  ReadINIStr ${TEMP1} "$PLUGINSDIR\fileassociation_nsis.ini" "Field 4" "State"
  StrCmp ${TEMP1} 1 done
    MessageBox MB_ICONEXCLAMATION|MB_OK "You must select at least one install option!"
    Abort

  done:

FunctionEnd
