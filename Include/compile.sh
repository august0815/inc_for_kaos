#To compile kaos
#!/bin/bash
runhaskell Setup.hs configure --prefix=$HOME --user 

runhaskell Setup.hs build 

sudo cp dist/build/inc/inc /usr/local/bin

