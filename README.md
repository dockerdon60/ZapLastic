# ZapLastic
zaproxy plus elasticsearch

## Base Image:
oraclelinux

## build:
Run the provided build.sh script.

## run:
Use the provided run.sh script.

## Notes:
Switched from oraclelinux:7-slim to oraclelinux as the base image
because the 7-slim image was missing the daemon executable.
Unable to determine which package provides daemon so couldn't install it.
