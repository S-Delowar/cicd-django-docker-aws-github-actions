# Pull a base image
FROM python:3.11-slim-bullseye

# Set environemnt variables
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev

# Install project dependencies
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy object files
COPY . .

RUN python manage.py migrate
RUN python manage.py collectstatic --noinput

# Expose application port
# EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]