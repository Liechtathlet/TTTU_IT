#atom.io
##Define variables and paths
#TMP_DIR=/tmp

add-apt-repository ppa:webupd8team/atom
apt-get update -y
apt-get install atom -y

#wget -O $TMP_DIR/atom.deb https://atom.io/download/deb
#dpkg -i $TMP_DIR/atom.deb

chown -cR developer: /home/developer/.atom

### atom.io packages
apm install markdown-preview-pandoc
apm install angularjs
apm install bower-install
apm install grunt-runner
apm install markdown-helpers
apm install markdown-table-formatter
apm install todo-show
apm install merge-conflicts
apm install numeric-aggregators
apm install language-latex
apm install latexer
apm install pandoc
apm install texlicious
apm install hex
apm install atom-terminal-panel
