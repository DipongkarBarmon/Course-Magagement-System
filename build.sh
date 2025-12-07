#!/bin/bash

# Course Management System Build Script

echo "Building Course Management System..."

# Create build directory if it doesn't exist
mkdir -p build/classes

# Compile Java files
echo "Compiling Java files..."
javac -cp "src/main/webapp/WEB-INF/lib/*" -d build/classes src/main/java/com/dip/*.java src/main/java/com/dip/dao/*.java

if [ $? -eq 0 ]; then
    echo "Compilation successful!"
    echo "Classes compiled to build/classes/"
else
    echo "Compilation failed!"
    exit 1
fi

# Create WAR file
echo "Creating WAR file..."
cd build
jar -cf ../Course-Management.war -C classes . -C ../src/main/webapp .
cd ..

echo "WAR file created: Course-Management.war"
echo "Deploy this WAR file to your Tomcat webapps directory"
echo "Make sure to run database_setup.sql first!"
