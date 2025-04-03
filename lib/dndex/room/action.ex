defmodule DnDex.Room.Action do
  alias DnDex.Room.Action
  defstruct label: nil, id: nil

  @type t :: %Action{id: atom, label: String.t()}

  def forward, do: %Action{id: :forward, label: "Move foward."}
  def search, do: %Action{id: :search, label: "Search the room."}

  defimpl String.Chars, for: DnDex.Room.Action do
    def to_string(action) do
      action.label
    end
  end
end
