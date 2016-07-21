# NOTE: before running this script you need to alow remote scripts in PowerShell:
# Set-ExecutionPolicy Unrestricted

# Avoids (407) Proxy Authentication Required error
$browser = New-Object System.Net.WebClient
$browser.Proxy.Credentials =[System.Net.CredentialCache]::DefaultNetworkCredentials 

# Chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Web browsers
choco install firefox -y -f

# SVN
choco install tortoisesvn -y -f

# Python
choco install python2 -y -f

# Java
choco install jdk8 -y -f
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk1.8.0_74", "Machine") # Change to actual Java JDK version
# Remember to override the JAVA_HOME value in the Go Pipeline because Go sets its own value.

# IDEs
choco install notepadplusplus -y -f
choco install visualstudio2015community -y -f # Note: this seems to fail in new machines, to be investigated.
choco install sandcastle -y -f
choco install doxygen.install -y -f
choco install linqpad -y -f
choco install maven -y -f
choco install ant -y -f
choco install netbeans -y -f
choco install nsis -y -f
choco install nuget.commandline -y -f
choco install nunit -y -f

# MULTI (5 and 6)
."\\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\GHS\MULTI_5_0_6\setup_windows.exe" -autoinstall -target_dir C:\ghs\multi506
[Environment]::SetEnvironmentVariable("MULTI506_PATH", "C:\ghs\multi506", "Machine")
."\\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\GHS\MULTI_6_1_4\ginstall.exe"
[Environment]::SetEnvironmentVariable("MULTI614_PATH", "C:\ghs\comp_201314p", "Machine") # Assumes default path in installer

# SVN repos
https://vfsa001.utc.com/svn/fire

# Python build scripts
svn checkout https://vfsa001.utc.com/svn/fire/FIRE_BCN_COMMON/trunk/01_Firmware/04_SQA/02_Tools C:\SQATools
[Environment]::SetEnvironmentVariable("KWSCRIPTS_PATH", "C:\SQATools\Klocwork\IntegrationBuildScripts", "Machine")
[Environment]::SetEnvironmentVariable("PYTHONPATH", $Env:PYTHONPATH + ";" + "C:\SQATools\PythonLibs", "Machine")

# PATH
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";" + "C:\Program Files (x86)\NSIS", "Machine")
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";" + "C:\Program Files (x86)\NUnit.org\nunit-console", "Machine")

# NSIS 
# Install NsProcess plugin 1.5: http://nsis.sourceforge.net/NsProcess_plugin
# Install AccessControl plugin: http://nsis.sourceforge.net/AccessControl_plug-in

# MULTI
# Configure license manager: @AH028214.emea.fs.utc.com

# Winzip
[Environment]::SetEnvironmentVariable("WINZIP_PATH", "C:\Program Files\WinZip", "Machine")

# Doxygen
[Environment]::SetEnvironmentVariable("DOXYGEN1810_PATH", "C:\Program Files\doxygen", "Machine")

# FREESCALE (NXP) CODE WARRIOR 10.6
[Environment]::SetEnvironmentVariable("CW106_PATH", "C:\Freescale\CW MCU v10.6", "Machine")

# KEIL UVISION 5.15
# \\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\Keil\MDK515.exe
# Configure Packs (install STM32L0xx_DFP)
# Activate with LIC: 7N08V-PZWX7-1FG0H-9KWBC-QL62Z-JTCWQ
[Environment]::SetEnvironmentVariable("KEILUV5_PATH", "C:\Keil_v5\UV4", "Machine")
# For the Nexux EMEA detector: copy C:\Keil_v5\ARM\Pack\ARM\CMSIS\4.5.0\CMSIS to C:\Keil_v5\ARM

# TI CODE COMPOSER STUDIO 6.1.2
[Environment]::SetEnvironmentVariable("CCS61_PATH", "C:\ti\ccsv6\eclipse", "Machine")

# KLOCWORK
# Install server package 10.1.2: \\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\Klocwork\Installers\kw-server-installer.10.1.2.10400.windows.exe
# Use licence in License
[Environment]::SetEnvironmentVariable("KLOCWORK10_PATH", "C:\KlocworkTemp", "Machine")
[Environment]::SetEnvironmentVariable("KWSERVER", "http://cusnwa58.na.1utcfs.com:8080", "Machine")
# Login into server the first time: kwauth.exe --url http://CUSNWA58.na.1utcfs.com:8080/
# Overwrite configuration files from: https://vfsa001.utc.com/svn/fire/FIRE_BCN_COMMON/trunk/01_Firmware/04_SQA/02_Tools/Klocwork/ConfigurationFiles/ServerConfig


# Maven
# Copy settings.xml from C:\SQATools\Maven to configure proxy and Nexus server.

# VMWare
# License: K1213-4N3E0-48R9U-0R2K2-1W1LM

# Cygwin + Perl + ARM compiler (for SAM-BA applets and bootloaders)
# \\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\SAMBA Tools\make-3.81.exe
# [Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";" + "C:\Program Files (x86)\GnuWin32\bin", "Machine")
# \\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\ActivePerl-5.14.2.1402-MSWin32-x86-295342.msi
# \\cesbaf03.emea.fs.utc.com\Barcelona_6710\TECHNOLOGY\ENGINEERING\Proyectos\FW team\01_Tools\bu-2.19_gcc-4.3.2-c-c++_nl-1.16.0_gi-6.8.exe
# [Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";" + "C:\Program Files (x86)\GNUARM\bin", "Machine")
# NOTE: GNU TOOLS DO NOT WORK IN THIS MOMENT, INSTALL CYGWIN WITH MAKE v3.82+ INSTEAD.

# Python
python -m pip install --upgrade pip
python -m pip install parse

C:\Klocwork\Server 10.1\bin\kwauth.exe --url http://CUSNWA58.na.1utcfs.com:8080/
