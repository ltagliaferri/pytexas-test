FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /pytexas

COPY requirements.txt .

RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest

WORKDIR /pytexas

# Make sure you update Python version in path
COPY --from=builder /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages

COPY wolfi.py pytexas.png .

ENTRYPOINT [ "python", "/pytexas/wolfi.py" ]
