defmodule DnDex.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("You feel around your body. You seem unharmed. Your wares are still with you...")
    Shell.info("[Choose a character class to play as]")

    heroes = DnDex.Heroes.all()

    display_options(heroes)
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("[ #{index} - #{option.name}")
      Shell.info("    Gear:    #{option.attack_description}")
      Shell.info("    Info:    #{option.description} ]")
    end)

    options
  end
end
