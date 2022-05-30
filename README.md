# How to generate the site?

Prerequisites:

1. [gomplate](https://github.com/hairyhenderson/gomplate/releases)
2. [html-minifier](https://www.npmjs.com/package/html-minifier)
3. [convert](https://imagemagick.org/) -- `apt install imagemagick`


Steps:

1. Download and extract photos from Tecent Weiyun -> 链接：https://share.weiyun.com/fiBmg4gd 密码：`xskjbe` to `~/Downloads/anjie_2020`
2. Clone the repo to `~/mc/anjieart.github.io` and `~/mc/anjieart.github.io_dev`
3. Go to `~/mc/anjieart.github.io_dev` and checkout `develop`
4. Run `run.sh`


Caverts:

Since `manifest_home.yaml` and `manifest.yaml` have been manually edited, do not run `./proc_images.sh` any more.


Domain info can be queried via https://who.is/whois/anjieart.com
