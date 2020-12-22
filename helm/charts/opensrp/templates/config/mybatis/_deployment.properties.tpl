{{- define "config.mybatis.deployment.properties" }}
#
#    Copyright 2010-2016 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

## Base time zone to ensure times are consistent across machines
time_zone={{ .Values.time_zone }}

## The character set that scripts are encoded with
# script_char_set=UTF-8

## JDBC connection properties.
driver=org.postgresql.Driver
driver_path=/migrations/drivers/postgresql-42.2.1.jar
url="jdbc:postgresql://{{ .Values.postgres.host }}:{{ .Values.postgres.port }}/{{ .Values.postgres.database }}"
username="{{ .Values.postgres.username }}"
password="{{ .Values.postgres.password }}"

#
# A NOTE ON STORED PROCEDURES AND DELIMITERS
#
# Stored procedures and functions commonly have nested delimiters
# that conflict with the schema migration parsing.  If you tend
# to use procs, functions, triggers or anything that could create
# this situation, then you may want to experiment with
# send_full_script=true (preferred), or if you can't use
# send_full_script, then you may have to resort to a full
# line delimiter such as "GO" or "/" or "!RUN!".
#
# Also play with the autocommit settings, as some drivers
# or databases don't support creating procs, functions or
# even tables in a transaction, and others require it.
#

# This ignores the line delimiters and
# simply sends the entire script at once.
# Use with JDBC drivers that can accept large
# blocks of delimited text at once.
send_full_script=true

# This controls how statements are delimited.
# By default statements are delimited by an
# end of line semicolon.  Some databases may
# (e.g. MS SQL Server) may require a full line
# delimiter such as GO.
# These are ignored if send_full_script is true.
delimiter=;
full_line_delimiter=false

# If set to true, each statement is isolated
# in its own transaction.  Otherwise the entire
# script is executed in one transaction.
# Few databases should need this set to true,
# but some do.
auto_commit=true

# Custom driver path to allow you to centralize your driver files
# Default requires the drivers to be in the drivers directory of your
# initialized migration directory (created with "migrate init")
# driver_path=

# Name of the table that tracks changes to the database
changelog=CHANGELOG

# Migrations support variable substitutions in the form of ${variable}
# in the migration scripts.  All of the above properties will be ignored though,
# with the exception of changelog.
# Example: The following would be referenced in a migration file as ${ip_address}
# ip_address=192.168.0.1

core_tablespace="{{ .Values.mybatis.core_tablespace }}"
error_tablespace="{{ .Values.mybatis.error_tablespace }}"
schedule_tablespace="{{ .Values.mybatis.schedule_tablespace }}"
feed_tablespace="{{ .Values.mybatis.feed_tablespace }}"
form_tablespace="{{ .Values.mybatis.form_tablespace }}"
{{- end }}