# You should prefer an ED25519 key over an RSA one, see https://news.ycombinator.com/item?id=12574510

if ! [[ -f ~/.ssh/id_ed25519 ]]
then ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
else echo "You already have an ED25519 SSH key set up, nothing to do."
fi
