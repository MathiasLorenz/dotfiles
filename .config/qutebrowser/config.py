# import dracula.draw
#
# # Load existing settings made via :set
# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Load autoconfig
config.load_autoconfig()

# Many things stolen/yanked from Vakili GitHub
# https://github.com/vakili/nix-config/blob/main/qutebrowser/config.py

# Darkmode
# https://old.reddit.com/r/qutebrowser/comments/jdnqbp/yet_another_dark_mode_post/
c.colors.webpage.darkmode.enabled = True
# dark/night mode
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.bg = "black"

c.tabs.position = "left"
c.tabs.select_on_remove = "last-used"
# Enable toggle of showing/removing tabs
config.bind("tt", "config-cycle tabs.show always never")

c.completion.shrink = True

# Re-open previous tabs for new window
c.auto_save.session = True

# c.fonts.default_family = "Hack nerd font"

# Zoom zoom
c.qt.highdpi = True  # Not sure this does anything
c.zoom.default = 120

c.qt.args = ["enable-features=VaapiVideoDecodeLinuxGL"]

# getting rid of annoying cookie bars
# see https://www.reddit.com/r/qutebrowser/comments/mnptey/getting_rid_of_cookie_consent_barspopups/
config.bind(
    "e",
    "jseval (function () { "
    + '  var i, elements = document.querySelectorAll("body *");'
    + ""
    + "  for (i = 0; i < elements.length; i++) {"
    + "    var pos = getComputedStyle(elements[i]).position;"
    + '    if (pos === "fixed" || pos == "sticky") {'
    + "      elements[i].parentNode.removeChild(elements[i]);"
    + "    }"
    + "  }"
    + "})();",
)

# dowlnoad directory
c.downloads.location.directory = "~/Downloads"

# Binds
config.bind("cs", "config-source")
