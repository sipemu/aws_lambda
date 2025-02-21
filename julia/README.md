# Julia in AWS Lambda

This repository is based on [aws-lambda-container-julia](https://github.com/tk3369/aws-lambda-container-julia/tree/main). I adapted it for the newest Julia version and for using SysImages in the container. 

---

# Project Name

Project description. 

## Business Impact

Business impact description.

## Input

Input parameter description.
```
{
    "d_params": {  },
    ...
}
```

### Input Variables

| variable | type(s) | value(s)/description | required? |
| ----- | ----- | ----- | ----- |
| d_params | dict | ... | :white_check_mark: |

### Environment Variables
 
All necessary credentials are provided by the AWS lambda execution role. Add your own project related notes.

## Output

Project output description.

---

### Structure

The project structure is displayed below:

- [container/](/container/)
  - [Dockerfile.lambda](/container/Dockerfile.lambda) 
- [data/](/data/) Data needed for building the SysImage and/or for local testing (Optional)
- [precompile](/precompile/)
  - ... **TBD**
- [src/](/src/) Custom julia code.
  - [JuliaLambda.jl](/src/JuliaLambda.jl) Entry point for custom Julia code.
  - ... (other scripts)
- [CHANGELOG.md](/CHANGELOG.md)
- [main.jl](/main.jl) (starting point with lambda_handler)
- [pyproject.toml](/pyproject.toml) (Collective configuration file: pytest, isort, etc.)
- [README.md](/README.md)

#### Notes

1. The module name of the module `JuliaLambda` in the custom code file, in this example `JuliaLambda.jl`, must be the same as the the last line of the Dockerfile `CMD [ "JuliaLambda.handle_event" ]`, else the include in the entry file `main.jl` will not work.
2. The custom code file name must also match, e.g. `JuliaLambda.jl`.

---

## Local Build & Testing

### Local Environment


### Docker

#### Step 1: Build Docker Image

```
make docker
```

or 

```
docker build . -f container/Dockerfile.lambda -t julia_lambda_container:latest
```

#### Step 2: Run Docker Image

```
docker run -p 9000:8080 julia_lambda_container:latest
```

#### Step 3: Query Running Docker Image

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations"
```

For using parameters the flag `-d` must be added. JSON structure as inputs is preferred.

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d "{1000}"
```

## Testing

**TBD**

## Deploy Docker Container

**TBD**