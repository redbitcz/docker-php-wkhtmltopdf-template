# wkhtmltopdf + fonts + PHP as Docker 

Template container for wkhtmltopdf in HTTP server with PHP.

## Main features
- included `wkhtmltopdf`
- Apache (with `mod_expires`, `mod_headers` and `mod_rewrite` modules)
- PHP (7.4, 8.0, 8.1)
- fixed sub-pixel rendering bug (https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3585)
- installed extended set of fonts (optimized cache incl.)
- optimized for small image size a fast load
- ready to run in serverless environment ([Google Cloud Run](https://cloud.google.com/run/), etc.)

## Download image 
Call command `docker pull redbitcz/wkpdf` ([more info](https://hub.docker.com/r/redbitcz/wkpdf)).

## Template philosophy
This project does not provide finished solution, but only prepared container with
configured features – feel free to write your own app inside now.

## Use for your custom Image
In your Dockerfile put to `FROM` directive [`redbitcz/wkpdf`](https://hub.docker.com/r/redbitcz/wkpdf).

## Usage
In your project create `Dockerfile` file with content:
```dockerfile
FROM redbitcz/wkpdf
COPY . /var/www/html
```

Build your own image with command:
```shell
docker build .
```

You can also debug it with `docker-compose.yml`:
```yaml
version: '3.1'
services:
  web:
    image: redbitcz/wkpdf:debug
    ports:
      - "8080:8080"
    volumes:
      - ".:/var/www/html"
    restart: always
    environment:
      APP_DEBUG: 1
      XDEBUG_CONFIG: "client_host=host.docker.internal"
      PORT: 8080
```

and then run:

```shell
docker compose up
```

### Thanks to
 - @boromino for great [inspiration how to delete more temporary file from container](https://github.com/boromino/php-wkhtmltopdf/blob/master/Dockerfile),
 - @ubidots for their [right way to extending fonts in linux](https://github.com/boromino/php-wkhtmltopdf/blob/master/Dockerfile),
 - @elektro-wolle to goot point in [discussion about wkhtml's rendering bug](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3585#issuecomment-321605209).
