##pandoc
#RUN add-apt-repository -y ppa:hvr/ghc
#RUN add-apt-repository ppa:justinbogner/haskell-platform -y
#RUN apt-get update -y
#RUN apt-get install ghc-head -y
#RUN apt-get install cabal-install-head -y
apt-get install haskell-platform -y
cabal update
cabal install pandoc pandoc-citeproc

#TODO: Either modify atom for env or set config for pandoc path / copy config.cson from .atom
#TODO: set pandoc path into path
# export PATH=$PATH:~/.cabal/bin

##create movable executable
cabal install hsb2hs
cabal install --flags="embed_data_files" pandoc pandoc-citeproc

#RUN apt-get purge haskell-platform -y
