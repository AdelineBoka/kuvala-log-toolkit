# Kuvala Log Toolkit

A Bash tool that turns a shipment log (CSV) into a plain-text management report.

## What it reports

- Number of delayed shipments
- Shipments per driver
- Total and average weight (kg)
- Total weight per driver

## Usage

```bash
./scripts/report.sh                  # uses data/log.csv
./scripts/report.sh path/to/file.csv # uses your own file
```

If the file doesn't exist, the script prints an error and exits with code 1.

## Input format

```
id,date,origin,destination,status,weight_kg,driver
```

## Example output

See `reports/sample_output.txt`.

## About

Built while learning Linux. All data is fictional.

## Testing

```bash
./tests/run_tests.sh
```

Runs the report on `data/log.csv` and compares it with `tests/expected_report.txt`. Prints PASS (exit code 0) or FAIL with a diff (exit code 1).
