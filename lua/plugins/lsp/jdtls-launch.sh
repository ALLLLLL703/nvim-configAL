#!/bin/bash
lombok_path=/home/sanae/CodeProject/javaProject/lombok.jar
JAR="/home/sanae/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
export GRADLE_HOME=/usr/bin/gradle
java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -Dlog.protocol=true \
    -Dlog.level=ALL \
    -Xms1g \
    -Xmx2G \
    -jar $(echo "$JAR") \
    -configuration "/home/sanae/.local/share/nvim/mason/packages/jdtls/config_linux" \
    -data "/home/sanae/.cache/jdtls" \
    --add-modules=ALL-SYSTEM \
    --add-opens java.base/java.util=ALL-UNNAMED \
    --add-opens java.base/java.lang=ALL-UNNAMED \
    -javaagent:"$lombok_path"
