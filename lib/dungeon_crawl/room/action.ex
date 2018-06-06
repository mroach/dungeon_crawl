defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  @type t :: %Action{
    id: atom,
    label: String.t
  }

  defstruct label: nil, id: nil

  def forward do
    %Action{id: :forward, label: "Move forward"}
  end

  def rest do
    %Action{id: :rest, label: "Take a look around and rest"}
  end

  def search do
    %Action{id: :search, label: "Search the room"}
  end

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end
