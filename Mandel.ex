defmodule Mandel do
	def mandelbrot(width, height, x, y, k, depth) do
		trans = fn(w, h) -> 
			Cmplx.new(x+k*(w-1), y-k*(h-1))
		end
		
		rows(width, height, trans, depth, [])
	end
	
	def rows(_, 0, _, _, res) do
		res
	end
	
	def rows(width, height, trans, depth, res) do
		row = row(width, height, trans, depth, [])
		IO.puts("#{height}")
		rows(width, height-1, trans, depth, [row | res])
	end
	
	def row(0, _, _, _, res) do
		res
	end
	
	def row(width, height, trans, depth, res) do
		coord = trans.(width, height)
		#IO.puts("#{coord}")
		#OPTIMIZE HERE
		q = Brot.mandelbrot(coord, depth)
		pixel = Color.convert(q, depth)
		row(width-1, height, trans, depth, [pixel | res])
	end
	
	
	
	def demo() do
		small(-2.6, 1.2, 1.2)
	end
	
	def demo2() do
		big(-1.54, 0, -1.2)
	end
	
	def custom() do
		custom(-2.6, 1.2, 1.2)
	end
	
	def small(x0, y0, xn) do
		width = 400
		height = 400
		depth = 256
		k = (xn - x0)/width
		image = mandelbrot(width, height, x0, y0, k, depth)
		PPM.write("small.ppm", image)
	end
	
	def big(x0, y0, xn) do
		width = 3840
		height = 2160
		depth = 256
		k = (xn - x0)/width
		image = mandelbrot(width, height, x0, y0, k, depth)
		PPM.write("big.ppm", image)
	end
	
	def n1920(x0, y0, xn, name) do
		width = 1024
		height = 720
		depth = 256
		k = (xn - x0)/width
		image = mandelbrot(width, height, x0, y0, k, depth)
		PPM.write(name, image)
	end
	
	def custom(x0, y0, xn) do
		width = 8700
		height = 5000
		depth = 512
		k = (xn - x0)/width
		image = mandelbrot(width, height, x0, y0, k, depth)
		PPM.write("32kBlue.ppm", image)
	end
end