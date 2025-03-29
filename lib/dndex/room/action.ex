defmodule DnDex.Room.Action do
  alias DnDex.Room.Action
  defstruct label: nil, id: nil

  @type t :: %Action{id: atom, label: String.t()}

  def forward, do: %Action{id: :foward, label: "Move foward."}
  def rest, do: %Action{id: :rest, label: "Take a short rest."}
  def search, do: %Action{id: :search, label: "Search the room."}
end
