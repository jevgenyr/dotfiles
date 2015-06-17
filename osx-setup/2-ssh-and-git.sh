# 2 Generate SSH Key and install git

brew install git

ssh-keygen -t rsa

echo <<EOF
##########################

  Ok now run:

    cat ~/.ssh/id_rsa.pub | pbcopy

  And:

  - Add key to github
  - Add key to Heroku

##########################
EOF

cat ~/.ssh/id_rsa.pub | pbcopy
