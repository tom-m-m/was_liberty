FROM docker.io/ibmcom/websphere-liberty:kernel-java8-openj9-ubi

# Add my app and config
COPY --chown=1001:0  Sample1.war /config/dropins/
COPY --chown=1001:0  server.xml /config/

# Add interim fixes (optional)
COPY --chown=1001:0  interim-fixes /opt/ibm/fixes/

# Default setting for the verbose option
ARG VERBOSE=false

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
RUN configure.sh
