# Start with the base Python container
# FIXME: Update the version
FROM docker.io/python:3.10.13

# Install packages that are required. 
RUN pip install Django==4.2.9 
RUN pip install psutil
RUN pip install psycopg2

# Copy the Python code into the container
COPY mysite /mysite

# Set environment variables 
ENV PORT=8000 
ENV STUDENT_NAME=Richard_Gross
ENV SITE_NAME=www.ultimatefrisbee.com
ENV SECRET_KEY=LLijyUvRlUPONMELnvuHRQ==
ENV DEBUG=1

ENV POSTGRES_DB="mysite"
ENV POSTGRES_USER="mysiteuser"
ENV POSTGRES_PASSWORD="this-is-a-bad-password"
ENV POSTGRES_HOSTNAME="localhost"

# Set the working directory
WORKDIR /mysite 

# Default command to execute in the container
CMD python ./manage.py runserver 0.0.0.0:$PORT
