#!/bin/sh

cat > index.html <<EOF
<h1>Hello, World</h1>
<h2>This is server for ${server_type}</h2>
EOF

nohup busybox httpd -f -p ${server_port} &