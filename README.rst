=============
VAGRANT BOXES
=============

REQUIREMENTS
============

* Hashicorp packer (will be installed automatically).


BUILD IMAGES
============
Build some basic plain images.

.. code-block:: Bash

  make build

Remove all builded images and cached files.

.. code-block:: Bash

  make clean


USAGE
=====
To use the builded images, you need to add those with vagrant.

.. code-block:: Bash

  for f in *.box; do
      BOX="$(basename "$f" .box)"
      vagrant box add --name "$(echo "$BOX" | cut -d- -f2-)" "${BOX}.box"
  done

After you add the boxes, you can start a box with vagrant like this

.. code-block:: Bash

  vagrant init adsy-debian-8
  vagrant up adsy-debian-8
  vagrant ssh


LICENSE
=======
ISC License

Copyright (c) 2017, Adfinis SyGroup AG

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.


.. vim: set ft=rst sw=2 ts=2 et wrap tw=76:
