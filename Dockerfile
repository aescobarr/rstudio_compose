FROM rocker/rstudio:latest

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Ensure the entrypoint script is used
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
