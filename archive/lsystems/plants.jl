### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ fd5571c8-4572-11eb-35a3-d7acfd5fd6be
using Lindenmayer


# ╔═╡ 835885d0-4573-11eb-35ef-757b8ec16938
begin
	plant = LSystem(Dict(
	   "F" => "F[-F]cF[+F][F]"),
	   "F") # use turn eg 17° or 23°
	
	drawLSystem(plant,
	   forward             = 7,
	   startingpen         = (0, 0.8, 0.3),
	   startingx           = 0,
	   startingy           =  460,
	   startingorientation = -pi/2,
	   turn                = 23,
	   iterations          = 6,
	   filename            = "plant.pdf",
	   showpreview         = false)
end

# ╔═╡ Cell order:
# ╠═fd5571c8-4572-11eb-35a3-d7acfd5fd6be
# ╠═835885d0-4573-11eb-35ef-757b8ec16938
