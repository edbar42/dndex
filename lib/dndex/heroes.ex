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
      },
      %Character{
        name: "Barbarian",
        description: "Barbarians are fierce warriors with high health and raw strength.",
        hit_points: 20,
        max_hit_points: 20,
        damage_range: 5..8,
        attack_description: "a crushing warhammer"
      },
      %Character{
        name: "Ranger",
        description: "Rangers are agile fighters with precise attacks and moderate health.",
        hit_points: 14,
        max_hit_points: 14,
        damage_range: 3..6,
        attack_description: "a swift arrow"
      },
      %Character{
        name: "Cleric",
        description: "Clerics are healers with moderate health and supportive abilities.",
        hit_points: 16,
        max_hit_points: 16,
        damage_range: 2..4,
        attack_description: "a radiant mace"
      },
      %Character{
        name: "Sorcerer",
        description: "Sorcerers wield chaotic magic with unpredictable damage.",
        hit_points: 10,
        max_hit_points: 10,
        damage_range: 1..10,
        attack_description: "a burst of arcane energy"
      }
    ]
end
