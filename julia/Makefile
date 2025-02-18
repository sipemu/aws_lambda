.DEFAULT_GOAL := run

sysimage:
	julia precompile/create_sysimage.jl

dockerimage:
	docker build . -f container/Dockerfile.lambda -t julia_lambda_container:latest

clean:
	docker rmi julia_lambda_container:latest