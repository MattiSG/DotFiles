# See https://sixcolors.com/post/2020/11/quick-tip-enable-touch-id-for-sudo/
sudo echo 'auth       sufficient     pam_tid.so' >> /etc/pam.d/sudo