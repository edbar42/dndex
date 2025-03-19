defmodule DnDex.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("[Press Enter to continue]")
    hero_choice()
    crawl(DnDex.Room.all())
  end

  defp welcome_message do
    Shell.cmd("clear")
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon, dazed and confused.")
    Shell.info("You hear growling and scraping nearby. There might be monsters around.")
    Shell.info("You try to stay calm and resolute. You must find the exit.")
  end

  defp hero_choice do
    DnDex.CLI.HeroChoice.start()
  end

  defp crawl(rooms) do
    Shell.info("You proceed to the next room.")
    Shell.prompt("[Press Enter to continue]")
    Shell.cmd("clear")

    rooms
    |> Enum.random()
    |> DnDex.CLI.RoomActionsChoice.start()
  end
end
