echo "Hello user!"

if [[ $kubernetes = true ]] ; then
echo "Installing kubernetes tooling!"
fi




kubernetes () {
  echo "Installing curl & kubectl"
  apk add --no-cache curl nano
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/kubectl
  export KUBE_EDITOR="nano"

  echo "Installing helm"
  curl -LO https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz
  tar -C /tmp/ -zxvf helm-v3.4.0-linux-amd64.tar.gz
  rm helm-v3.4.0-linux-amd64.tar.gz
  mv /tmp/linux-amd64/helm /usr/local/bin/helm
  chmod +x /usr/local/bin/helm

}