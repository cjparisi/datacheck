---
title: "Release note: datacheck 1.2.2"
author: "Reinhard Simon"
date: "Friday, April 17th, 2015"
output: pdf_document
---

Summary
========

Datacheck provides functions to check variables against a
    set of data quality rules. A rule file can be accompanied by look-up tables. In
    addition, there are some convenience functions that may
    serve as an example for defining clearer 'data rules'. An
    HTML based user interface facilitates initial exploration of the
    functionality.

This is a release with some performance improvements (thanks to Ze Loff) and introducing a more consistent naming convention for all functions. The former function names are still functional but are being deprecated.

Requirements
-----------
- R version 3.1.2 (recommended: latest R version)

New features
----
None.


Changes
------

All function names that consist of several words now separate them with an underscore rather than the former mixture of dots and camelcase; e.g. is.oneOf becomes is_one_of.

The link to the online demo has been removed since that server is being decommissioned. When the transition to the new server is being finalized the link will be available via the source code download site below.

Bug fixes
--------
* Non-existent or empty rule files are not accepted any more by read_rules.

Acknowledgements
-----------

Thanks to Jose Francisco Loff for contributing improvements.


Download & source code
========
http://cran.r-project.org/web/packages/datacheck/index.html




