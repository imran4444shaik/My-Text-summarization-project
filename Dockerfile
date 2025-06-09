FROM python:3.8-slim-buster

# 1. Install AWS CLI up front
RUN apt-get update -y \
 && apt-get install -y awscli \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Copy only requirements first (so this layer is re-used if your code changes but deps don’t)
COPY requirements.txt /app/

# 3. Upgrade pip and install all pinned deps in one shot
RUN python3 -m pip install --upgrade pip \
 && pip install -r requirements.txt

# 4. Copy your application code
COPY . /app

# 5. Expose port (if you’re running a web server)
#    EXPOSE 8080

# 6. Default command
CMD ["python3", "app.py"]
