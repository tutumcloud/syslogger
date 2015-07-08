FROM gliderlabs/logspout
MAINTAINER support@tutum.co

# Output of: yaml2json tutum.yml | tr "\n" " " | sed 's/"/\\"/g'
LABEL co.tutum.yml="{   \"syslogger\": {     \"image\": \"tutum/syslogger\",     \"restart\": \"on-failure\",     \"volumes\": [       \"/var/run/docker.sock:/tmp/docker.sock\"     ],     \"environment\": [       \"HOSTNAME=$TUTUM_NODE_HOSTNAME\"     ],     \"command\": \"YOUR-URI-HERE\",     \"deployment_strategy\": \"every_node\"   } }"