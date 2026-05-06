# delta-trade-spread-gate

`delta-trade-spread-gate` keeps a focused Zig implementation around trading systems. The project goal is to design a Zig verification harness for spread systems, covering security rule linting, safe and unsafe fixtures, and failure-oriented tests.

## Why I Keep It Small

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Delta Trade Spread Gate Review Notes

For a quick review, compare `fill risk` with `spread pressure` before reading the middle cases.

## Included Behavior

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/delta-trade-spread-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `fill risk` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Internal Model

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`.

The Zig implementation avoids hidden state so fixture changes are easy to reason about.

## Try It Locally

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Validation

The same command runs the local verification path. The highest-scoring domain case is `stress` at 177, which lands in `ship`. The most cautious case is `stale` at 131, which lands in `watch`.

## Scope

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
