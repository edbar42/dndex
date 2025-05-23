defmodule DnDex.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("[ #{index} - #{option}]")
    end)

    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "[Choose your option: #{options}]"
  end

  def parse_answer!(answer) do
    case Integer.parse(answer) do
      :error ->
        raise DnDex.CLI.InvalidOptionError

      {option, _} ->
        option - 1
    end
  end

  def find_option_by_index!(index, options) do
    Enum.at(options, index) ||
      raise DnDex.CLI.InvalidOptionError
  end

  def ask_for_option(options) do
    try do
      options
      |> display_options
      |> generate_question
      |> Shell.prompt()
      |> parse_answer!
      |> find_option_by_index!(options)
    rescue
      e in DnDex.CLI.InvalidOptionError ->
        display_error(e)
        ask_for_option(options)
    end
  end

  def display_error(e) do
    Shell.cmd("clear")
    Shell.error(e.message)
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")
  end
end
