Dell C1760nw driver assets copied from a local backup of a working setup.

This is the minimal subset needed to reproduce the working Dell C1760 USB
queue on `scanny.local` and share it through CUPS/AirPrint.

Required files
--------------

- `foo2zjs/PPD/Dell-C1760.ppd`
- `foo2zjs/foo2hbpl1.c`
- `foo2zjs/foo2hbpl1-wrapper.in`
- `foo2zjs/foo2zjs-pstops.sh`
- `foo2zjs/jbig.c`
- `foo2zjs/jbig.h`
- `foo2zjs/jbig_ar.c`
- `foo2zjs/jbig_ar.h`
- `foo2zjs/hbpl.h`
- `foo2zjs/cups.h`
- `foo2zjs/Makefile`

Why these matter
----------------

- `Dell-C1760.ppd` is the exact C1760 PPD. The packaged Debian driver only
  exposed a `C1765` match, which was close enough to discover and queue jobs
  but still produced `PDL Request Data Violation`.
- `foo2hbpl1-wrapper.in` already contains the patched Dell page-size mappings,
  including `Letter`.
- The working connection is USB, not the printer's Wi-Fi path.

Working queue configuration
---------------------------

The tested working queue on `scanny.local` used:

- URI: `usb://Dell/C1760nw%20Color%20Printer?...`
- PPD/model: `Dell C1760 Foomatic/foo2hbpl1 (recommended)`
- shared via CUPS/AirPrint
- default `ColorMode=Color`
- default `PageSize=Letter`

Build note
----------

Building the full `foo2zjs` tree on newer Debian may fail in the optional
`icc2ps` helper. The core `foo2hbpl1` pieces above are the important parts for
this printer.
