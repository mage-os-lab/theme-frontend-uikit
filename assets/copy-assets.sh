cp node_modules/uikit/dist/js/uikit.min.js ../web/js/uikit/uikit.min.js
cp node_modules/uikit/dist/js/uikit-icons.min.js ../web/js/uikit/uikit-icons.min.js

cp -R node_modules/uikit/src/js/components/ ../web/js/uikit/components/
cp -R node_modules/uikit/src/less/* ../web/css/uikit/
cp -R ../web/css/images/ ../web/images/
cd ../web/css/uikit/ && for f in *.less; do if [[ "$f" != *"_"* ]]; then mv -- "$f" "_$f"; fi done
rm _uikit.theme.less
rm -rf theme
cd components && for f in *.less; do if [[ "$f" == *"_"* ]]; then sed -i -e 's/@import "/@import "_/' $f; fi done && for f in *.less; do if [[ "$f" != *"_"* ]]; then mv -- "$f" "_$f"; fi done && echo "//svg-fill function removed and overwritten" > _mixin.less
