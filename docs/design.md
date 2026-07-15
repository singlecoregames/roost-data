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
const SPEED := 150.0
const JUMP_VELOCITY := -300.0
```

> Playtest note: jump lowered to -300. Two tiles is the ceiling.

## Open questions

- Night mode: only the lantern radius is visible. Crows avoid the light.
- Boss: an owl?
