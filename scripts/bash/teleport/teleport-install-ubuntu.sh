# https://goteleport.com/docs/deploy-a-cluster/open-source/
sudo curl https://apt.releases.teleport.dev/gpg \
-o /usr/share/keyrings/teleport-archive-keyring.asc
source /etc/os-release
echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] \
https://apt.releases.teleport.dev/${ID?} ${VERSION_CODENAME?} stable/v11" \
| sudo tee /etc/apt/sources.list.d/teleport.list > /dev/null
sudo apt-get update
sudo apt-get install teleport
DOMAIN=tele.example.com
EMAIL=user@example.com
teleport configure --acme --acme-email=${EMAIL?} --cluster-name=${DOMAIN?} | \
sudo tee /etc/teleport.yaml > /dev/null