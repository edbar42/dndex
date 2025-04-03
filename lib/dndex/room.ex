defmodule DnDex.Room do
  alias DnDex.Room
  alias DnDex.Room.Triggers.Enemy, as: EnemyTrigger
  alias DnDex.Room.Triggers.Exit, as: ExitTrigger
  alias DnDex.Room.Triggers.Item, as: ItemTrigger

  import DnDex.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      %Room{
        description:
          "The walls are covered in moss, and the air smells of earth. You hear faint dripping sounds echoing in the distance.",
        actions: [forward()],
        trigger: EnemyTrigger
      },
      %Room{
        description:
          "A narrow corridor opens into a grand hall. Broken pillars and shattered statues hint at a forgotten civilization.",
        actions: [forward()],
        trigger: EnemyTrigger
      },
      %Room{
        description:
          "The room is pitch dark, save for the faint glow of crystals embedded in the walls. You feel a strange energy in the air.",
        actions: [forward()],
        trigger: EnemyTrigger
      },
      %Room{
        description:
          "You enter a room filled with old, dusty bookshelves. The scent of aged paper fills the air. In the corner, you barely see a chest.",
        actions: [search()],
        trigger: ItemTrigger
      },
      %Room{
        description:
          "A cold breeze brushes past you as you step into a cavernous space. The sound of distant footsteps makes you uneasy.",
        actions: [forward()],
        trigger: EnemyTrigger
      },
      %Room{
        description:
          "The room is dimly lit by a single torch. In the shadows, you spot a chest partially hidden behind debris.",
        actions: [search()],
        trigger: ItemTrigger
      },
      %Room{
        description:
          "At the distance you see a ray of sunshine creep through cracks on the wall. The birds chirp faintly at a distance. Could this be the end of this nightmare?",
        actions: [forward()],
        trigger: ExitTrigger
      }
    ]
end
