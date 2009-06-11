module Inc where

--import Directory

import System.IO
 
 
         
includin :: [Char] -> IO ()         
includin kk = do
	 h <- pre kk
	 finclude h
	 putStr "Fertig"
	 
pre :: [Char] -> IO Handle	 
pre fn = mustopen fn ReadMode



cat :: [[Char]] -> IO ()
cat ffs = do

    catt ffs
  where
    catt [] = return ()
    catt (f:fs) = do
      includin f
      catt fs
            
-- finclude :: Handle -> IO ()
finclude :: Handle -> IO ()
finclude h =
    do
      text <- hGetContents h
      
      mapM_ doLine $ lines text 
      
    where
      -- doLine :: String -> IO ()
      doLine lin = if first == "#include"
                    then do
                    	  h' <- mustopen (dequote second) ReadMode
                          finclude h'
                          hClose h'
                    else  do
                    appendFile "tmp" (lin ++ "\n")  
                    --putStrLn lin
                    
          where
            (first, second) = twoWords $ words lin
			
            dequote :: String -> String
            dequote ('"':s) | (last s) == '"' = init s
            dequote s = s



-- mustopen :: String -> IOMode -> IO Handle
mustopen :: [Char] -> IOMode -> IO Handle
mustopen fn mode = openFile fn mode `catch` printError
    where
    printError = error $ fn ++ ": cannot open file"

close :: Handle -> IO ()
close = hClose
-- 
 -- 
--twoWords  :: [String] -> (String, String)
twoWords :: [[Char]] -> ([Char], [Char])
twoWords (a:b:_) = (a,b)
twoWords _ = ("","");
