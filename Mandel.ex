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
	# All these if statements check if the current coordinate being checked is inside 1 of 4 pre-defined boxes or 1
	# pre defined circle. If the coordinate is inside, then don't bother wasting time going through all the iterations
	# since we know by definition that they will be inside the set anyway.
	def row(width, height, trans, depth, res) do
		coord = trans.(width, height)
		coordAbs = Cmplx.abs(coord)
		{a,b} = coord
		if(a>(-0.444) && a<(0.172) && b>(0.068) && b<(0.532)) do
			#IO.puts(":a")
			row(width-1, height, trans, depth, [{0,0,0} | res])
		else
		if(a>(-0.688) && a<(-0.064) && b>(-0.224) && b<(0.224)) do
			#IO.puts(":b")
			row(width-1, height, trans, depth, [{0,0,0} | res])
		else
		if(a>(-0.444) && a<(0.172) && b>(-0.532) && b<(-0.068)) do
			#IO.puts(":c")
			row(width-1, height, trans, depth, [{0,0,0} | res])
		else
		if(a>(-1.155) && a<(-0.85) && b>(-0.148) && b<(0.148)) do
			#IO.puts(":d")
			row(width-1, height, trans, depth, [{0,0,0} | res])
		else
		if(coordAbs < 0.716 && a<(0.24) && b>(-0.5) && b<(0.5)) do
			#IO.puts(":d")
			row(width-1, height, trans, depth, [{0,0,0} | res])
		else
			q = Brot.mandelbrot(coord, depth)
			pixel = Color.convert(q, depth)
			row(width-1, height, trans, depth, [pixel | res])
		end
		end
		end
		end
		end
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
	
	def custom(x0, y0, xn) do
		width = 8700
		height = 5000
		depth = 512
		k = (xn - x0)/width
		image = mandelbrot(width, height, x0, y0, k, depth)
		PPM.write("32kBlue.ppm", image)
	end
end
