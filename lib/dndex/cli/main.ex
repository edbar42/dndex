defmodule DnDex.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("[Press Enter to continue]")

    shuffled_rooms = Enum.shuffle(DnDex.Room.all())
    crawl(hero_choice(), shuffled_rooms)
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

  defp crawl(character, [current_room | remaining_rooms]) do
    Shell.info("You proceed to the next room.")
    Shell.prompt("[Press Enter to continue]")
    Shell.cmd("clear")

    Shell.info("[#{DnDex.Character.current_stats(character)}]")

    current_room
    |> DnDex.CLI.RoomActionsChoice.start()
    |> trigger_action(character, remaining_rooms)
  end

  defp trigger_action({room, action}, character, remaining_rooms) do
    Shell.cmd("clear")

    case room.trigger.run(character, action) do
      {updated_character, :exit} -> {updated_character, :exit}
      {updated_character, :search} -> {updated_character, :search}
      {updated_character, _} -> crawl(updated_character, remaining_rooms)
    end
  end
end
