defmodule DnDex.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DnDex.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("You feel around your body. You seem unharmed. Your wares are still with you...")
    Shell.info("[Choose a character class to play as]\n")

    heroes = DnDex.Heroes.all()

    heroes
    |> ask_for_option
    |> confirm_choice
  end

  def display_heroes(heroes) do
    heroes
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("[ #{index} - #{option.name}")
      Shell.info("    Gear:    #{option.attack_description}")
      Shell.info("    Info:    #{option.description} ]\n")
    end)

    heroes
  end

  defp choose_hero_question(_) do
    "[Choose a character class to play as]\n"
  end

  defp confirm_choice(choice) do
    Shell.info("You chose to play as #{choice.name}.")
    Shell.info("#{choice.description}")
    if Shell.yes?("Confirm?"), do: choice, else: start()
  end
end
