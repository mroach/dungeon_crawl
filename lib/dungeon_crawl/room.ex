defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: [
    # %Room{
    #   description: "Bathroom. Good spot to take a dump",
    #   actions: [forward(), rest()]
    # },
    %Room{
      description: "You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You see an enemy blocking access to the dunnies",
      actions: [forward()],
      trigger: Triggers.Enemy
    }
  ]
end
