import subprocess


if __name__ == "__main__":
    subprocess.run(
        [
            "kitty",
            "-T",
            "float",
            "-e",
            "nvim",
            "init.lua",
        ],
    )
