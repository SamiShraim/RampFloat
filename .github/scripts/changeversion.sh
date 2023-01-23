          echo "the Release_version is  ${RELEASE_VERSION} "
          echo ${{ env.RELEASE_VERSION }}
          A="$(cut -d'-' -f2 <<<${RELEASE_VERSION})"
          B="$(cut -d'-' -f3 <<<${RELEASE_VERSION})"
          major="$(cut -d'.' -f1 <<<$A)"
          minor="$(cut -d'.' -f2 <<<$A)"
          patch="$(cut -d'.' -f3 <<<$A)"
          sed -i "/#define version_major/c\#define version_major 0x$major" version.h
          sed -i "/#define version_minor/c\#define version_minor 0x$minor" version.h
          sed -i "/#define version_patch/c\#define version_patch 0x$patch" version.h
          cat 'version.h'