defmodule Chop do
  def guess(n, a..b) do
    isit(n, a..b, div(a+b, 2))
  end

  defp isit(n, a..b, x) when n == x do
    IO.puts "Is it #{x}"
    x
  end

  defp isit(n, a..b, x) when n < x do
    IO.puts "Is it #{x}"
    guess(n, a..x)
  end

  defp isit(n, a..b, x) when n > x do
    IO.puts "Is it #{x}"
    guess(n, x..b)
  end
end
