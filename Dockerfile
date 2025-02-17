
# Use an official Python runtime as a parent image
FROM python:3.6-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN mkdir ~/.pip && \
    cd ~/.pip/  && \
    echo "[global] \ntrusted-host =  pypi.douban.com \nindex-url = http://pypi.douban.com/simple" >  pip.conf
RUN pip install --trusted-host pypi.python.org cassandra-driver -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME MNIST-FLASK

# Run app.py when the container launches
CMD ["python", "app.py"]
