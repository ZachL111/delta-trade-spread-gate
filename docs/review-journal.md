# Review Journal

The repository goal stays the same: design a Zig verification harness for spread systems, covering security rule linting, safe and unsafe fixtures, and failure-oriented tests. This note explains the added review angle.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its trading systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `spread pressure`, score 156, lane `ship`
- `stress`: `fill risk`, score 177, lane `ship`
- `edge`: `portfolio drift`, score 147, lane `ship`
- `recovery`: `quote width`, score 170, lane `ship`
- `stale`: `spread pressure`, score 131, lane `watch`

## Note

This file is intentionally plain so the fixture remains the source of truth.
