; ================================
; CONFIGURACIÓN GENERAL
; ================================

Name "LeerTXT"
OutFile "LeerTXTSetup.exe"
InstallDir "$PROGRAMFILES\LeerTXT"
RequestExecutionLevel admin

!include "MUI2.nsh"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "Spanish"

; ================================
; INSTALACIÓN
; ================================

Section "Instalar"

  SetOutPath $INSTDIR

  ; Copiar el JAR
  File "Fuentes_Tarea_U07.jar"

  ; Crear acceso directo en escritorio
CreateShortcut "$DESKTOP\LeerTXT.lnk" "javaw.exe" "-jar $INSTDIR\Fuentes_Tarea_U07.jar"

  ; Crear acceso en menú inicio
  CreateDirectory "$SMPROGRAMS\LeerTXT"
CreateShortcut "$SMPROGRAMS\LeerTXT\LeerTXT.lnk" "javaw.exe" "-jar $INSTDIR\Fuentes_Tarea_U07.jar"
  ; Crear desinstalador
  WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; ================================
; DESINSTALACIÓN
; ================================

Section "Uninstall"

  Delete "$DESKTOP\LeerTXT.lnk"
  Delete "$SMPROGRAMS\LeerTXT\LeerTXT.lnk"
  RMDir "$SMPROGRAMS\LeerTXT"

  Delete "$INSTDIR\Fuentes_Tarea_U07.jar"
  Delete "$INSTDIR\uninstall.exe"

  RMDir "$INSTDIR"

SectionEnd