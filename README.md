# msdocs-python-fastapi-webapp-quickstart

[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff)](#run-in-docker)
![Python](https://img.shields.io/badge/Python-3.13-3776AB?logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?logo=fastapi&logoColor=white)
![Uvicorn](https://img.shields.io/badge/Uvicorn-ASGI-000000)
![Jinja2](https://img.shields.io/badge/Jinja2-Templates-B41717?logo=jinja&logoColor=white)
![Azure Container Instances](https://img.shields.io/badge/Azure_Container_Instances-ACI-0078D4?logo=microsoftazure&logoColor=white)
![Azure Container Registry](https://img.shields.io/badge/Azure_Container_Registry-ACR-0078D4?logo=microsoftazure&logoColor=white)
![Azure Developer CLI](https://img.shields.io/badge/Azure_Developer_CLI-azd-0078D4?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyBpZD0idXVpZC1mYmJiZWVkZi03ZjAzLTRkNjItYjBmMC1hNGI2ODljMDQxZDkiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjE4IiBoZWlnaHQ9IjE4IiB2aWV3Qm94PSIwIDAgMTggMTgiPjxkZWZzPjxsaW5lYXJHcmFkaWVudCBpZD0idXVpZC03Y2QwYWU0Ny02NDE0LTRiOTMtYWJjOS1hNzA1MTk3MDEzN2EiIHgxPSI5IiB5MT0iMTYuNjg2IiB4Mj0iOSIgeTI9IjEzLjM3NyIgZ3JhZGllbnRUcmFuc2Zvcm09Im1hdHJpeCgxLCAwLCAwLCAxLCAwLCAwKSIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIG9mZnNldD0iLjAwMSIgc3RvcC1jb2xvcj0iIzM3YzJiMSIgLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMzY2Q0YzIiIC8%2BPC9saW5lYXJHcmFkaWVudD48L2RlZnM%2BPHBhdGggZD0iTTE4LDE2LjY4NkgwbDMuMzMyLTMuMTQ5Yy4xMDgtLjEwMi4yNTEtLjE2LjQtLjE2SDE0LjY4Yy4wODMsMCwuMTY1LC4wMTksLjI0LC4wNTMsLjA3NiwuMDM1LC4xNDMsLjA4NSwuMTk4LC4xNDdsMi44ODIsMy4xMDlaIiBmaWxsPSJ1cmwoI3V1aWQtN2NkMGFlNDctNjQxNC00YjkzLWFiYzktYTcwNTE5NzAxMzdhKSIgLz48cGF0aCBkPSJNMCwxNi42ODZIMTh2LjQxYzAsLjE1NS0uMDYyLC4zMDUtLjE3MiwuNDE0cy0uMjU5LC4xNzItLjQxNCwuMTcySC41ODZjLS4xNTUsMC0uMzA0LS4wNjItLjQxNC0uMTcyLS4xMS0uMTEtLjE3Mi0uMjU5LS4xNzItLjQxNHYtLjQxWiIgZmlsbD0iIzNjZDRjMiIgLz48cGF0aCBkPSJNMTcuNDMsOC42MThjLS4wMjYtLjg5OS0uMzcxLTEuNzU5LS45NzQtMi40MjYtLjYwMy0uNjY3LTEuNDI0LTEuMDk3LTIuMzE2LTEuMjE0LS4wNTItMS4yNTYtLjU5OC0yLjQ0Mi0xLjUyLTMuMjk3LS45MjEtLjg1Ni0yLjE0NC0xLjMxMy0zLjQtMS4yNzMtMS4wMTQtLjAxNy0yLjAwOCwuMjgxLTIuODQ2LC44NTItLjgzOCwuNTcxLTEuNDc5LDEuMzg4LTEuODM0LDIuMzM4LTEuMDc4LC4xMjQtMi4wNzUsLjYzMi0yLjgwOSwxLjQzMS0uNzM0LC43OTktMS4xNTcsMS44MzUtMS4xOTEsMi45MTksLjAxOCwuNjA4LC4xNTYsMS4yMDYsLjQwNywxLjc2LC4yNTEsLjU1NCwuNjA4LDEuMDUzLDEuMDUzLDEuNDY3LC40NDQsLjQxNSwuOTY3LC43MzcsMS41MzcsLjk0OSwuNTcsLjIxMiwxLjE3NiwuMzA4LDEuNzg0LC4yODRIMTMuNjNjMS4wMDMtLjAxLDEuOTYyLS40MTMsMi42NzItMS4xMjEsLjcxLS43MDgsMS4xMTUtMS42NjYsMS4xMjgtMi42NjlaIiBmaWxsPSJ1cmwoI3V1aWQtYjEwMWFlNDUtNDYxYS00ZGU3LWIxYTAtZjNlMjllYTk2Y2M3KSIgLz48cGF0aCBkPSJNNi4zNiw2Ljg2OGwyLjY0LTIuNTljLjAyOC0uMDI5LC4wNjEtLjA1MiwuMDk4LS4wNjcsLjAzNy0uMDE2LC4wNzctLjAyNCwuMTE3LS4wMjRzLjA4LC4wMDgsLjExNywuMDI0Yy4wMzcsLjAxNiwuMDcsLjAzOCwuMDk4LC4wNjdsMi41NywyLjU5Yy4wMjIsLjAxOCwuMDM4LC4wNDMsLjA0NSwuMDcsLjAwNywuMDI4LC4wMDQsLjA1Ny0uMDA3LC4wODMtLjAxMSwuMDI2LS4wMzEsLjA0OC0uMDU2LC4wNjItLjAyNSwuMDE0LS4wNTQsLjAxOS0uMDgyLC4wMTVoLTEuNjJjLS4wMzYsLjAwMi0uMDcxLC4wMTgtLjA5NiwuMDQ0LS4wMjYsLjAyNi0uMDQxLC4wNi0uMDQ0LC4wOTZsLS4wMjEsNS4wNzJjMCwuMDI5LS4wMTIsLjA1Ny0uMDMyLC4wNzgtLjAyMSwuMDIxLS4wNDksLjAzMi0uMDc4LC4wMzJoLTEuNzRjLS4wMjksMC0uMDU3LS4wMTItLjA3OC0uMDMyLS4wMjEtLjAyMS0uMDMyLS4wNDktLjAzMi0uMDc4bC4wMjEtNS4wNzJjMC0uMDM1LS4wMTMtLjA3LS4wMzctLjA5Ni0uMDI0LS4wMjYtLjA1Ny0uMDQyLS4wOTMtLjA0NGgtMS42Yy0uMDI3LC4wMDItLjA1NC0uMDA2LS4wNzctLjAycy0uMDQxLS4wMzYtLjA1MS0uMDYyYy0uMDEtLjAyNS0uMDEyLS4wNTMtLjAwNS0uMDgsLjAwNy0uMDI2LC4wMjItLjA1LC4wNDMtLjA2OFoiIGZpbGw9IiNmMmYyZjIiIC8%2BPC9nPjwvc3ZnPg%3D%3D)
![Bicep](https://img.shields.io/badge/Bicep-IaC-0078D4?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyBpZD0iZTRiYTVkMmItZTZlNC00MTAxLTkzYWMtN2M2YjNkNTY4YTI3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij48ZGVmcz48bGluZWFyR3JhZGllbnQgaWQ9ImJkMmY5NDk0LWQzZmYtNDNiZC1iNTk5LTRlYzE3MGYwOTBiZCIgeDE9IjguNjMiIHkxPSIxNy41OSIgeDI9IjguNjMiIHkyPSIwLjU5IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI%2BPHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjMDA3OGQ0IiAvPjxzdG9wIG9mZnNldD0iMC44MiIgc3RvcC1jb2xvcj0iIzVlYTBlZiIgLz48L2xpbmVhckdyYWRpZW50PjwvZGVmcz48dGl0bGU%2BSWNvbi1nZW5lcmFsLTk8L3RpdGxlPjxwYXRoIGQ9Ik05LjU5LjcySDIuMzZhLjU2LjU2LDAsMCwwLS41Ny41N3YxNS42YS41Ni41NiwwLDAsMCwuNTcuNTdIMTQuODlhLjU3LjU3LDAsMCwwLC41OC0uNTdWNi41NkEuNTguNTgsMCwwLDAsMTQuODksNkgxMC43M2EuNTcuNTcsMCwwLDEtLjU3LS41N1YxLjI5QS41Ni41NiwwLDAsMCw5LjU5LjcyWiIgZmlsbD0iI2ZmZiIgLz48cGF0aCBkPSJNOS4zMywxLjQ1VjUuMzdBMS40MywxLjQzLDAsMCwwLDEwLjc2LDYuOGg0djkuOTNIMi41NFYxLjQ1SDkuMzNNOS42LjU5SDIuMjZhLjU4LjU4LDAsMCwwLS41OC41OFYxN2EuNTguNTgsMCwwLDAsLjU4LjU4SDE1YS41OC41OCwwLDAsMCwuNTgtLjU4VjYuNTNBLjU4LjU4LDAsMCwwLDE1LDZIMTAuNzZhLjU4LjU4LDAsMCwxLS41OC0uNThWMS4xN0EuNTguNTgsMCwwLDAsOS42LjU5WiIgZmlsbD0idXJsKCNiZDJmOTQ5NC1kM2ZmLTQzYmQtYjU5OS00ZWMxNzBmMDkwYmQpIiAvPjxwYXRoIGQ9Ik0xNS4zNSw2LjA2LDEwLC43MlY1LjA3YTEsMSwwLDAsMCwxLDFaIiBmaWxsPSIjMDA3OGQ0IiAvPjwvc3ZnPg%2B)

FastAPI web app exercise for testing **Azure Container Instances (ACI)** and building **containerised solutions on Azure**. The app is packaged as a Docker image, pushed to **Azure Container Registry (ACR)**, and deployed with [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) (`azd`) + Bicep.

## Run locally

Create and activate a virtual environment, install dependencies, and start the app:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```

Open [http://127.0.0.1:8000](http://127.0.0.1:8000).

## Run in Docker

Build and run with Docker Compose (port 8000):

```bash
docker compose up --build
```

Or build and run directly:

```bash
docker build -t fastapi-webapp .
docker run --rm -p 8000:8000 fastapi-webapp
```

Open [http://localhost:8000](http://localhost:8000).

### Stop the container

Press `Ctrl+C` in the terminal running Compose, or:

```bash
docker compose down
```

### Push to Azure Container Registry

ACI runs **linux/amd64** images. On Apple Silicon, build for that platform before pushing:

```bash
az acr login --name <registry-name>
docker buildx build --platform linux/amd64 \
  -t <registry-name>.azurecr.io/fastapi-webapp:<tag> --push .
```

Alternatively, build on ACR's infrastructure (natively amd64, no local emulation):

```bash
az acr build --registry <registry-name> --image fastapi-webapp:<tag> .
```

### Notes

- `docker-compose.yml` targets `linux/amd64` so local builds match what ACI expects in Azure.
- Images built only for `arm64` (default on Apple Silicon without `--platform`) will fail on ACI with an OS/architecture mismatch error.
- The container is for local development and registry practice. Production hosting in this repo is **ACI**, provisioned via `azd provision` below.

## Deploy to Azure (ACI)

Infrastructure provisions an **Azure Container Instance** that pulls your image from an existing ACR using a **managed identity** with `AcrPull`.

### 1. Configure the azd environment

```bash
azd auth login
azd init          # if you have not already
azd env set AZURE_CONTAINER_REGISTRY_NAME <acr-name>
azd env set AZURE_CONTAINER_REGISTRY_RESOURCE_GROUP <acr-resource-group>   # if ACR is not in the deployment RG
azd env set AZURE_CONTAINER_IMAGE_NAME fastapi-webapp                        # optional, default shown
azd env set AZURE_CONTAINER_IMAGE_TAG <tag>                                  # e.g. v1
```

### 2. Push the image to ACR

See [Push to Azure Container Registry](#push-to-azure-container-registry) above.

### 3. Provision ACI

```bash
azd provision
```

After provision, get the public URL:

```bash
azd env get-values | grep SERVICE_WEB_URI
```

The endpoint looks like `http://<dns-label>.<region>.azurecontainer.io:8000`. ACI serves **HTTP** on port **8000** (no built-in HTTPS).

### Update a running container

Push a new image tag (or overwrite an existing one), then re-provision:

```bash
azd env set AZURE_CONTAINER_IMAGE_TAG <new-tag>
azd provision
```

### View in the Azure Portal

| Resource | Portal path |
|----------|-------------|
| Running container | **Container instances** → `ciweb-...` in your deployment resource group |
| Stored images | **Container registries** → your ACR → **Repositories** → `fastapi-webapp` |

Or check from the CLI:

```bash
az container list --resource-group <deployment-rg> -o table
```

## Routes

<details>
<summary><strong>Index</strong> — <code>GET /</code></summary>

Serves the home page (`templates/index.html`) with a form to submit your name.

### Examples

```bash
curl -i http://localhost:8000/
```

</details>

<details>
<summary><strong>Hello</strong> — <code>POST /hello</code></summary>

Accepts a form field `name` and returns a personalised greeting page (`templates/hello.html`).

| Form field | Required | Description |
|------------|----------|-------------|
| `name`     | Yes      | Name to greet |

### Examples

```bash
curl -i -X POST http://localhost:8000/hello -d "name=Emandleni"
```

Blank or missing `name` redirects back to `/`.

</details>

<details>
<summary><strong>Favicon</strong> — <code>GET /favicon.ico</code></summary>

Returns `static/favicon.ico` when present, otherwise `204 No Content`.

</details>

## Troubleshooting

### ACR not found during `azd provision`

**Symptoms**

```
ResourceNotFound: ... Microsoft.ContainerRegistry/registries/<acr-name> ... could not be found
```

**Cause**

Bicep looked for the registry in the deployment resource group, but your ACR lives elsewhere.

**Fix**

```bash
azd env set AZURE_CONTAINER_REGISTRY_RESOURCE_GROUP <acr-resource-group>
az acr list --query "[].{Name:name, ResourceGroup:resourceGroup}" -o table   # find the right RG
azd provision
```

### `InaccessibleImage` when pulling from ACR

**Cause**

ACI could not authenticate to the private registry.

**Fix**

This project's Bicep uses a **user-assigned managed identity** with `AcrPull` on the registry (not ACR admin credentials). Confirm the role assignment exists:

```bash
az role assignment list \
  --scope $(az acr show --name <acr-name> --query id -o tsv) \
  --query "[?roleDefinitionName=='AcrPull'].{Principal:principalId}" -o table
```

Then re-run `azd provision`.

### `ImageOsTypeNotMatchContainerGroup`

**Cause**

The image was built for `arm64` (common on Apple Silicon) but ACI expects `linux/amd64`.

**Fix**

Rebuild and push with the correct platform:

```bash
docker buildx build --platform linux/amd64 \
  -t <registry-name>.azurecr.io/fastapi-webapp:<tag> --push .
azd provision
```

## Project structure

```
msdocs-python-fastapi-webapp-quickstart/
├── main.py
├── requirements.txt
├── startup.sh
├── templates/
│   ├── index.html
│   └── hello.html
├── static/
│   ├── bootstrap/
│   └── images/
├── infra/
│   ├── main.bicep
│   ├── main.parameters.json
│   ├── abbreviations.json
│   └── core/
│       ├── host/
│       │   └── containerinstance.bicep
│       ├── registry/
│       │   └── containerregistry.bicep
│       ├── identity/
│       │   └── userassignedidentity.bicep
│       └── security/
│           └── acr-pull-role-assignment.bicep
├── azure.yaml
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── .github/
    └── workflows/
        └── deploy-appservice.yml
```
