#!/bin/zsh

clear

os_type="undefined"
case $OSTYPE in
  darwin19.0)
    os_type="macos"
    ;;
  linux-gnu)
    os_type="linux"
    ;;
  msys)
    os_type="msys"
    ;;
esac

echo "setting up dev sandbox for $os_type ($OSTYPE)..."
# define a number of params for each os that help set everything up...

case $os_type in
  macos)
    echo "running on mac..."
    sandbox_home="/Applications/dev_sandbox"
    sandbox_workspaces="${HOME}/development"

    if [[ $1 -eq 8 ]] ; then
      java_locn=$(ls -d /Library/Java/JavaVirtualMachines/adoptopenjdk-8* | head -n 1)
    else
      java_locn=$(ls -d /Library/Java/JavaVirtualMachines/openjdk* | head -n 1)
    fi
    idea_locn="Intellij IDEA.app/Contents"
    ;;
  linux)
    echo "running on linux..."
    sandbox_home="/mnt/development/sandbox"
    sandbox_workspaces=${sandbox_home}/workspaces
    java_locn="openjdk8"
    idea_locn="idea-IU"
    ;;
  msys)
    echo "running on msys under windows..."
    export MSYSTEM=MSYS

    sandbox_home="/c/devel"
    sandbox_workspaces="/c/projects"
    if [[ $1 -eq 8 ]] ; then
      java_locn="java/jdk1.8"
    else
      java_locn="java/jdk-11"
    fi
    idea_locn="idea"
    ;;
esac

sandbox_lang=${sandbox_home}/langs
sandbox_build=${sandbox_home}/build
sandbox_ide=${sandbox_home}/ide
sandbox_tools=${sandbox_home}/tools
sandbox_scm=${sandbox_home}/scm
sandbox_server=${sandbox_home}/server
sandbox_database=${sandbox_home}/database

export SANDBOX_HOME=${sandbox_home}
export DEV_WORKSPACES="${sandbox_workspaces}"

echo "setting up languages..."
case $os_type in
  macos)
    # manage java through home-brew as the standard java installer is a pain!
    # export JAVA_HOME="${sandbox_lang}/${java_locn}/Contents/Home"
    export JAVA_HOME="${java_locn}/Contents/Home"
    #export JAVA_HOME=$(/usr/libexec/java_home)
    # git needed/installed by homebrew
    #export GIT_HOME="${sandbox_scm}/git"
    #export GIT_INSTALL_DIR="${sandbox_scm}/git"
    ;;
  linux)
    export JAVA_HOME="${sandbox_lang}/${java_locn}"
    export GIT_HOME="${sandbox_scm}/git"
    export GIT_INSTALL_DIR="${sandbox_scm}/git"
    ;;
  msys)
    export JAVA_HOME="${sandbox_lang}/${java_locn}"
    export GIT_HOME="${sandbox_scm}/git"
    export GIT_INSTALL_DIR="${sandbox_scm}/git"
    export ERLANG_HOME="${sandbox_lang}/erlang"
    ;;
esac

echo "setting up build tools..."
export M2_HOME="${sandbox_build}/apache-maven"
export M2_REPO="${sandbox_workspaces}/repo/maven"

export GRADLE_HOME="${sandbox_build}/gradle"
export GRADLE_USER_HOME="${sandbox_workspaces}/repo/gradle"

echo "setting up ides..."
export IDEA_HOME="${sandbox_ide}/${idea_locn}"
export IDEA_PROPERTIES="${IDEA_HOME}/bin/idea.properties"

# don't override - use the provided runtimes for the ides
#export IDEA_JDK="${sandbox_lang}/${java_locn}"
#export IDEA_JDK_64="${sandbox_lang}/${java_locn}"
#export STUDIO_JDK="${sandbox_lang}/${java_locn}"

echo "setting up development tooling..."
#export SVN_HOME="${sandbox_scm}/subversion"

echo "setting up databasey stuff..."
if [[ -d ${sandbox_database}/oracle ]]; then
  export TNS_ADMIN="${sandbox_database}/oracle/tns_admin"
  export INSTANT_CLIENT="${sandbox_database}/oracle/instantclient_64"
fi

if [[ -d ${sandbox_lang}/android ]]; then
  echo "setting up android..."
  export ANDROID_HOME="${sandbox_lang}/android/sdk"
  export ANDROID_STUDIO_HOME="${sandbox_ide}/android-studio"
fi

if [[ -d ${sandbox_lang}/go ]]; then
  echo "setting up golang..."
  export GOROOT="${sandbox_lang}/go"
  export GOPATH="${sandbox_workspaces}/gocode"
fi

echo "setting path..."
typeset -Ug path

# default path
path=("/usr/local/bin"
      "/usr/local/sbin"
      "/usr/bin"
      "/usr/sbin"
      "/bin"
      "/sbin")

# extra dev bits
path+=(${JAVA_HOME}/bin)
path+=(${M2_HOME}/bin)
path+=(${GRADLE_HOME}/bin)
path+=(${IDEA_HOME}/bin)
path+=(${sandbox_home}/scripts)

[[ -v INSTANT_CLIENT ]] && path+=($INSTANT_CLIENT)
[[ -d ${sandbox_lang}/android ]] && path+=(${ANDROID_HOME}/platform-tools)
[[ -d ${sandbox_lang}/android ]] && path+=(${ANDROID_HOME}/tools/bin)
[[ -d ${sandbox_lang}/go ]] && path+=(${GOROOT}/bin)
[[ -d ${sandbox_lang}/go ]] && path+=(${GOPATH}/bin)
[[ -v SVN_HOME ]] && path+=(${SVN_HOME}/bin)


case $os_type in
  macos)
    # make sure the brew installed git overrides apples
    path=("/usr/local/git/bin" $path)
    # path+=("/usr/local/opt/ccache/libexec")
    ;;
  msys)
    path+=(${GIT_HOME}/cmd)
    path+=("/c/Program Files (x86)/MSBuild/14.0/Bin")
    path+=("/c/windows/system32")
    path+=(${sandbox_server}/nodejs)
    path+=($ERLANG_HOME/bin)
    ;;
esac

# remove any duplicate entries
typeset -U path

echo "environment..."
echo "home: " $SANDBOX_HOME
echo "path: " $PATH
java -version
mvn -v
gradle --version
