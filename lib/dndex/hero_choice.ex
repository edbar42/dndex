defmodule DnDex.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("You feel around your body. You seem unharmed. Your wares are still with you...")
    Shell.info("[Choose a character class to play as]")

    heroes = DnDex.Heroes.all()

    heroes
    |> Enum.map(& &1.name)
    |> display_options
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("[ #{index} - #{option} ]")
    end)

    options
  end
end
