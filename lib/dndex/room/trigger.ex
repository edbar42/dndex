defmodule DnDex.Room.Trigger do
  alias DnDex.Character
  alias DnDex.Room.Action

  @callback run(Character.t(), Action.t()) :: {Character.t(), atom}
end
