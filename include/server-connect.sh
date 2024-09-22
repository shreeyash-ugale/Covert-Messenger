#/bin/bash
allocate(){
  echo "echo \"ncat is listening\"" > ncat
  chmod +x ncat
  alias ncat=$(pwd)/ncat
}

deallocate(){
  unalias ncat 2>/dev/null
  rm -f w$(pwd)/ncat 2>/dev/null
}

server() {
  allocate &
  echo "Starting on port $port"
  tail -f $output | ncat -l -p $port > $input
  echo "server ending"
  deallocate &
}