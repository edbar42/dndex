defmodule DnDex.Heroes do
  alias DnDex.Character

  def all,
    do: [
      %Character{
        name: "Knight",
        description: "Knights have strong defense and consistent damage.",
        hit_points: 18,
        max_hit_points: 18,
        damage_range: 4..5,
        attack_description: "a slashing sword"
      },
      %Character{
        name: "Wizard",
        description: "Wizards have strong attack, but low health.",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 6..10,
        attack_description: "an irradiating fireball staff"
      },
      %Character{
        name: "Rogue",
        description: "Rogues have high variability of attack damage.",
        hit_points: 12,
        max_hit_points: 12,
        damage_range: 1..12,
        attack_description: "a piercing sword"
      }
    ]
end
