defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]:"
  end

  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

  def clear_screen do
    case :os.type do
      {:win32, _} -> Shell.cmd("cls")
      _ -> Shell.cmd("clear")
    end
  end
end
