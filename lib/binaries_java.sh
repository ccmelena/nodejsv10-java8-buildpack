install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://uc72feaaf08ad3dddb579bddb743.dl.dropboxusercontent.com/cd/0/get/Ah5URbjMg_VRZDr-7ERQ7UDX_mW-GJKcQcL-_aVnPPtK6YdPrJDBS5T76EJMIOx0uJOKtQUy_GA4VfbX_hBUNPQ5eQ4iouJewlxyyEWJVtRIYw/file#"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/jdk1.8.0_211/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
  echo "Export PATH"
  export JAVA_HOME=$dir
  export PATH=$dir/bin:$PATH
  echo $JAVA_HOME
  echo $PATH
  
  echo "Version: "
  java -version
  javac -version
}
