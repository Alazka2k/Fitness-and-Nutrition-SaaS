param (
    [string]$Task = "help"
)

function Setup {
    Write-Host "Setting up the project..."
    poetry install
}

function Test {
    Write-Host "Running tests..."
    poetry run pytest
}

function Lint {
    Write-Host "Running linters..."
    poetry run black --check .
    poetry run isort --check .
    poetry run mypy .
}

function Format {
    Write-Host "Formatting code..."
    poetry run black .
    poetry run isort .
}

function Help {
    Write-Host "Available tasks:"
    Write-Host "  setup  - Install project dependencies"
    Write-Host "  test   - Run tests"
    Write-Host "  lint   - Run linters"
    Write-Host "  format - Format code"
    Write-Host "  help   - Show this help message"
}

switch ($Task.ToLower()) {
    "setup" { Setup }
    "test" { Test }
    "lint" { Lint }
    "format" { Format }
    default { Help }
}
