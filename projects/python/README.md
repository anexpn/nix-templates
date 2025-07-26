# Python Project Template with uv

A Python project template using [uv](https://github.com/astral-sh/uv) for fast package management.

## Quick Start

```bash
# Enter development environment
nix develop

# Initialize uv project (if not already done)
uv sync

# Run the application
uv run python -m my_python_app.main

# Or run the console script
uv run my-python-app
```

## Development

### Adding Dependencies

```bash
# Add a runtime dependency
uv add requests

# Add a development dependency
uv add --dev pytest-mock
```

### Running Tests

```bash
# Run all tests
uv run pytest

# Run with coverage
uv run pytest --cov

# Run specific test
uv run pytest tests/test_main.py::test_greet_default
```

### Code Quality

```bash
# Lint and format
uv run ruff check
uv run ruff format

# Type checking
uv run mypy src
```

### Building

```bash
# Build with Nix
nix build

# Or build Python package
uv build
```

## Project Structure

```
├── src/
│   └── my_python_app/
│       ├── __init__.py
│       └── main.py
├── tests/
│   ├── __init__.py
│   └── test_main.py
├── pyproject.toml
├── flake.nix
└── README.md
```

## Features

- **uv**: Fast Python package manager
- **Ruff**: Fast linting and formatting
- **mypy**: Static type checking
- **pytest**: Testing framework with coverage
- **Nix**: Reproducible development environment