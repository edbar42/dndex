defmodule DnDex.Room do
  alias DnDex.Room
  alias DnDex.Room.Trigger

  import DnDex.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      %Room{
        description:
          "You found a damp, but quiet room. It seems empty and isolated. Might be safe for a little rest by the bonfire.",
        actions: [forward(), rest()]
      },
      %Room{
        description:
          "The walls are covered in moss, and the air smells of earth. You hear faint dripping sounds echoing in the distance.",
        actions: [forward(), search()]
      },
      %Room{
        description:
          "A narrow corridor opens into a grand hall. Broken pillars and shattered statues hint at a forgotten civilization.",
        actions: [forward(), search()]
      },
      %Room{
        description:
          "The room is pitch dark, save for the faint glow of crystals embedded in the walls. You feel a strange energy in the air.",
        actions: [forward(), search()]
      },
      %Room{
        description:
          "You enter a room filled with old, dusty bookshelves. The scent of aged paper fills the air. Perhaps there's something useful here.",
        actions: [forward(), search()]
      },
      %Room{
        description:
          "A cold breeze brushes past you as you step into a cavernous space. The sound of distant footsteps makes you uneasy.",
        actions: [forward(), search()]
      },
      %Room{
        description:
          "Your eyes squint. As they adapt to the brightness you can see the light of day. At last, the exit.",
        actions: [forward()],
        trigger: Triggers.Exit
      }
    ]
end
