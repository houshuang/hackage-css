# Better CSS styling for Hackage source-code listings
![](http://i.imgur.com/6oiFkTk.png)

<img align=right src=http://i.imgur.com/jt9UUkD.png></img>I didn't like the default styling of Hackage source code listings ([like this](https://hackage.haskell.org/package/FileManip-0.3.2/docs/src/System-FilePath-Manip.html)), so I decided to come up with some alternative CSS styles. I generated CSS files for all the built-in [Pygments](http://pygments.org/) themes, which can be found in the `css/` directory. I then wrote a mapping from the Pygments style ids to the Haskell ones, in `mapping.txt` (this is just a Haskell Map that is `read` at runtime). The mapping is not perfect, partly because Pygments and [hscolour](http://www.cs.york.ac.uk/fp/darcs/hscolour/) parse source code differently, but it's good enough to work.

`runhaskell Main.hs input.css mapping` takes a CSS file from Pygments, and the mapping file, and generates a CSS file that works with the code formatted by hscolour. 

I have uploaded all the generated CSS files to [Userstyles.org](https://userstyles.org/styles/browse?search_terms=hackage+code+listing), for easy installation into Chrome or Firefox. You can see previews of the different styles as applied to code on Hackage there, or in the `screenshots/` directory, or below.

|Style|Preview|
|-----|------|
|autumn|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/autumn.png)|
|borland|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/borland.png)|
|bw|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/bw.png)|
|colorful|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/colorful.png)|
|default|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/default.png)|
|emacs|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/emacs.png)|
|friendly|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/friendly.png)|
|fruity|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/fruity.png)|
|manni|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/manni.png)|
|monokai|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/monokai.png)|
|murphy|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/murphy.png)|
|native|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/native.png)|
|pastie|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/pastie.png)|
|perldoc|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/perldoc.png)|
|tango|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/tango.png)|
|trac|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/trac.png)|
|vs|	![](https://raw.githubusercontent.com/houshuang/hackage-css/master/screenshots/vs.png)|
