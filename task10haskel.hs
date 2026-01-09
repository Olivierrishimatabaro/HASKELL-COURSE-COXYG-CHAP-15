-- HC15T10 : Programme de vitesse utilisant Either et exceptions IO

import Control.Exception (try, IOException)

-- Fonction pure : vérifie les erreurs logiques
computeSpeed :: Double -> Double -> Either String Double
computeSpeed distance time
    | time <= 0 = Left "Le temps doit être strictement positif."
    | distance < 0 = Left "La distance ne peut pas être négative."
    | otherwise = Right (distance / time)

-- Lecture sécurisée d'un nombre
safeRead :: String -> IO (Either String Double)
safeRead prompt = do
    putStrLn prompt
    result <- try getLine :: IO (Either IOException String)

    case result of
        Left _ -> return (Left "Erreur de lecture clavier.")
        Right input ->
            case reads input of
                [(n, "")] -> return (Right n)
                _ -> return (Left "Veuillez entrer un nombre valide.")

main :: IO ()
main = do
    putStrLn "=== Programme de calcul de vitesse ==="

    edistance <- safeRead "Entrez la distance :"
    etime <- safeRead "Entrez le temps :"

    case (edistance, etime) of
        (Right d, Right t) ->
            case computeSpeed d t of
                Right v -> putStrLn ("Vitesse = " ++ show v)
                Left err -> putStrLn ("Erreur logique : " ++ err)

        (Left err, _) -> putStrLn err
        (_, Left err) -> putStrLn err
