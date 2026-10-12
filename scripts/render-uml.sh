#!/usr/bin/env bash
set -euo pipefail

output_dir="docs/uml/rendered"
server_url="${PLANTUML_SERVER_URL:-https://www.plantuml.com/plantuml/svg}"

mkdir -p "$output_dir"

for file in docs/uml/*.puml; do
  name="$(basename "$file" .puml)"
  output_file="$output_dir/$name.svg"
  encoded="$(npx -y node-plantuml encode "$file" | tail -n 1)"

  curl -fsSL "$server_url/$encoded" -o "$output_file"

  if grep -Eiq 'An error has occured|PlantUML .*cannot parse|Diagram source|zxing|data:image/png;base64' "$output_file"; then
    echo "Invalid PlantUML render: $file" >&2
    exit 1
  fi

  if ! grep -q '<svg' "$output_file"; then
    echo "Missing SVG output: $file" >&2
    exit 1
  fi

  echo "Rendered $output_file"
done
