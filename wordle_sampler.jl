### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ fb490dd9-84fc-4998-8ae6-3844d7d94540
md"""
# Wordle Sampler in Julia 

This notebook demonstrates a brute-force Wordle solver that randomly generates 5-letter words until it finds the target.
"""

# ╔═╡ 95cc5ef6-5c3d-11f0-1c91-fd32d9854505
function wordle_sampler(target::String = "hello")
    if length(target) != 5 || !occursin(r"^[a-z]+$", target)
        error("Must be 5 letters a-z")
    end
    attempts = 0
    start = time()
    while true
        attempts += 1
        sampled = join(rand('a':'z', 5))
        print("\rAttempt $attempts - Current: $sampled")
        if sampled == target
            time_taken = round(time() - start, digits=2)
            println("\n SUCCESS! Found '$target' after $attempts attempts!")
            println("Time taken: $time_taken seconds")
            return (attempts = attempts, time_seconds = time_taken, success = true)
        end
    end
end

# ╔═╡ e67f71e0-0546-4fac-8aba-61a7a73f3b86
wordle_sampler("hello")

# ╔═╡ 57f458e4-401b-41b1-88fc-9f27e9ad6e59
# 10 simulations (change if wanted)
attempts_list = begin
    results = []
    for i in 1:10
        result = wordle_sampler("hello")
        push!(results, result.attempts)
    end
    results
end

# ╔═╡ 51be0af7-0386-411a-ad9b-7a575d3fb11b
histogram(attempts_list, 
         xlabel="Number of Attempts",
         ylabel="Frequency",
         title="")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.5"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─fb490dd9-84fc-4998-8ae6-3844d7d94540
# ╠═95cc5ef6-5c3d-11f0-1c91-fd32d9854505
# ╠═e67f71e0-0546-4fac-8aba-61a7a73f3b86
# ╠═57f458e4-401b-41b1-88fc-9f27e9ad6e59
# ╠═51be0af7-0386-411a-ad9b-7a575d3fb11b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
