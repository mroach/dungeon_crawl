defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all, do: [
    %Character{
      name: "Bastion",
      description: "Robot turret asshole",
      hit_points: 12,
      max_hit_points: 12,
      damage_range: 3..5,
      attack_description: "a chain gun"
    },
    %Character{
      name: "Orisa",
      description: "Four-legged tank",
      hit_points: 16,
      max_hit_points: 16,
      damage_range: 2..4,
      attack_description: "a slow fire laser gun"
    },
    %Character{
      name: "Hanzo",
      description: "A massive cunt",
      hit_points: 6,
      max_hit_points: 6,
      damage_range: 1..2,
      attack_description: "scatter arrow cheese"
    }
  ]
end
