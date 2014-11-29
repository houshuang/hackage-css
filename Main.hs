{-# Language QuasiQuotes #-}

import qualified Data.Map as M
import Data.String.Here.Interpolated (i)

hs2pygments = M.fromList [
	("background", ".hll"),
	("foreground", ".w"), -- whitespace
	(".hs-keyglyph", ".p"),
	(".hs-layout", ".o"),
	(".hs-keyword", ".k"),
	(".hs-comment", ".c"),
	(".hs-comment a", ".c"),
	(".hs-str", ".s"),
	(".hs-chr", ".s"),
	(".hs-keyword", ".k"),
	(".hs-conid", ".nc"),
	(".hs-varid", ".nf"),
	(".hs-conop", ".p"),
	(".hs-varop", ".p"),
	(".hs-num", ".m"),
	(".hs-cpp", ".kr"),
	(".hs-sel", ""),
	(".hs-definition", ".kd")]

preamble :: String -> String -> String
preamble fore back = 
	[i|
body {
	background-color: ${fore};
}

.pre {
	font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
	font-size: 12px;
	color: ${back};
	overflow: auto;
	border: 10px solid ${back};
}|]

main = undefined