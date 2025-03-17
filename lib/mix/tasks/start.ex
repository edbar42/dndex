defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_), do: DnDex.Cli.Main.start_game()
end
