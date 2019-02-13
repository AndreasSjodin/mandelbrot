defmodule Color do
	# renaming red/2 to convert will change the generated images' colors
	def red(depth, max) do
		bop = (depth/max)*8
		sec = Kernel.trunc(bop)
		offset = 255*(bop-sec)
		case sec do
			0 ->
				{Kernel.trunc(offset),0,0}
			1 ->
				{255,Kernel.trunc(offset),0}
			2 ->
				{255-Kernel.trunc(offset),255,0}
			3 ->
				{50,Kernel.trunc(offset),0}
			4 ->
				{25,255-Kernel.trunc(offset),0}
			5 ->
				{50,255-Kernel.trunc(offset),0}
			6 ->
				{75,255-Kernel.trunc(offset),0}
			7 ->
				{150,Kernel.trunc(offset),0}
			8 ->
				{255,Kernel.trunc(offset),0}
		end
	end
	def convert(depth, max) do
		bop = (depth/max)*4
		sec = Kernel.trunc(bop)
		offset = 255*(bop-sec)
		case sec do
			0 ->
				{0,0,Kernel.trunc(offset)}
			1 ->
				{0,50,255-Kernel.trunc(offset)}
			2 ->
				{0,25,Kernel.trunc(offset)}
			3 ->
				{0,0,Kernel.trunc(offset)}
		end
	end
end
