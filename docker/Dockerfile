#Copyright (c) 2014-2018 Oracle and/or its affiliates. All rights reserved.
#
#Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This Dockerfile extends the Oracle WebLogic image by creating a sample domain.
#
# Util scripts are copied into the image enabling users to plug NodeManager
# automatically into the AdminServer running on another container.
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run:
#      $ sudo docker build -t 12213-domain-home-image
#
# Pull base image
# ---------------
FROM cpruvost/weblogic:12.2.1.3-developer
#FROM oracle/weblogic:12.2.1.3-developer

# Maintainer
# ----------
MAINTAINER Christophe Pruvost <christophe.pruvost@oracle.com>

ARG CUSTOM_DOMAIN_NAME="${CUSTOM_DOMAIN_NAME:-domain1}"
ARG CUSTOM_ADMIN_PORT="${CUSTOM_ADMIN_PORT:-7001}"  
ARG CUSTOM_MANAGED_SERVER_PORT="${CUSTOM_MANAGED_SERVER_PORT:-8001}"
ARG CUSTOM_DEBUG_PORT="${CUSTOM_DEBUG_PORT:-8453}"
ARG CUSTOM_ADMIN_NAME="${CUSTOM_ADMIN_NAME:-admin-server}"
ARG CUSTOM_ADMIN_HOST="${CUSTOM_ADMIN_HOST:-wlsadmin}"

# WLS Configuration
# ---------------------------
ENV ORACLE_HOME=/u01/oracle \
    PROPERTIES_FILE_DIR="/u01/oracle/properties" \
    DOMAIN_NAME="${CUSTOM_DOMAIN_NAME}" \
    DOMAIN_HOME="/u01/oracle/user_projects/domains/${CUSTOM_DOMAIN_NAME}" \
    ADMIN_PORT="${CUSTOM_ADMIN_PORT}" \
    ADMIN_NAME="${CUSTOM_ADMIN_NAME}" \
    ADMIN_HOST="${CUSTOM_ADMIN_HOST}" \
    MANAGED_SERVER_PORT="${CUSTOM_MANAGED_SERVER_PORT}" \
    MANAGED_SERV_NAME="${MANAGED_SERV_NAME}" \
    DEBUG_PORT="8453" \
    PATH=$PATH:/u01/oracle/oracle_common/common/bin:/u01/oracle/wlserver/common/bin:${DOMAIN_HOME}:${DOMAIN_HOME}/bin:/u01/oracle

# Add files required to build this image
COPY container-scripts/* /u01/oracle/

#Create directory where domain will be written to
USER root

# Install unzip
RUN yum -y install unzip
RUN unzip -o /u01/oracle/autonomous_database_wallet.zip
RUN rm /u01/oracle/sqlnet.ora
RUN mv /u01/oracle/sqlnet.ora.medrec /u01/oracle/sqlnet.ora

#Kris Update due to problem of permission during build
RUN chown oracle:oracle /u01/oracle/*
RUN chmod 777 /u01/oracle/*

RUN chmod +xw /u01/oracle/*.sh && \
    chmod +xw /u01/oracle/*.py && \
    mkdir +xwr ${PROPERTIES_FILE_DIR} && \
    chown -R oracle:oracle ${PROPERTIES_FILE_DIR} && \
    mkdir -p $DOMAIN_HOME && \
    chown -R oracle:oracle $DOMAIN_HOME && \
    chmod -R a+xwr $DOMAIN_HOME

COPY properties/docker-build/domain*.properties ${PROPERTIES_FILE_DIR}/

# Configuration of WLS Domain
RUN /u01/oracle/createWLSDomain.sh && \
    echo ". $DOMAIN_HOME/bin/setDomainEnv.sh" >> /u01/oracle/.bashrc && \
    chmod -R a+x $DOMAIN_HOME/bin/*.sh  && \
    rm ${PROPERTIES_FILE_DIR}/*.properties

# Expose ports for admin, managed server, and debug
EXPOSE $ADMIN_PORT $MANAGED_SERVER_PORT $DEBUG_PORT

WORKDIR $DOMAIN_HOME

# Kris : Add security file
COPY properties/docker-run/security.properties /u01/oracle/properties/security.properties

# Kris : Add Applications Demo
COPY container-scripts/SimpleDemo.war $DOMAIN_HOME/autodeploy/SimpleDemo.war
COPY container-scripts/chat.war $DOMAIN_HOME/autodeploy/chat.war
COPY container-scripts/medrec.ear $DOMAIN_HOME/autodeploy/medrec.ear
COPY container-scripts/physician.ear $DOMAIN_HOME/autodeploy/physician.ear

# Kris : Add Wls ressources for medrec (datasource and jms)
RUN wlst -loadProperties /u01/oracle/datasource.properties.oracle.txt /u01/oracle/MedrecDatasource.py
RUN wlst -loadProperties /u01/oracle/jms.properties.txt /u01/oracle/MedrecJms.py

# Define default command to start bash.
CMD ["startAdminServer.sh"]
