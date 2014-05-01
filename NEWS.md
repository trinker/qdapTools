NEWS 
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch

qdapTools 0.0.4
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**



qdapTools 0.0.3
----------------------------------------------------------------

**NEW FEATURES**

* `id` a function to generate a sequence of integers the `length`/`nrow` of an 
  object.

* `pad` a convenience wrapper for `sprintf` that pads the front end of strings 
  with spaces or 0s.


qdapTools 0.0.2
----------------------------------------------------------------

First push to CRAN.

* `%l*%` added as a binary operator form of `lookup` that returns a factor when 
  one is supplied in column 2 of the `key.match` `data.frame` supplied. 
  Suggestion by Kirill Muller see: 
  https://github.com/trinker/qdap/issues/167#issuecomment-41009219

qdapTools 0.0.1
----------------------------------------------------------------

Tools used by qdap that may be of use outside of the context of text analysis 
realated tasks, have been moved to a separate package, <a href="https://github.com/trinker/qdapTools" target="_blank">qdapTools</a>.  This is the 
first installment of the package.
