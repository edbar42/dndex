defmodule DnDex.Enemies do
  alias DnDex.Character

  def all,
    do: [
      %Character{
        name: "Ogre",
        description:
          "A towering brute with bulging muscles, known for its insatiable hunger and short temper.",
        hit_points: 12,
        max_hit_points: 12,
        damage_range: 3..5,
        attack_description: "massive hammer"
      },
      %Character{
        name: "Orc",
        description:
          "A fierce, green-skinned warrior clad in crude armor, always ready for battle.",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 2..4,
        attack_description: "jagged axe"
      },
      %Character{
        name: "Goblin",
        description:
          "A small, sneaky creature dressed in tattered rags, armed with a rusty dagger.",
        hit_points: 4,
        max_hit_points: 4,
        damage_range: 1..2,
        attack_description: "slashing dagger"
      },
      %Character{
        name: "Troll",
        description:
          "A hulking, regenerating beast with thick, warty skin and a voracious appetite.",
        hit_points: 16,
        max_hit_points: 16,
        damage_range: 4..6,
        attack_description: "swipes massive claws"
      },
      %Character{
        name: "Skeleton",
        description:
          "An undead warrior, its bones held together by dark magic, wielding a rusted sword.",
        hit_points: 6,
        max_hit_points: 6,
        damage_range: 1..3,
        attack_description: "rusted sword"
      },
      %Character{
        name: "Harpy",
        description:
          "A winged creature with the body of a woman and the talons of a bird, known for its screeching cries.",
        hit_points: 10,
        max_hit_points: 10,
        damage_range: 2..4,
        attack_description: "sharp talons"
      },
      %Character{
        name: "Giant Spider",
        description: "A massive arachnid with venomous fangs and a web-spinning ability.",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 2..3,
        attack_description: "venomous fangs"
      },
      %Character{
        name: "Wraith",
        description: "A ghostly figure cloaked in shadow, draining the life force of the living.",
        hit_points: 14,
        max_hit_points: 14,
        damage_range: 3..5,
        attack_description: "icy touch"
      }
    ]
end
