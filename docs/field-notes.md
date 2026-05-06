# Field Notes

`delta-trade-spread-gate` is easiest to review by starting with the fixture, not the prose.

The domain cases cover `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

`stress` tells me the happy path still works. `stale` tells me whether the guardrail still has teeth.

The language-specific addition keeps the review model in native test blocks.
