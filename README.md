# wkhtmltopdf + fonts + PHP as Docker 

Template container for wkhtmltopdf in HTTP server with PHP 7.3.

## Main features
- current version of wkhtmltopdf
- current version of PHP
- fixed sub-pixel rendering bug (https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3585)
- installed extended set of fonts (optimized cache incl.)
- optimized for small image size a fast load
- ready to run in server-less environment ([Google Cloud Run](https://cloud.google.com/run/), etc.)

## Instalation
1. Clone Git repo
2. In project call `docker build .`
3. Use it
4. Profit!

## Template philosophy
This project does not provide finished solution, but only prepared container with
configured features – feel free to write your own app inside now.