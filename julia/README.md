# Deploy Julia Code to AWS Lambda

This repository is based on [aws-lambda-container-julia](https://github.com/tk3369/aws-lambda-container-julia/tree/main). I adapted it for the newest Julia version and for using SysImages in the container. 

## Test Lambda Function Locally

### Step 1: Build Docker Image

```
make docker
```

or 

```
docker build . -f container/Dockerfile.lambda -t julia_lambda_container:latest
```

### Step 2: Run Docker Image

```
docker run -p 9000:8080 julia_lambda_container:latest
```

### Step 2: Query Running Docker Image

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations"
```

With parameter:

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d "{"""msg""":"""hello"""}"
```

## Deploy Docker Container




## Customization

1. The module name of the module `JuliaLambda` in the custom code file, in this example `JuliaLambda.jl`, must be the same as the the last line of the Dockerfile `CMD [ "JuliaLambda.handle_event" ]`, else the include in the entry file `main.jl` will not work.
2. The custom code file name must also match, e.g. `JuliaLambda.jl`.
3. The `JuliaLambda.jl` must be in the `src` directory.
