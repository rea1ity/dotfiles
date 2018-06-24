#!/bin/zsh

clear

os_type="undefined"
case $OSTYPE in
   linux-gnu)
      os_type="linux"
      ;;
   msys)
      os_type="msys"
      ;;
   darwin17.0)
      os_type="macos"
      ;;
esac

echo "setting up dev sandbox for $os_type ($OSTYPE)..."
# define a number of params that help set everything up...

case $os_type in
   linux)
      echo "running on linux..."
      sandbox_home="/mnt/development/sandbox"
      sandbox_workspaces=${sandbox_home}/workspaces
      java_locn="openjdk8"
      orcl_java="jdk1.8.0"
      idea_locn="idea-IU"
      ;;
   msys)
      echo "running on msys under windows..."
      export MSYSTEM=MSYS

      sandbox_home="/c/devel"
      sandbox_workspaces="/c/projects"
      java_locn="java/jdk1.8"
      orcl_java="java/jdk1.8"
      idea_locn="idea"
      ;;
   macos)
      echo "running on mac..."
      sandbox_home="/Applications/dev_stuff"
      sandbox_workspaces="/Users/dardav/development/workspaces"
#      java_locn="openjdk1.8.0.jdk"
#      java_locn="jdk1.8.0_102.jdk"
      if [[ $1 -eq 8 ]] ; then
         java_locn="jdk1.8.0_162.jdk"
         orcl_java="jdk1.8.0_162.jdk"
      else
         java_locn="jdk-10.0.1.jdk"
         orcl_java="jdk-10.0.1.jdk"
      fi
      idea_locn="Intellij IDEA.app/Contents"
      ;;
esac

sandbox_lang=${sandbox_home}/langs
sandbox_build=${sandbox_home}/build
sandbox_ide=${sandbox_home}/ide
sandbox_tools=${sandbox_home}/tools
sandbox_scm=${sandbox_home}/scm

export SANDBOX_HOME=${sandbox_home}
export DEV_WORKSPACES="${sandbox_workspaces}"

echo "setting up languages..."
case $os_type in
   linux)
      export JAVA_HOME="${sandbox_lang}/${java_locn}"
      ;;
   msys)
      export JAVA_HOME="${sandbox_lang}/${java_locn}"
      ;;
   macos)
      # manage java through home-brew as the installer is a pain!
      # export JAVA_HOME="${sandbox_lang}/${java_locn}/Contents/Home"
      export JAVA_HOME="/Library/Java/JavaVirtualMachines/${java_locn}/Contents/Home"
      #export JAVA_HOME=$(/usr/libexec/java_home)
      ;;
esac

export GOROOT="${sandbox_lang}/go"
export GOPATH="${sandbox_workspaces}/gocode"

echo "setting up build tools..."
export M2_HOME="${sandbox_build}/apache-maven"
export GRADLE_HOME="${sandbox_build}/gradle"
export M2_REPO="${sandbox_workspaces}/repo/maven"
export GRADLE_USER_HOME="${sandbox_workspaces}/repo/gradle"
export ANDROID_HOME="${sandbox_lang}/android/sdk"

echo "setting up ides..."
export IDEA_HOME="${sandbox_ide}/${idea_locn}"
export IDEA_PROPERTIES="${IDEA_HOME}/bin/idea.properties"
export IDEA_JDK="${sandbox_lang}/${orcl_java}"
export IDEA_JDK_64="${sandbox_lang}/${orcl_java}"
export ANDROID_STUDIO_HOME="${sandbox_ide}/android-studio"
export STUDIO_JDK="${sandbox_lang}/${orcl_java}"

echo "setting up development tooling..."
export GIT_HOME="${sandbox_scm}/git"
export GIT_INSTALL_DIR="${sandbox_scm}/git"
#export SVN_HOME="${sandbox_scm}/subversion"


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
path+=(${ANDROID_HOME}/platform-tools)
path+=(${ANDROID_HOME}/tools/bin)
path+=(${sandbox_home}/scripts)

case $OSTYPE in
   msys)
      path+=(${GIT_HOME}/cmd)
      ;;
   macos)
      path+=(${GOROOT}/bin)
      path+=("/usr/local/opt/ccache/libexec")
      ;;
esac

# remove any duplicate entries
typeset -U path

echo "environment..."
echo "home: " $SANDBOX_HOME
echo "path: " $PATH
mvn -v
java -version

