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


qdapTools 1.0.3
----------------------------------------------------------------

**BUG FIXES**

* `lookup` threw an error with single length input `terms` and `missing=NULL`
  (see <a href="https://github.com/trinker/qdapTools/issues/6">issue #6</a> for more).  This behavior has been fixed. 

* `lookup` changed the order of existing `data.frames` because of `data.table`'s
  scoping which modifies data in place.  This was spotted by Kirill Muller (see
  <a href="https://github.com/trinker/qdapTools/issues/7">issue #7</a>) and a solution provided by Matthew Flickinger 
  (<a href="http://stackoverflow.com/a/26046777/1000343)." target="_blank">http://stackoverflow.com/a/26046777/1000343).</a>

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**


qdapTools 1.0.2
----------------------------------------------------------------

**BUG FIXES**

* `lookup` would throw warning and convert to more restrictive mode when 
  (1) `terms` mode and `key.reassign` modes didn't match & (2) `missing = NULL`.
  This behavior has been fixed.  See <a href="https://github.com/trinker/qdapTools/issues/5">issue #5</a>.

**NEW FEATURES**

* `split_vector` added to split a `vector` into a list of vectors based on split 
  points.

**IMPROVEMENTS**

* `list2df` would return `rownames` matching the names of the original list 
  rather than numeric indexes.  `row.names = FALSE` was added to the call to
  `data.frame` to correct this.


qdapTools 1.0.1
----------------------------------------------------------------

**BUG FIXES**

* `pad` did not work consistently across all platforms.  This behavior has been 
  fixed.

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**


qdapTools 1.0.0
----------------------------------------------------------------

This version of `qdapTools` incorporates the `data.table` package.  This 
  provides huge speed boosts within a flexible frame work.  The old behavior of 
  the `lookup` functions was to convert `factor` to `character`.  The latest 
  version does not perform this coercion.  Those relying on this behavior may 
  find their code breaks hence the major bump to version 1.0.0.  Thank you to 
  Arun Srinivasan for his demonstration of the `data.table` package and help in 
  incorporating it into `qdapTools`.

**BUG FIXES**

* `lookup` did not have a method for when `key.match` was a factor;
  `lookup.factor` added.

**NEW FEATURES**

* `lookup` and `hash` families of functions wraps `data.table` package to 
  provide the ease of the lookup binary operators with the speed of the 
  `data.table` package.

* `qdapTools` now uses the `testthat` package to provide unit testing on 
  the package functions.

**IMPROVEMENTS**

* `v_outer` gains a speed boost through optimization optimization, including a 
  suggestion from stackoverflow.com's eddi: 
  <a href="http://stackoverflow.com/users/817778/eddi." target="_blank">http://stackoverflow.com/users/817778/eddi.</a>

* `id` now allows the user to supply a character string prefix via the `prefix` 
  argument.

**CHANGES**

* The `%l*%` binary operator becomes deprecated as its behavior is no longer 
  needed with the inclusion of the `data.table` package.  it will be removed in 
  a subsequent version of `qdapTools`.


qdapTools 0.2.0
----------------------------------------------------------------

This version of <a href="https://github.com/trinker/qdapTools" target="_blank">qdapTools</a> highlights optimization of `lookup` and `v_outer`.
It also adds the `mtabulate` function from the qdap package.  Future development 
will revolve around further optimization of `lookup` and `v_outer`.  `lookup` 
may utilize the **data.table** package to gain speed. 

**IMPROVEMENTS**

* `lookup` and `hash_look` family of functions gains a major speed boost thanks 
  to @Arun Srinivasan.  See: https://gist.github.com/arunsrinivasan/ee2d9ef43bdc02c32958

* `lookup` becomes a generic method that operates on various classes.  This 
  gains a slight speed boost.

* `v_outer` becomes a generic method that operates on various classes.  This 
  gains a slight speed boost.

**CHANGES**

* `mtabulate` moved from `qdap` to `qdapTools`.



qdapTools 0.1.0
----------------------------------------------------------------

This release moves the `list2df` family of functions from `qdap` to <a href="https://github.com/trinker/qdapTools" target="_blank">qdapTools</a>.  
This completes the process of moving generic `qdap` tools into a separate 
qdapTools package.

**CHANGES**

* The `list2df` family of functions have been moved from `qdap` to `qdapTools`.
  These functions include: `list2df`, `matrix2df`, `vect2df`, `list_df2df`, 
  `list_vect2df`, `counts2list`, & `vect2list`.



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
related tasks, have been moved to a separate package, <a href="https://github.com/trinker/qdapTools" target="_blank">qdapTools</a>.  This is the 
first installment of the package.
