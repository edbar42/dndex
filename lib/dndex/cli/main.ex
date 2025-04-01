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
    hero = DnDex.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")

    Shell.info(
      "You have faced powerful enemies and the aftermath of battle takes the better of you."
    )

    Shell.info("You feel your body heavy and aching, your vision slowly surrounded by blackness.")

    Shell.info(
      "You fall to your feet, crawling, attempting to keep going, but exhaustion takes the best of you."
    )

    Shell.info(
      "You close your eyes and listen to fainting sound of your breath.. Until you breath no more."
    )

    Shell.info("      YOU DIED      ")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You proceed to the next room.")
    Shell.prompt("[Press Enter to continue]")
    Shell.cmd("clear")

    Shell.info("[#{DnDex.Character.current_stats(character)}]")

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
