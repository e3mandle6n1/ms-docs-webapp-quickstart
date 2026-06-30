from fastapi import FastAPI, Form, Request, status
from fastapi.responses import HTMLResponse, FileResponse, RedirectResponse, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pathlib import Path
import uvicorn


app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def index(request: Request):
    print('Request for index page received')
    return templates.TemplateResponse('index.html', {"request": request})

@app.get('/favicon.ico')
async def favicon():
    file_path = Path("static/favicon.ico")
    if file_path.exists():
        return FileResponse(path=str(file_path), media_type="image/vnd.microsoft.icon")
    return Response(status_code=status.HTTP_204_NO_CONTENT)

@app.post('/hello', response_class=HTMLResponse)
async def hello(request: Request, name: str = Form(...)):
    if name:
        print('Request for hello page received with name=%s' % name)
        return templates.TemplateResponse('hello.html', {"request": request, 'name':name})
    else:
        print('Request for hello page received with no name or blank name -- redirecting')
        return RedirectResponse(request.url_for("index"), status_code=status.HTTP_302_FOUND)

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', port=8000)

