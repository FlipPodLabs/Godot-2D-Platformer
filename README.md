# Godot-2D-Platformer
A Godot Engine project for a 2D platformer game.

## Overview

This repository contains a 2D platformer game built with the Godot Engine. The game features basic platformer mechanics, including player movement, jumping, and collision detection. It also includes a sample level and user interface elements.

## Project Structure

The project is organized into the following directories:
- `assets/` - Contains graphics, audio, and other external resources.
- `scenes/` - Contains Godot scene files.
- `scripts/` - Contains GDScript code.
- `ui/` - Contains user interface elements.
- `autoload/` - Contains global scripts (optional).

## Getting Started

To get started with this project, follow these steps:
1. Clone the repository: `git clone https://github.com/FlipPodLabs/Godot-2D-Platformer.git`
2. Open the project in Godot Engine: `godot Godot-2D-Platformer`
3. Run the game: Press the play button in the Godot Editor or press F5.

## Player Scene

The player scene (`Player.tscn`) includes the following nodes:
- `CharacterBody2D` - The root node for the player.
- `AnimatedSprite2D` - Displays the player's visuals.
- `CollisionShape2D` - Defines the player's collision shape.
- `Camera2D` - Follows the player with smoothing enabled.

The player script (`player.gd`) implements core platformer mechanics, including horizontal movement, jumping, and collision detection. It uses export variables for tunable parameters and includes comments for clarity.

## Level Design

The sample level (`Level1.tscn`) includes a `TileMap` node configured to use free tiles from asset packs. It also includes proper collision shapes for level geometry and at least one platform for the player to jump and move on.

## User Interface

The HUD (`hud.tscn`) includes a score counter and a health bar. It is designed to provide basic user interface elements for the game.

## Asset Integration

The game uses free, open-licensed 2D assets from the following sources:
- [Kenney's Platformer Pack](https://github.com/iwenzhou/kenney) - A collection of free sprites, tiles, and audio available under a CC0 license.
- [GDQuest VFX Pack](https://github.com/gdquest-demos/godot-4-VFX-assets) - Free particle effect assets for jump/dash trails.
- [Intersect MMORPG Assets](https://github.com/AscensionGameDev/Intersect-Assets) - Additional environment tiles that can be adapted for platformer levels.

These assets are organized under subfolders inside the `assets/` directory (e.g., `assets/kenney/`, `assets/gdquest/`, etc.). The player scene and sample level scenes reference these assets for animations, audio, and level design.

## Input Configuration

The project settings include input actions for keyboard controls:
- `move_left` - Moves the player left.
- `move_right` - Moves the player right.
- `jump` - Makes the player jump.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the creators of the free assets used in this project:
- Kenney for the Platformer Pack.
- GDQuest for the VFX Pack.
- AscensionGameDev for the Intersect MMORPG Assets.

