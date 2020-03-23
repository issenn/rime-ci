#!/bin/bash


get_app_version() {
  sed -n '/CFBundleVersion/{n;s/.*<string>\(.*\)<\/string>.*/\1/;p;}' $@
}
app_version="$(get_app_version 'rime/squirrel/Info.plist')"

package_name='squirrel'
version_name="${BINTRAY_PACKAGE_VERSION}"
version_desc="鼠鬚管 ${version_name}"
publish=true

sed "{
  s/{{package_name}}/${package_name}/g
  s/{{version_name}}/${version_name}/g
  s/{{version_desc}}/${version_desc}/g
  s/{{publish}}/${publish}/g
}" travis-deploy-squirrel-package-release.json.template > travis-deploy-squirrel-package-release.json

mv rime/squirrel/package/archives/Squirrel-${app_version}.zip ./Squirrel-${FILE_VERSION}.zip
