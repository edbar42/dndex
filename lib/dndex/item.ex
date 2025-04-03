defmodule DnDex.Item do
  alias DnDex.Item

  defstruct description: nil, effect: nil

  def all,
    do: [
      %Item{
        description: "A small health potion. It smells faintly of herbs.",
        effect: {:beneficial, 2}
      },
      %Item{
        description: "A large health potion. It glows with a soft light.",
        effect: {:beneficial, 5}
      },
      %Item{
        description: "A rusty trap. It cuts your hand.",
        effect: {:harmful, 2}
      },
      %Item{
        description: "A trapped rat. Scared, it bites your hand before running free..",
        effect: {:harmful, 1}
      }
    ]
end
