###########
dockerfiles
###########

This is a collection of dockerfiles which are running in my kubernetes_ cluster.

.. code-block:: shell

   $ make help
   A smart Makefile for your dockerfiles

   Read all Dockerfile within the current directory and generate dependendies automatically.

   make all              ; build all images
   make nginx            ; build nginx image
   make push all         ; build and push all images
   make push nginx       ; build and push nginx image
   make run nginx        ; build and run nginx image (for testing)
   make exec nginx       ; build and start interactive shell in nginx image (for debugging)
   make checkrebuild all ; build and check if image has update availables (using apk or apt-get)
                           and rebuild with --no-cache is image has updates

   You can chain actions, typically in CI environment you want make checkrebuild push all
   which rebuild and push only images having updates availables.


.. _kubernetes: https://kubernetes.io/

