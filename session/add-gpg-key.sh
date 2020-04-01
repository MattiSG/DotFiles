read -p "Which email address should be used for this new GPG key? " -r email

key_id=$(gpg --quick-generate-key "Matti Schneider <${email}>" dsa | grep --after 1 pub | tail -1 | tr -d ' ')

gpg --armor --export $key_id | pbcopy

read -p "GPG key ID ${key_id} generated. Public key stored in your clipboard, you should paste it in GitHub / GitLab now. Press any key to continue when it's done! " -n 1 -r
