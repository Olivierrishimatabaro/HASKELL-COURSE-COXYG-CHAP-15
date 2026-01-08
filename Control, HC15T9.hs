
import Control.Exception (try, IOException)

main :: IO ()
main = do
    putStrLn "Tentative de lecture du fichier test.txt..."

    result <- try (readFile "test.txt")
              :: IO (Either IOException String)

    case result of
        Right contenu -> do
            putStrLn "Lecture réussie :"
            putStrLn contenu

        Left _ -> do
            putStrLn "Erreur : impossible de lire le fichier."
            putStrLn "Vérifiez que le fichier existe et que vous avez les droits."
