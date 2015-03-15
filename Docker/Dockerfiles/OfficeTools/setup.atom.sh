##atom.io
add-apt-repository ppa:webupd8team/atom
apt-get update -y
apt-get install atom -y

chown -R developer: /home/developer/.atom

### atom.io packages
apm install markdown-preview-pandoc
apm install angularjs
apm install bower-install
apm install grunt-runner
apm install markdown-helpers
apm install markdown-table-formatter
apm install todo-show
apm install merge-conflicts
