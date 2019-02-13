defmodule Brot do
	def mandelbrot(c, m) do
		z0 = Cmplx.new(0, 0)
		i = 0
		test(i, z0, c, m)
	end
	
	def test(i, _, _, i) do
		0
	end
	
	def test(i, z, c, m) do
		absZ = Cmplx.abs(z)
		if(absZ < 2) do
			test(i+1, Cmplx.add(Cmplx.sqr(z),c), c, m)
		else
			i
		end
	end
	
end