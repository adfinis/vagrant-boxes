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

.. vim: set ft=rst sw=2 ts=2 et wrap tw=76:
