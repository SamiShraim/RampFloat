          #!/bin/bash
       
          echo "the latest tag is  $1"
          echo "the Current commit tag is  $2"
          RELEASE_VERSION=$1
          A="$(cut -d'-' -f2 <<<${RELEASE_VERSION})"
          if [[ $2 == $1 ]]
          then
            major="$(cut -d'.' -f1 <<<$A)"
            minor="$(cut -d'.' -f2 <<<$A)"
            patch="$(cut -d'.' -f3 <<<$A)"
            major=`echo "ibase=10;obase=16;$major"|bc`
            minor=`echo "ibase=10;obase=16;$minor"|bc`
            patch=`echo "ibase=10;obase=16;$patch"|bc`
            sed -i "/#define version_major/c\#define version_major 0x$major" version.h
            sed -i "/#define version_minor/c\#define version_minor 0x$minor" version.h
            sed -i "/#define version_patch/c\#define version_patch 0x$patch" version.h
            cat 'version.h'
          else
            sed -i '5a #define version_dirty 0x01\' version.h
            cat 'version.h'
          fi


