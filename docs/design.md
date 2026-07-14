# Design notes

## Core loop

1. Gather seeds → 2. Return to the nest → 3. Earn a new feather (ability)

## Controls

| Input | Action | Notes |
|---|---|---|
| ←/→ | Move | No acceleration, instant |
| A | Jump | Height scales with hold time |
| A (in air) | Glide | 35% gravity |

## Jump numbers

```gdscript
const SPEED := 140.0
const JUMP_VELOCITY := -320.0
```

> Playtest note: the jump is a touch high. Clearing 2.5 tiles breaks the puzzles.

## Open questions

- ~~Night mode~~ → in progress: lantern radius 96px, 90 s cycle
- Boss: an owl?
