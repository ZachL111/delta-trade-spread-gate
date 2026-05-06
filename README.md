# delta-trade-spread-gate

`delta-trade-spread-gate` explores trading systems in Zig. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Delta Trade Spread Gate Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Feature Notes

- Includes extended examples for fills, including `surge` and `degraded`.
- Documents portfolio pressure tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Why This Exists

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Code Tour

- `src`: primary implementation
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Implementation Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps order state, risk checks, and fills in one explicit decision path. The threshold is 157, with risk penalty 6, latency penalty 2, and weight bonus 2. The Zig version uses compile-time constants and native test blocks for fast local checks.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Example Scenarios

`surge` is the first example I would inspect because it lands on the `accept` path with a score of 209. The broader file also keeps `degraded` at -3 and `surge` at 209, which gives the model a useful low-to-high spread.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Boundaries

The repository favors determinism over breadth. It does not pull live data, keep secrets, or depend on network access for verification.

## Roadmap

- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add one more trading systems fixture that focuses on a malformed or borderline input.

## Local Setup

Install Zig and run the commands from the repository root. The project does not need credentials or a hosted service.
