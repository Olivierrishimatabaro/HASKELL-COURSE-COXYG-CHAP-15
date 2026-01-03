import Text.Read (readMaybe)

main :: IO ()
main = do
    putStrLn "Entrez un nombre :"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Just n  -> putStrLn ("Nombre valide : " ++ show n)
        Nothing -> putStrLn "Entrée invalide. Veuillez entrer un nombre entier."
