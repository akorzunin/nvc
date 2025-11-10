from contextlib import contextmanager
from functools import partial
from pathlib import Path
import subprocess
import pytest


@contextmanager
def safe_test_file(tf):
    initial_data = Path(tf).read_bytes()
    try:
        yield tf
    finally:
        Path(tf).write_bytes(initial_data)


@pytest.fixture
def visual_nvim():
    """
    Run Neovim in a floating window in Kitty.
    Usage:

    ```python
    tf = "test/data/main.ts"
    w, args = visual_nvim
    with safe_test_file(tf):
        w(args + ["+9", tf, "+33"])
    ```
    """
    return partial(
        subprocess.run,
    ), [
        "kitty",
        "-T",
        "float",
        "-e",
        "nvim",
    ]


def file_test(visual_nvim, tf, line):
    w, args = visual_nvim
    with safe_test_file(tf):
        w(args + [tf, f"+{line}"])
