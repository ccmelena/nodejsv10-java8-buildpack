install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://doc-10-9o-docs.googleusercontent.com/docs/securesc/rhcdrom22b49nv5ke8snk0leie1uajat/k1misvv1p7p37h182a7gg6s10121huju/1559167200000/05152923700785122461/05152923700785122461/1MYSUsSEJWLXKG0wiXV6wZzM24JgMAk0F?e=download"
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
