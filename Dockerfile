FROM python:3.12-slim

WORKDIR /app

# Copy only requirements to cache them in docker layer
COPY pyproject.toml poetry.lock ./

# Install poetry
RUN pip install poetry

# Project initialization:
RUN poetry config virtualenvs.create false \
    && poetry install --only main --no-interaction --no-ansi

# Creating folders, and files for a project:
COPY . .

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
