#!/bin/zsh

clear
echo "setting up dev sandbox..."
# define a number of params that help set everything up...
sandbox_home=/Applications/dev\ stuff
sandbox_lang=${sandbox_home}/langs
sandbox_build=${sandbox_home}/build
sandbox_ide=${sandbox_home}/ide
sandbox_tools=${sandbox_home}/tools
sandbox_workspaces=~/development/workspaces

export SANDBOX_HOME=${sandbox_home}

# remove the dev path if it's already been appended
tmp_path=$PATH; tmp_path=${ORIG_PATH:-$tmp_path}
export PATH="$tmp_path"

export DEV_WORKSPACES="${sandbox_workspaces}"

echo "setting up languages..."
export JAVA_HOME="${sandbox_lang}/openjdk1.8.0.jdk/Contents/Home"

echo "setting up build tools..."
export M2_HOME="${sandbox_build}/apache-maven"
export M2_REPO="${sandbox_workspaces}/repo/maven"
#export ANT_HOME="${sandbox_build}/apache-ant"
export GRADLE_HOME="${sandbox_build}/gradle"
export GRADLE_USER_HOME="${sandbox_workspaces}/repo/gradle"
export ANDROID_HOME="${sandbox_lang}/android-sdk"


echo "setting up ides..."
export IDEA_HOME="${sandbox_ide}/Intellij IDEA.app/Contents"
export IDEA_PROPERTIES="${IDEA_HOME}/bin/idea.properties"
export IDEA_JDK="${sandbox_lang}/jdk1.8.0.jdk"
export ANDROID_STUDIO_HOME="${sandbox_ide}/android-studio"
export STUDIO_JDK="${sandbox_lang}/jdk1.8.0.jdk"

echo "setting path..."
# default path: /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export ORIG_PATH="${PATH}"
export PATH="${JAVA_HOME}/bin:${M2_HOME}/bin:${GRADLE_HOME}/bin::${IDEA_HOME}/bin:$ANDROID_HOME/platform-tools:$PATH:"

echo "environment..."
echo "path: " $PATH
mvn -v
java -version

# dev specific aliases
alias idea="/Applications/dev\ stuff/ide/IntelliJ\ IDEA.app/Contents/MacOS/idea >& /dev/null &"
