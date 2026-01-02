def greet(name: str) -> str:
    """Greet someone by name."""
    return f"Hello, {name}!"


def add(a: int, b: int) -> int:
    """Add two numbers."""
    return a + b


if __name__ == "__main__":
    print(greet("Python"))
    print(f"2 + 3 = {add(2, 3)}")
