# tutum/syslogger

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Image based on gliderlabs/logspout optimized for syslog and Tutum

## Usage

    docker-compose run -d -e HOSTNAME=<YOUR-HOSTNAME> syslogger "<YOUR-URI>"

replacing `<YOUR-HOSTNAME>` with the name you want it to appear in your managment service and `<YOUR-URI>` with the URI you will like to send your logs to.

### Example using Papertrail

    docker-compose run -d -e HOSTNAME=<YOUR-HOSTNAME> syslogger "syslog://<YOUR-PAPERTRAIL-URI>"

replacing `<YOUR-PAPERTRAIL-URI>` with your own papertrail URI. An example of Papertrail URI can be `logs.papertrailapp.com:55555`.

### Example using Loggly

    docker-compose run -d -e HOSTNAME=<YOUR-HOSTNAME> syslogger "syslog://logs-01.loggly.com:514?structured_data=<YOUR-CUSTOMER-TOKEN>@41058"

replacing `<YOUR-CUSTOMER-TOKEN>` with the customer token that you can find on "Source Setup"->"Customer Tokens".

## Notes

* Syslogger is a log router for Docker containers that runs inside Docker. It attaches to all containers on a host, then routes their logs wherever you want. 
* Right now it can capture stdout and stderr.
* Syslogger will gather logs from all containers that are started **without the -t option**.

## Ignoring specific containers

Syslogger can ignore specific containers by setting an enviroment variable in the container you want it to ignore.

    docker run -d -e 'LOGSPOUT=ignore' <name-image>