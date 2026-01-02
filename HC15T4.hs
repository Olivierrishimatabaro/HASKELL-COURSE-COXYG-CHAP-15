


import Control.Exception

data FeuException = FeuInvalide String
  deriving Show

instance Exception FeuException

etatFeu :: String -> IO ()
etatFeu "rouge"  = putStrLn "Stop"
etatFeu "orange" = putStrLn "Attention"
etatFeu "vert"   = putStrLn "Avancez"
etatFeu x        = throw (FeuInvalide x)

gestionFeu :: String -> IO ()
gestionFeu feu =
  catch (etatFeu feu) handler
  where
    handler :: FeuException -> IO ()
    handler (FeuInvalide x) =
      putStrLn ("Erreur : feu inconnu -> " ++ x)

main :: IO ()
main = do
  gestionFeu "vert"
  gestionFeu "bleu"
