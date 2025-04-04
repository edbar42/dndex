defmodule DnDex.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DnDex.CLI.BaseCommands

  def start(room) do
    room_actions = room.actions

    Shell.info(room.description)

    chosen_action =
      room_actions
      |> ask_for_option

    {room, chosen_action}
  end
end
