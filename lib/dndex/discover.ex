defmodule DnDex.Discover do
  alias DnDex.Character
  alias Mix.Shell.IO, as: Shell

  def discover(character, item) do
    Process.sleep(1000)
    Shell.info("You found: #{item.description}")
    Process.sleep(1000)

    {item_modifier, item_effect_points} = item.effect

    updated_char =
      case item_modifier do
        :beneficial ->
          healed_char = Character.heal(character, item_effect_points)
          healing_message(character, healed_char) |> Shell.info()

        :harmful ->
          damaged_char = Character.take_damage(character, item_effect_points)
          damage_message(character, damaged_char) |> Shell.info()
          damaged_char
      end

    updated_char
  end

  defp healing_message(character, updated_char) do
    healing_amount = updated_char.hit_points - character.hit_points

    "It heals you for #{healing_amount} HP.\n" <>
      "Your HP: #{updated_char.hit_points}/#{updated_char.max_hit_points}"
  end

  defp damage_message(character, updated_char) do
    damage_amount = character.hit_points - updated_char.hit_points

    "It damages you for #{damage_amount} HP.\n" <>
      "Your HP: #{updated_char.hit_points}/#{updated_char.max_hit_points}"
  end
end
