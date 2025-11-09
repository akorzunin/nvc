# rm -rf /tmp/nvim.sock
# run nvim . --headless --listen /tmp/nvim.sock &
# run nvim --server /tmp/nvim.sock --remote-send ":w /tmp/test.txt<CR>"

# assert that the file contains
# /000   ../
# /001   .git/
# /004   .vscode/
# /006   lua/
# /007   test/
# /011   &
# /002   .gitignore
# /003 󰛢  .pre-commit-config.yaml
# /008   .stylua.toml
# /005 󰂺  README.md
# /010   init.lua
# /009   lazy-lock.json


import os
import shutil
import subprocess
import time
from pathlib import Path


import pytest
import pynvim  # type: ignore

TEST_DIR = Path(__file__).parent


SESSION_SOCK = "/tmp/nvim.sock"


@pytest.fixture(scope="session")
def nvim():
    """
    Start one headless Neovim for the whole test session and return
    a connected pynvim client.
    """

    # 1. make sure we start from a clean slate
    if os.path.exists(SESSION_SOCK):
        os.unlink(SESSION_SOCK)

    # 2. spawn nvim in the background
    proc = subprocess.Popen(
        [
            shutil.which("nvim") or "nvim",
            "/home/akorz/.config/nvim",
            "--headless",
            "--listen",
            SESSION_SOCK,
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    # 3. wait until the socket file really exists
    for _ in range(50):  # 5 s timeout
        if os.path.exists(SESSION_SOCK):
            break
        time.sleep(0.1)
    else:
        proc.kill()
        raise RuntimeError("nvim did not create the socket in time")

    # 4. open a pynvim connection
    client = pynvim.attach("socket", path=SESSION_SOCK)

    yield client  # <-- tests run here

    # 5. tear-down
    client.quit()
    proc.wait(timeout=3)
    if os.path.exists(SESSION_SOCK):
        os.unlink(SESSION_SOCK)


def test_dot_oil(nvim: pynvim.Nvim):
    # nvim.command("enew")

    nvim.command("w! /tmp/test.txt")
    time.sleep(0.1)
    with open("/tmp/test.txt", "r") as f:
        lines = f.readlines()

    assert lines[0] == "/000   ../\n"
    assert lines[1] == "/001   .git/\n"
    assert lines[2] == "/004   .vscode/\n"
    assert lines[3] == "/006   lua/\n"
    assert lines[4] == "/007   test/\n"
    assert lines[5] == "/011   &\n"
    assert lines[6] == "/002   .gitignore\n"
    assert lines[7] == "/003 󰛢  .pre-commit-config.yaml\n"
    assert lines[8] == "/008   .stylua.toml\n"
    assert lines[9] == "/005 󰂺  README.md\n"
    assert lines[10] == "/010   init.lua\n"
    assert lines[11] == "/009   lazy-lock.json\n"

    os.remove("/tmp/test.txt")
