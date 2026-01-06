-- HC15T8 : Division sécurisée avec Either et messages d'erreur

-- Parsing sécurisé avec message d'erreur
safeReadDoubleE :: String -> Either String Double
safeReadDoubleE s =
  case reads s of
    [(x, "")] -> Right x
    _         -> Left ("Erreur de parsing : '" ++ s ++ "' n'est pas un nombre valide")

-- Division sécurisée avec message d'erreur
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Erreur : division par zéro impossible"
safeDivide x y = Right (x / y)

-- Combinaison
computeDivide :: String -> String -> Either String Double
computeDivide aStr bStr = do
  a <- safeReadDoubleE aStr
  b <- safeReadDoubleE bStr
  safeDivide a b

-- Programme principal avec valeurs fixes
main :: IO ()
main =
  case computeDivide "100" "20" of
    Right result -> putStrLn ("Résultat = " ++ show result)
    Left errMsg  -> putStrLn errMsg
