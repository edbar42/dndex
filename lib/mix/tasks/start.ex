defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_), do: DnDex.CLI.Main.start_game()
end
