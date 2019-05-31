install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://ucabcae183c6f8249d00fb0ade33.dl.dropboxusercontent.com/cd/0/get/Ah98mNXz57hUnilSVb2qFu_fyqyOr_9HNUeev4R_zxRbmoNcufApD19HMDeNezdMeYgoEK2Dpabb4v52sNU-NdJ53GyFgmAb4x2pO0UqxXdzoA/file#"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jre
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jre
  rm -rf $dir/*
  mv /tmp/jre/jre1.8.0_211/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
  echo "Export PATH"
  export JAVA_HOME=$dir
  export PATH=$JAVA_HOME/bin:$PATH
  #export LD_LIBRARY_PATH=$dir/jre/lib/amd64/server/libjvm.so
  echo ">>> $JAVA_HOME"
  echo ">>> $PATH"
  #echo $LD_LIBRARY_PATH
  
  #echo "list3..."
  #ls "/usr/lib"/

  #ln -sf $dir/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so
  #cp $dir/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so
  
  #echo "list4..."
  #ls "/usr/lib"/
  
  echo "Version: "
  java -version
  #javac -version
}
