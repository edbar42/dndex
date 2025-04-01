defmodule DnDex.Room.Triggers.Exit do
  @behaviour DnDex.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DnDex.Room.Action

  @impl true
  def run(character, %Action{id: :forward}) do
    Shell.info(
      "Your eyes squint. As they adapt to the brightness, you can see the light of day. At last, the exit."
    )

    Shell.info("[You found the exit. You win the game!]")
    {character, :exit}
  end
end
