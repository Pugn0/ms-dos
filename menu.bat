@echo off
cls
:menu
cls
color d

date /t

echo Computador: %computername%        Usuario: %username%
echo 	      M E N U
echo  ==================================
echo * 1. Iniciar Frida Server          *
echo * 2. Instalar Frida Server         * 
echo * 3. Remover Frida Server          *
echo * 4. Instalar Frida Tools          * 
echo * 5. Ativar Proxy                  * 
echo * 6. Limpar Proxy                  * 
echo * 7. Iniciar Charles               * 
echo * 8. Sair                          * 
echo  ==================================

set /p opcao= ESCOLHA [1] [2] [3] [4] [5] [6] [7]: 
echo                                    by: Pugno
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5 
if %opcao% equ 6 goto opcao6 
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8


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
pip install frida-tools
pause
goto menu

:opcao5
cls
color 6
ipconfig | findstr IPv4
echo ------------------------------------------------------------
SET /p ip= Cole Endereco IPv4 aqui: 
adb shell settings put global http_proxy %ip%:8888
color a
cls
echo OK
adb shell settings get global http_proxy
pause
goto menu

:opcao6
cls
adb shell settings delete global http_proxy
adb shell settings delete global global_http_proxy_host
adb shell settings delete global global_http_proxy_port
adb shell settings put global http_proxy :0
cls
color a
echo Configuracoes de proxy limpa
goto menu

:opcao7
start start-cahrles.vbs
goto menu

:opcao8
cls
exit
