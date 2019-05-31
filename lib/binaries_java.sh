install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://uc59f1da8fda7520758caedfaa79.dl.dropboxusercontent.com/cd/0/get/Ah7-x65ezb4LMlZSWJe1RDUe1NeQpyYuOr0dBsocSnMVKVZAk6YO_wPtjA00LjAtCWxOKQlVLW6TLx6rcDJzjE8KQi61BeiUOg4pP6h2GHrgTw/file#"
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
  export LD_LIBRARY_PATH=$dir/jre/lib/amd64/server
  echo $JAVA_HOME
  echo $PATH
  echo $LD_LIBRARY_PATH
  
  echo "list1..."
  for entry1 in "$LD_LIBRARY_PATH"/*
  do
    echo "$entry1"
  done
  
  echo "list2..."
  for entry2 in "/usr"/*
  do
    echo "$entry2"
  done
  
  echo "list3..."
  ls "/usr"/
  
  echo "Version: "
  java -version
  javac -version
}
