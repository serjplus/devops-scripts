#!/bin/bash
mkdir /usr/lib/jvm
cd /usr/lib/jvm
wget https://cloud.kocharyan.net/s/8bZCyfsigcC9wtk/download/jdk-8u231-linux-x64.tar.gz --no-check-certificate
mv download jdk-8u231-linux-x64.tar.gz
tar -zxvf ./jdk-8u231-linux-x64.tar.gz
cat <<'EOF' >> /etc/environment
J2SDKDIR="/usr/lib/jvm/jdk1.8.0_231"
J2REDIR="/usr/lib/jvm/jdk1.8.0_231/jre"
JAVA_HOME="/usr/lib/jvm/jdk1.8.0_231"
DERBY_HOME="/usr/lib/jvm/jdk1.8.0_231/db"
EOF
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_231/bin/java" 0
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_231/bin/javac" 0
update-alternatives --set java /usr/lib/jvm/jdk1.8.0_231/bin/java
update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_231/bin/javac
update-alternatives --list java
update-alternatives --list javac
java -version
