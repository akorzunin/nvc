def test_startup_session(visual_nvim):
    w, args = visual_nvim
    w(args + [":/"])


def test_startup_filefinder(visual_nvim):
    w, args = visual_nvim
    w(args + [":f"])


def test_startup_live_grep(visual_nvim):
    w, args = visual_nvim
    w(args + [":w"])
