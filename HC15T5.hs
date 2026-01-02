-- HC15T5.hs
-- Division sécurisée avec Maybe

divisionSecurisee :: Double -> Double -> Maybe Double
divisionSecurisee _ 0 = Nothing
divisionSecurisee x y = Just (x / y)

-- Fonction d'affichage du résultat
afficherResultat :: Maybe Double -> IO ()
afficherResultat Nothing  = putStrLn "Erreur : division par zéro"
afficherResultat (Just r) = putStrLn ("Résultat : " ++ show r)

main :: IO ()
main = do
  afficherResultat (divisionSecurisee 10 2)
  afficherResultat (divisionSecurisee 5 0)
