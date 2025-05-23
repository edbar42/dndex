defmodule DnDex.Character do
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  @type t :: %DnDex.Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          attack_description: String.t(),
          damage_range: Range.t()
        }

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def heal(character, healing_value) do
    new_hit_points =
      min(
        character.hit_points + healing_value,
        character.max_hit_points
      )

    %{character | hit_points: new_hit_points}
  end

  def current_stats(character),
    do: "Player Stats - HP:#{character.hit_points}/#{character.max_hit_points}"

  defimpl String.Chars, for: DnDex.Character do
    def to_string(hero) do
      "#{hero.name} ]\n [ Gear: #{hero.attack_description} ]\n [ Info: #{hero.description}"
    end
  end
end
