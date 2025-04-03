defmodule DnDex.Room.Triggers.Item do
  @behaviour DnDex.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DnDex.Discover

  def run(character, %DnDex.Room.Action{id: :search}) do
    item = Enum.random(DnDex.Item.all())

    Shell.info("You approach it, wondering what may be held inside.")
    Shell.info("You snap the lid open to find...")

    updated_char = Discover.discover(character, item)
    {updated_char, :foward}
  end
end
