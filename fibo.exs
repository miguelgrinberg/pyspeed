#!/usr/bin/env elixir

defmodule Fibonacci do
  def fibo(n) when n <= 1, do: n
  def fibo(n), do: fibo(n - 1) + fibo(n - 2)
end

# __main__
case System.argv() do
  [arg] ->
    n = String.to_integer(arg)
    {time, _result} = :timer.tc(fn -> Fibonacci.fibo(n) end)
    IO.puts("#{time / 1_000_000} elixir #{System.version()}")

  _ ->
    IO.puts("Usage: ./fibo.exs <number>")
    System.halt(1)
end
