defmodule DnDex.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DnDex.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("You feel around your body. You seem unharmed. Your wares are still with you...")
    Shell.info("[Choose a character class to play as]")

    heroes = DnDex.Heroes.all()

    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> display_heroes
    |> choose_hero_question
    |> Shell.prompt()
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_choice
  end

  def display_heroes(heroes) do
    heroes
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("[ #{index} - #{option.name}")
      Shell.info("    Gear:    #{option.attack_description}")
      Shell.info("    Info:    #{option.description} ]")
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
