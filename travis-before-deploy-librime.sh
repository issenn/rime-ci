#!/bin/bash


package_name='librime'
version_name="${BINTRAY_PACKAGE_VERSION}"
version_desc="中州韻 ${version_name}"
publish=true

sed "{
  s/{{package_name}}/${package_name}/g
  s/{{version_name}}/${version_name}/g
  s/{{version_desc}}/${version_desc}/g
  s/{{publish}}/${publish}/g
}" travis-deploy-librime-package-release.json.template > travis-deploy-librime-package-release.json

mv rime/librime/${RIME_VARIANT:-rime}-${FILE_VERSION}-${TRAVIS_OS_NAME}.zip .
