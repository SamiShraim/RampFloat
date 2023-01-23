          #!/bin/bash
       
          echo "the Release_version is  $1 "
          RELEASE_VERSION=$1
          A="$(cut -d'-' -f2 <<<${RELEASE_VERSION})"
          B="$(cut -d'-' -f3 <<<${RELEASE_VERSION})"
          if [[ $B == "" ]]
          then
            tag=$(git describe --tags --abbrev=0)
            echo " this is it $tag "
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
              echo "Not the mps179 Release"
          fi


