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

- [function_module/](/function_module/)
  - [io/](/function_module/io/) (external services)
    - [aws.py](/function_module/io/aws.py) (generic AWS services)
  - [logic/](/function_module/logic/) (internal logic)
    - [decorator.py](/function_module/logic/decorator.py) (aws_lambda decorator)
    - [functions.py](/function_module/logic/functions.py) (general functions)
  - [logger.py](/function_module/logger.py) (standard logging utility)
  - [data_preparation.py](/function_module/data_preparation.py) (Data preparation functionality)
  - [forecasting.py](/function_module/forecasting.py) (FESTO cost center forecasting models.)
  - [utils.py](/function_module/utils.py) (Custom function for preparing cost center data and feature engineering.)
  - [write_data.py](/function_module/write_data.py) (Excel wranglers.)
- [requirements/](/requirements/) (dependencies)
  - [base.txt](/requirements/base.txt) (dependencies which are used in development & production)
  - [development.txt](/requirements/development.txt) (dependencies for local development & testing)
  - [production.txt](/requirements/production.txt) (further dependencies which are ultimately required for running the lambda successfully)
- [scripts](/scripts/)
  - [\_\_\_build_and_push_image_local.sh](/___build_and_push_image_local.sh) (build image local and push image to ECR)
  - [\_\_\_build_image_local.sh](/___build_image_local.sh) (build image local)
  - ... (other scripts)
- [tests/](/tests/) (pytest)
  - [conftest.py](/tests/conftest.py) (Fixtures/variables for tests)
  - ... (remaining tests)
- [.pylintrc](/.pylintrc) (Pylint settings)
- [CHANGELOG.md](/CHANGELOG.md)
- [Dockerfile](/Dockerfile)
- [main.py](/main.py) (starting point with lambda_handler)
- [pyproject.toml](/pyproject.toml) (Collective configuration file: pytest, isort, etc.)
- [README.md](/README.md)

---

## Local build & testing

For local setup and development:

- create a virtual environment and install any required dependencies/libraries

```sh
  python -m venv .venv && .venv/Scripts/activate
  pip install xyz
```

- get installed dependencies with versions for requirements files with `pip freeze`
- Check any [library health score](https://snyk.io/advisor/python)

### Build

For local image build and push, execute:

```sh
./scripts/___build_and_push_image_local.sh
```

or

```sh
./scripts/___build_image_local.sh
```

### Testing

- add any required environment variable to the `env=[ ... ]` section in [pyproject.toml](/pyproject.toml)
- Create a virtual environment and install dependency libraries

```sh
python -m venv .venv
. .venv/Scripts/activate
python -m pip install -r requirements/development.txt
```

To run pytest tests locally within the virtual environment:

```sh
# To run all tests
pytest -s tests/
```

To run pylint locally within your virtual environment:

```sh
# To test basic setup
pylint main.py function_module/
# To test specific file
pylint function_module/logger.py
```