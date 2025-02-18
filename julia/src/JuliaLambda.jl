module JuliaLambda

using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end

# Custom packages
# using DataFrames, DataFramesMeta

# AWS package for S3 interaction
# using AWS

# Project related code
include("CustomCode.jl");

# Input parameters; In this case just an Int, but may be a JSON
parse_data(event_data) = parse(Int, event_data)

# Returns; In this case a String, but may be a JSON
format_result(value) = "$value"

#########################################################################
# Event Handler
# 
function handle_event(event_data, headers)
    @info "Handling request" event_data headers
    # Parsing input (this is more commonly structured as JSON string)
    n = parse_data(event_data)

    # Load Cost Center Forecast
    @info "Calculate pi"
    pi_approx = monte_carlo_pi(n)

    return format_result(pi_approx)
end
#
#########################################################################

end
