# wkhtmltopdf + fonts + PHP as Docker 

Template container for wkhtmltopdf in HTTP server with PHP 7.3.

## Main features
- current version of wkhtmltopdf
- current version of Apache (with `mod_expires` and `mod_rewrite` modules)
- current version of PHP
- fixed sub-pixel rendering bug (https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3585)
- installed extended set of fonts (optimized cache incl.)
- optimized for small image size a fast load
- ready to run in serverless environment ([Google Cloud Run](https://cloud.google.com/run/), etc.)

## Instalation
1. Clone Git repo.
2. In project directory call `docker build -t redbitcz/wkpdf .`
3. Use it.
4. Profit!

## Template philosophy
This project does not provide finished solution, but only prepared container with
configured features – feel free to write your own app inside now.

## Build example
1. Download & install [Docker for you PC](https://www.docker.com/products/docker-desktop). Run it.
2. Open command line and try to call `docker -v` command – that must print version of installed Docker Desktop service.
3. Run `docker build -t redbitcz/wkpdf .` *(don't miss the dot at end)*. Docker now start build new Docker image from current
   directory (especially from [Dockerfile](Dockerfile)) and tag it with name `redbitcz/wkpdf`.

You can also just pull from image [`redbitcz/wkpdf`](https://hub.docker.com/r/redbitcz/wkpdf). 
   
## Usage example
1. Run ``docker run --rm -v `pwd`:/out redbitcz/wkpdf wkhtmltopdf https://docs.docker.com/engine/reference/commandline/run/ /out/example.pdf``,
   Docker create container from your image and here call `wkhtmltopdf` which create new PDF file `example.pdf` from docker's website.
   Contrainer is removed when `wkhtmltopdf` process ended.
2. Open and see new PDF `example.pdf` created in current directory.

##    

### Thanks to
 - @boromino for great [inspiration how to delete more temporary file from container](https://github.com/boromino/php-wkhtmltopdf/blob/master/Dockerfile),
 - @ubidots for their [right way to extending fonts in linux](https://github.com/boromino/php-wkhtmltopdf/blob/master/Dockerfile),
 - @elektro-wolle to goot point in [discussion about wkhtml's rendering bug](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3585#issuecomment-321605209).