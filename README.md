Writing web-applications requires a lot of skills: HTML, CSS, XML, JSON and
Markdown, to name but a few!  This library provides OCaml syntax extensions for
these web formats by:

* extending standard OCaml syntax with embedded web DSLs. It has a
  quotation mechanism which parses HTML, CSS or XML to OCaml, and
  also anti-quotations that form a template mechanism.

* using type-driven code generation to generate markup directly from
  OCaml type declarations. It is possible to mix hand-written and
  generated code to deal with special-cases.  Most of the work is
  done at pre-processing time, so there is no runtime costs and the
  generated OCaml code can be manually inspected if desired.

See more explanation at: http://www.openmirage.org/wiki/cow

This library is in beta, and full documentation is still being written.  Some
repositories which use it include:

* Mirage website: http://github.com/mirage/mirage-www
* Mirage tutorial: http://github.com/mirage/mirage-tutorial
