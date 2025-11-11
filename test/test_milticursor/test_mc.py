from test.conftest import file_test


def test_mc(visual_nvim):
    file_test(visual_nvim, "test/test_milticursor/test.txt", 3)
