install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://uc474974a920aff1c8f0b10e4b94.dl.dropboxusercontent.com/cd/0/get/Ah1kcgLoF5yU36Z_XbowmdCzJbR-7Ve1Yks4p5G15YRf1LnaYYJ4IKxebzDO1ANXqWGyTQZn8FnB4yVKAmgG4aAAquBEHeTPs8HO_GUCuy9olw/file?dl=1#"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/jdk1.8.0_73/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
}
