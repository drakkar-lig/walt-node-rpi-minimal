## Minimalistic raspberry pi images for WalT platform

### 0 Preface
#### 0.1 Models concerned
#####  Raspberry pi b, b+, 2b, 3b.

### 1 Building image
#### 1.1 Build using Makefile
#####  Command : make
#### 1.2 Publish (push) the image to Docker using Makefile
#####  Command : make publish

### 2 Using image
#### 2.1 Cloning (pulling) image
#####  Command : walt image clone --force hub:waltplatform/rpi-b-plus-minimal
#### 2.2 Deploying image
#####  Command : walt node deploy rpi-C3 rpi-b-plus-minimal
#### 2.3 Using remote image
#####  Command : walt node shell rpi-C3
#####  Command : walt node run rpi-C3 /bin/sh
######  Commands above are equivalent
######  They allow to use directly the node
#####  Command : walt image shell rpi-b-plus-minimal
######  This command runs the image itself
