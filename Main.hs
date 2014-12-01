{-# Language QuasiQuotes #-}

import qualified Data.Map as M
import Data.String.Here.Interpolated (i)
import Text.ParserCombinators.Parsec 
import System.Environment
import Control.Monad (join)
import Data.Either (rights)
import System.Environment (getArgs)
import Debug.Trace

type HS = String
type Pygments = String
type CSS = String
type HS2PMapping = M.Map HS Pygments
type P2CSSMapping = M.Map Pygments CSS
type HS2CSSMapping = M.Map HS CSS

parseLinePygments :: Parser (Pygments, CSS)
parseLinePygments = do 
	char '.'
	x <- many alphaNum
	y <- manyTill anyChar $ char '}'
	return $ ("." ++ x, y ++ ";}")

parseLinesPygments :: String -> P2CSSMapping
parseLinesPygments x = M.fromList $ rights $ 
	map (parse parseLinePygments "parse") $ lines x

convertHStoCSS :: HS2PMapping -> String -> HS2CSSMapping
convertHStoCSS from str =
	M.map lookupCSS from
	where
		mapping :: P2CSSMapping
		mapping = parseLinesPygments str
		lookupCSS :: Pygments -> CSS
		lookupCSS x = M.findWithDefault ("{ color: #000000;}" :: CSS) x mapping

generateCSSFile :: HS2PMapping -> String -> String
generateCSSFile mapping str = [i|
	body ${back}

	pre {
		font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
		font-size: 12px;
		overflow: auto;
	}

	pre ${back}
	pre ${fore}

	${rest}|]

	where
		cssmap = convertHStoCSS mapping str
		back = cssmap M.! "background"
		fore = cssmap M.! "foreground"
		rest = M.foldMapWithKey (\x y -> [i|${x} ${y}
|]) cssmap

main = do
	args <- getArgs
	gh <- readFile $ head args
	mappingstr <- readFile "mapping.txt"
	let mapping = read (join . lines $ mappingstr) :: HS2PMapping
	putStrLn $ generateCSSFile mapping gh