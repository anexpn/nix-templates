"""Tests for the main module."""

import pytest

from my_python_app.main import greet


def test_greet_default() -> None:
    """Test greet with default parameter."""
    result = greet()
    assert result == "Hello, World!"


def test_greet_with_name() -> None:
    """Test greet with custom name."""
    result = greet("Alice")
    assert result == "Hello, Alice!"


@pytest.mark.parametrize("name,expected", [
    ("Bob", "Hello, Bob!"),
    ("", "Hello, !"),
    ("123", "Hello, 123!"),
])
def test_greet_parametrized(name: str, expected: str) -> None:
    """Test greet with various inputs."""
    assert greet(name) == expected