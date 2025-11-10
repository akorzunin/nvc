from test.conftest import file_test


def test_lsp_ts(visual_nvim):
    file_test(visual_nvim, "test/data/main.ts", 33)


def test_lsp_py(visual_nvim):
    file_test(visual_nvim, "test/data/main.py", 36)


def test_lsp_lua(visual_nvim):
    file_test(visual_nvim, "test/data/main.lua", 55)


def test_lsp_go(visual_nvim):
    file_test(visual_nvim, "test/data/main.go", 42)
