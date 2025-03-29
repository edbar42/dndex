defmodule DnDex.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("[Press Enter to continue]")

    crawl(hero_choice(), DnDex.Room.all())
  end

  defp welcome_message do
    Shell.cmd("clear")
    Shell.info("=== DnD Elixir ===")
    Shell.info("You awake in a dungeon, dazed and confused.")
    Shell.info("You hear growling and scraping nearby. There might be monsters around.")
    Shell.info("You try to stay calm and resolute. You must find the exit.")
  end

  defp hero_choice do
    DnDex.CLI.HeroChoice.start()
  end

  defp crawl(character, rooms) do
    Shell.info("You proceed to the next room.")
    Shell.prompt("[Press Enter to continue]")
    Shell.cmd("clear")

    rooms
    |> Enum.random()
    |> DnDex.CLI.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}), do: Shell.info("[You found the exit. You win the game.]")
  defp handle_action_result({character, _}), do: crawl(character, DnDex.Room.all())
end
