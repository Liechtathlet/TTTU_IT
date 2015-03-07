
#!/usr/bin/env runhaskell
import Text.Pandoc.JSON
import Text.Pandoc
import Text.Pandoc.Shared
import System.Process (readProcess)
import Data.Char (ord)
-- from the utf8-string package on HackageDB:
import Data.ByteString.Lazy.UTF8 (fromString)
-- from the SHA package on HackageDB:
import Data.Digest.Pure.SHA
import System.Directory (createDirectoryIfMissing)
-- This plugin allows you to include a graphviz "dot" diagram
-- in a document like this:

main :: IO ()
main = toJSONFilter transform

transform :: Block -> IO Block
transform (CodeBlock (id, classes, namevals) contents) | "neato" `elem` classes = do
  let (name, outfile) =  case lookup "name" namevals of
                                Just fn   -> ([Str fn], "./images/neato_" ++ fn ++ ".png")
                                Nothing   -> ([], "./images/neato_" ++  uniqueName contents ++ ".png")
  createDirectoryIfMissing True "./images"
  --writeFile dotfile contents
  result <- readProcess "neato" ["-Tpng", "-o" ++ outfile] contents
  --writeFile outfile "Test"
  return $ Para [Image name (outfile, "")]
transform x = return x

-- | Generate a unique filename given the file's contents.
uniqueName :: String -> String
uniqueName = showDigest . sha1 . fromString
