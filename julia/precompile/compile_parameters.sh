# https://words.yuvi.in/post/pre-compiling-julia-docker/
if [ "$(uname -m)" == "x86_64" ]; then
    # See https://github.com/JuliaCI/julia-buildkite/blob/70bde73f6cb17d4381b62236fc2d96b1c7acbba7/utilities/build_envs.sh#L24
    # for an explanation of these options
    export JULIA_CPU_TARGET="generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1)"
elif [ "$(uname -m)" == "aarch64" ]; then
    # See https://github.com/JuliaCI/julia-buildkite/blob/70bde73f6cb17d4381b62236fc2d96b1c7acbba7/utilities/build_envs.sh#L54
    # for an explanation of these options
    export JULIA_CPU_TARGET="generic;cortex-a57;thunderx2t99;carmel"
fi