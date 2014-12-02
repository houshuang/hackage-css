I didn't like the default styling of Hackage source code listings ([like this](https://hackage.haskell.org/package/FileManip-0.3.2/docs/src/System-FilePath-Manip.html)), so I decided to come up with some alternative CSS styles. I generated CSS files for all the built-in [Pygments](http://pygments.org/) themes, which can be found in the `css/` directory. I then wrote a mapping from the Pygments style ids to the Haskell ones, in `mapping.txt` (this is just a Haskell Map that is `read` at runtime). The mapping is not perfect, partly because Pygments and [hscolour](http://www.cs.york.ac.uk/fp/darcs/hscolour/) parse source code differently, but it's good enough to work.

`runhaskell Main.hs input-css mapping` takes a CSS file from Pygments, and the mapping file, and generates a CSS file that works with the code formatted by hscolour. 

I have uploaded all the generated CSS files to [Userstyles.org](https://userstyles.org/styles/browse?search_terms=hackage+code+listing), for easy installation into Chrome or Firefox. You can see previews of the different styles as applied to code on Hackage there, or in the `screenshots/` directory.

/Stian Håklev, December 1, 2014. shaklev@gmail.com, http://reganmian.net/blog/
