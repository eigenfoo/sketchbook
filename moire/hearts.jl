### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 97f77f2c-3b60-11eb-0491-492a778bb3b5
using PlutoUI

# ╔═╡ a06fcad8-3b60-11eb-2a23-95d631c64eb7
using Plots

# ╔═╡ 4986020c-3b63-11eb-084e-f7dae54fb3f8
@bind numspirals Slider(0:1:50)

# ╔═╡ 938080c6-3b63-11eb-0921-8fec56d31128
# If not small enough, snowflake will be drawn again - from the inside out!
@bind pitch Slider(0:0.001:0.01)

# ╔═╡ c48cc418-3b65-11eb-315b-b1461b326a14
@bind θ Slider(0:0.001:0.5)

# ╔═╡ 6f08b9cc-3b61-11eb-23b8-23d94564266a
begin
	x₁(t) = (1 - pitch*t) * 16*sin(t)^3
	y₁(t) = (1 - pitch*t) * (13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t))

	# Rotate first snowflake by θ
	x₂(t) = x₁(t) * cos(-θ) - y₁(t) * sin(-θ)
	y₂(t) = x₁(t) * sin(-θ) + y₁(t) * cos(-θ)

	# Rotate second snowflake by θ
	x₃(t) = x₂(t) * cos(-θ) - y₂(t) * sin(-θ)
	y₃(t) = y₂(t) * sin(-θ) + y₂(t) * cos(-θ)

end

# ╔═╡ d73fee6a-3b62-11eb-26ce-5be7445d05bc
begin
	plot(
		x₂, y₂, 0:0.01:2*numspirals*π,
		leg=false, axis=nothing, border=:none, aspect_ratio=:equal, color=:red
	)
	plot!(
		x₃, y₃, 0:0.01:2*numspirals*π,
		leg=false, axis=nothing, border=:none, aspect_ratio=:equal, color=:deeppink
	)
end

# ╔═╡ 6121cd5c-3b67-11eb-0eb4-f1c661d867bd
begin
	savefig("heart.pdf")
	savefig("heart.png")
end

# ╔═╡ Cell order:
# ╠═97f77f2c-3b60-11eb-0491-492a778bb3b5
# ╠═a06fcad8-3b60-11eb-2a23-95d631c64eb7
# ╠═4986020c-3b63-11eb-084e-f7dae54fb3f8
# ╠═938080c6-3b63-11eb-0921-8fec56d31128
# ╠═c48cc418-3b65-11eb-315b-b1461b326a14
# ╠═6f08b9cc-3b61-11eb-23b8-23d94564266a
# ╠═d73fee6a-3b62-11eb-26ce-5be7445d05bc
# ╠═6121cd5c-3b67-11eb-0eb4-f1c661d867bd
