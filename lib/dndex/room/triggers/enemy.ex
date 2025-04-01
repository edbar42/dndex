defmodule DnDex.Room.Triggers.Enemy do
  @behaviour DnDex.Room.Trigger

  alias Mix.Shell.IO, as: Shell

  def run(character, %DnDex.Room.Action{id: :forward}) do
    enemy = Enum.random(DnDex.Enemies.all())

    Shell.info("You encounter a #{enemy.name}.")
    Shell.info(enemy.description)
    Shell.info("Battle is at bay! You attack first.")
    {updated_char, _enemy} = DnDex.Battle.fight(character, enemy)
    {updated_char, :forward}
  end
end
