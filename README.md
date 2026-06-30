# FastAPI Web App

A lightweight FastAPI app with server-rendered HTML pages, static assets, and Azure deployment support via `azd`.

## Tech Stack

- Python + FastAPI
- Jinja2 templates
- Bootstrap (local static assets)
- Azure App Service (via Azure Developer CLI)

## Run Locally

1. Create and activate a virtual environment.
2. Install dependencies:

   `pip install -r requirements.txt`

3. Start the app:

   `uvicorn main:app --reload`

4. Open:

   [http://127.0.0.1:8000](http://127.0.0.1:8000)

## Deploy to Azure

1. Sign in and provision/deploy:

   `azd up`

2. For subsequent deployments:

   `azd deploy`

## Project Structure

- `main.py` FastAPI entrypoint and routes
- `templates/` HTML templates
- `static/` CSS, JS, and image assets
- `infra/` Azure infrastructure definitions
