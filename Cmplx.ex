defmodule Cmplx do
	def new(r, i) do
		{r, i}
	end
	
	def add(a, b) do
		{i, k} = a
		{j, h} = b
		{(i+j), (k+h)}
	end
	
	def sqr(a) do
		{i, k} = a
		is = i*i
		ks = k*k
		{(is-ks), (2*i*k)}
	end
	
	def abs(a) do
		{i, k} = a
		:math.sqrt(((i*i)+(k*k)))
	end
end