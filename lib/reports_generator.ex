defmodule ReportsGenerator do
  def build(filename) do
    alias ReportsGenerator.Parser

    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, acc -> sum_values(line, acc) end)
  end

  defp sum_values([id, _food_name, price], acc) do
    Map.put(acc, id, acc[id] + price)
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
