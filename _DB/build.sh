#!/usr/bin/env bash
# Build db/ecommerce.db.
#
#   ./db/build.sh                  # full dataset: schema + eval fixtures + ~6,000 bulk orders
#   ./db/build.sh --orders 10000   # pass-through flags to the generator (5-10k range)
#   ./db/build.sh --minimal        # fixtures only (schema.sql + seed.sql, ~11 orders) — fast
#   DB=/tmp/foo.db ./db/build.sh   # build elsewhere
#
# Either way the eval fixtures ORD-100001..100011 (mapped to _KB/_eval/evaluation-cases.md)
# are always present. The full build adds thousands of synthetic orders on top of them.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DB="${DB:-$HERE/ecommerce.db}"

if [[ "${1:-}" == "--minimal" ]]; then
  rm -f "$DB"
  {
    echo "PRAGMA foreign_keys = ON;"
    cat "$HERE/schema.sql"
    cat "$HERE/seed.sql"
    echo "PRAGMA foreign_key_check;"
  } | sqlite3 "$DB"
  echo "Built (minimal fixtures only): $DB"
  sqlite3 "$DB" "SELECT 'orders', COUNT(*) FROM orders UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;"
  exit 0
fi

# Full build (schema + fixtures + bulk synthetic data) via the Python generator.
python3 "$HERE/seed_db.py" --db "$DB" "$@"
