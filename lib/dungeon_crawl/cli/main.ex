defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters")
    Shell.info("You need to survive the exit")
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end
  
  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    clear_screen()
    Shell.info("You have died a painful death in a pool of human feces")
    Shell.info("YOU LOSE")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    clear_screen()
    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> Enum.random
    |> DungeonCrawl.CLI.RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    clear_screen()
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit and won. Yay.")
  end
  defp handle_action_result({character, _}) do
    crawl(character, DungeonCrawl.Room.all())
  end
end
