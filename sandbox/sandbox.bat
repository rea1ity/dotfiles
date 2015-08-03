@ECHO OFF

rem if we're running under cmder, execute their startup script
if defined ConEmuDir (
   call "%ConEmuDir%/../init.bat
)


rem set the window title so we know what we're running
set JAVA_VERSION=8

if "%1" == "7" (
   set JAVA_VERSION=7
)

rem base folders
set SANDBOX_HOME=c:\devel
set SANDBOX_TOOLS=%SANDBOX_HOME%\tools
set SANDBOX_SERVERS=%SANDBOX_HOME%\servers
set SANDBOX_LANGS=%SANDBOX_HOME%\langs
set SANDBOX_BUILD=%SANDBOX_HOME%\build
set SANDBOX_SCM=%SANDBOX_HOME%\scm
set SANDBOX_IDE=%SANDBOX_HOME%\ide

rem setup java
set JAVA_HOME=%SANDBOX_LANGS%\java\jdk1.8

if "%JAVA_VERSION%" == "7" (
   set JAVA_HOME=%SANDBOX_LANGS%\java\1.7
)

set JRE_HOME=%JAVA_HOME%\jre
set AS_JAVA=%JAVA_HOME%

set M2_REPO=%SANDBOX_HOME%\repository
set M2_HOME=%SANDBOX_BUILD%\maven
rem set MAVEN_OPTS="-XX:MaxPermSize=128m" - removed in java 8
rem set MAVEN_OPTS="-Xmx1024m -Xms512m -XX:PermSize=256m"
set MAVEN_HOME=%M2_HOME%

rem setup development environments
set IDEA_HOME=%SANDBOX_IDE%\intellij
set IDEA_JDK=%JAVA_HOME%
set IDEA_JDK_64=%JAVA_HOME%

rem setup source control
rem set CVSNT_HOME=%ProgramFiles(x86)%\CVSNT
rem set GIT_SSH=%ProgramFiles(x86)%\PuTTY\plink.exe
set GIT_HOME=%SANDBOX_SCM%\git
set GIT_INSTALL_DIR=%SANDBOX_SCM%\git
rem set GIT_TEMPLATE_DIR=%SANDBOX_SCM%\git-core\templates\standard_template
set SVN_HOME=%SANDBOX_SCM%\subversion

rem setup app servers
rem set SUNONE_HOME=%SANDBOX_SERVERS%\glassfish
rem set AS_HOME=%SANDBOX_SERVERS%\glassfish
rem set CATALINA_HOME=%SANDBOX_SERVERS%\apache-tomee-plus
rem set TOMCAT_HOME=%SANDBOX_SERVERS%\tomcat\apache-tomcat-7.0.26
rem set JETTY_HOME=%SANDBOX_SERVERS%\jetty
rem set JBOSS_HOME=%SANDBOX_SERVERS%\jboss\jboss-5.1.0.GA

rem setup activemq
rem set ACTIVEMQ_HOME=%SANDBOX_SERVERS%\activemq

rem setup random other stuff
rem set GRADLE_HOME=%SANDBOX_BUILD%\gradle\gradle-0.8
rem set PUTTY_HOME=%ProgramFiles(x86)%\PuTTY
rem set SOAPUI_HOME=%SANDBOX_HOME%\test\soapui-4.5.1
set SQLDEV_HOME=%SANDBOX_HOME%\database\sqldeveloper
rem set CYGWIN_HOME=c:\cygwin
set MSYS_HOME=%SANDBOX_TOOLS%\msys64
set WORKSPACES_HOME=C:\projects
set MSYSTEM=MSYS

rem the following two variables allow command line access to the internet and sets the proxy exclusion for local
rem set HTTP_PROXY=http://server:port
set NO_PROXY=localhost,127.0.0.1

rem setup path
set OLD_PATH=%PATH%

set WINDOWS_PATH=%WINDIR%;%WINDIR%\system32;%WINDIR%\System32\Wbem;%WINDIR%\System32\WindowsPowerShell\v1.0\;%ProgramFiles(x86)%\Intel\iCLS Client\;%ProgramFiles%\Intel\iCLS Client\;%ProgramFiles%\Intel\Intel(R) Management Engine Components\DAL;%ProgramFiles(x86)%\Intel\Intel(R) Management Engine Components\DAL;%ProgramFiles%\Intel\Intel(R) Management Engine Components\IPT;%ProgramFiles(x86)%\Intel\Intel(R) Management Engine Components\IPT;%ProgramFiles(x86)%\Hewlett-Packard\HP Performance Advisor

set MSYS_PATH=%MSYS_HOME%\usr\bin;%MSYS_HOME%\usr\local\bin;%MSYS_HOME%\bin;%MSYS_HOME%\opt\bin;

set DEV_PATH=%MSYS_PATH%;%JAVA_HOME%\bin;%M2_HOME%\bin;%GIT_HOME%\cmd;%SVN_HOME%\bin;%SANDBOX_HOME%\scripts;%SANDBOX_TOOLS%\bin


rem set CMDER_PATH=%SANDBOX_TOOLS%\cmder;%SANDBOX_TOOLS%\cmder\bin;%SANDBOX_TOOLS%\cmder\vendor\msysgit\bin;%SANDBOX_TOOLS%\cmder\vendor\msysgit\share\vim\vim74;%SANDBOX_TOOLS%\cmder\vendor\conemu-maximus5;%SANDBOX_TOOLS%\cmder\vendor\conemu-maximus5\ConEmu
set CMDER_PATH=%SANDBOX_TOOLS%\cmder;%SANDBOX_TOOLS%\cmder\bin;%SANDBOX_TOOLS%\cmder\vendor\conemu-maximus5;%SANDBOX_TOOLS%\cmder\vendor\conemu-maximus5\ConEmu

set PATH=%WINDOWS_PATH%;%DEV_PATH%;%CMDER_PATH%

set WINDOWS_PATH=
set DEV_PATH=
set JAVA_VERSION=

rem echo out versions
mvn -version
java -version
