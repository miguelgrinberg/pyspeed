#!/usr/bin/env elixir

# This one is slightly more academic than fibonacci:
# Elixir uses immutable data structures,
# so the idiomatic version really is `list |> Enum.sort()`
# rather than re-inventing this particular wheel.
defmodule BubbleSort do
  def sort(list) when length(list) <= 1, do: list

  def sort(list) do
    case bubble_pass(list) do
      {^list, _} -> list
      {new_list, true} -> sort(new_list)
    end
  end

  defp bubble_pass(list), do: bubble_pass(list, [], false)

  defp bubble_pass([x], acc, swapped), do: {Enum.reverse([x | acc]), swapped}

  defp bubble_pass([x, y | rest], acc, _swapped) when x > y do
    bubble_pass([x | rest], [y | acc], true)
  end

  defp bubble_pass([x, y | rest], acc, swapped) do
    bubble_pass([y | rest], [x | acc], swapped)
  end
end

case System.argv() do
  [arg] ->
    n = String.to_integer(arg)
    list = Enum.map(1..n, fn _ -> :rand.uniform(n) end)
    {time, _result} = :timer.tc(fn -> BubbleSort.sort(list) end)
    IO.puts("#{time / 1_000_000} elixir #{System.version()}")

  _ ->
    IO.puts("Usage: ./bubble_sort.exs <array_size>")
    System.halt(1)
end
