defmodule ListFilter do
  @moduledoc """
  Documentation for `ListFilter`.
  """

  @doc """
  Returns odd number's count from string list.

  ## Examples

      iex> ListFilter.call(["6", "42", "banana", "6", "abc"])
      0

      iex> ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
      3

  """
  def call(list) do
    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
    |> Enum.count(fn x ->
      rem(x, 2) != 0
    end)
  end
end
