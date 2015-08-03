#!/bin/zsh

clear
echo "setting up dev sandbox..."
# define a number of params that help set everything up...
sandbox_home=/c/devel
sandbox_lang=${sandbox_home}/langs
sandbox_build=${sandbox_home}/build
sandbox_ide=${sandbox_home}/ide
sandbox_scm=${sandbox_home}/scm
sandbox_tools=${sandbox_home}/tools
sandbox_workspaces=/c/projects

export SANDBOX_HOME=${sandbox_home}
export DEV_WORKSPACES="${sandbox_workspaces}"

echo "setting up languages..."
export JAVA_HOME="${sandbox_lang}/java/jdk1.8"

echo "setting up build tools..."
export M2_HOME="${sandbox_build}/apache-maven"
export M2_REPO="${sandbox_workspaces}/repo/maven"
#export ANT_HOME="${sandbox_build}/apache-ant"
export GRADLE_HOME="${sandbox_build}/gradle"
export GRADLE_USER_HOME="${sandbox_workspaces}/repo/gradle"
export ANDROID_HOME="${sandbox_lang}/android-sdk"


echo "setting up ides..."
export IDEA_HOME="${sandbox_ide}/idea"
export IDEA_PROPERTIES="${IDEA_HOME}/bin/idea.properties"
export IDEA_JDK="${JAVA_HOME}"
export IDEA_JDK_64="${JAVA_HOME}"
export ANDROID_STUDIO_HOME="${sandbox_ide}/android-studio"
export STUDIO_JDK="${JAVA_HOME}"

echo "setting up development tooling..."
export GIT_HOME="${sandbox_scm}/git"
export GIT_INSTALL_DIR="${sandbox_scm}/git"
export SVN_HOME="${sandbox_scm}/subversion"
export MSYSTEM=MSYS


echo "setting path..."
typeset -Ug path

# default path
# path=("/usr/local/bin"
#       "/usr/bin"
#       "/usr/sbin"
#       "/bin"
#       "/sbin")

# extra dev bits
path+=(${JAVA_HOME}/bin)
path+=(${M2_HOME}/bin)
path+=(${GRADLE_HOME}/bin)
path+=(${IDEA_HOME}/bin)
path+=(${ANDROID_HOME}/platform-tools)
path+=(${GIT_HOME}/cmd)
path+=(${sandbox_home}/scripts)

# remove any duplicate entries
typeset -U path

echo "environment..."
echo "path: " $PATH
mvn -v
java -version

# dev specific aliases
alias idea="${IDEA_HOME}/bin/idea.bat >& /dev/null &"
