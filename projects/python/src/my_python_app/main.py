"""Main entry point for the application."""


def greet(name: str = "World") -> str:
    """Greet someone by name.
    
    Args:
        name: The name to greet
        
    Returns:
        A greeting message
    """
    return f"Hello, {name}!"


def main() -> None:
    """Main entry point."""
    print(greet())


if __name__ == "__main__":
    main()