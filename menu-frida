@echo off
cls
:menu
cls
color d

date /t

echo Computador: %computername%        Usuario: %username%
echo 	      Menu Frida
echo  ==================================
echo * 1. Iniciar Frida Server          *
echo * 2. Instalar Frida Server         * 
echo * 3. Remover Frida Server          *
echo * 4. Sair                          * 
echo  ==================================
echo                           by: Pugno

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5

:opcao1
color a
cls
adb shell su -c  ls /data/local/tmp/
SET /p versao= Qual Versao: 
cls
adb shell su -c  "./data/local/tmp/%versao%"

:opcao2
cls
SET /p versao= Cole a versao que deseja instalar: 
cls
echo a versao escolhida e: %versao%
adb push %versao% /data/local/tmp
adb shell su -c  chmod 777 /data/local/tmp/%versao%
adb shell su -c  ls -la /data/local/tmp/
pause
goto menu

:opcao3
cls
adb shell su -c  ls /data/local/tmp/
SET /p rm= Remover o que: 
adb shell su -c  rm /data/local/tmp/%rm%
cls
adb shell su -c  ls /data/local/tmp/
pause
goto menu

:opcao4
cls
exit

:opcao5
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu
