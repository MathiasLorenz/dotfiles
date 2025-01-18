# import dracula.draw
#
# # Load existing settings made via :set
# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Load autoconfig
config.load_autoconfig()

### Darkmode
##### https://old.reddit.com/r/qutebrowser/comments/jdnqbp/yet_another_dark_mode_post/
c.colors.webpage.darkmode.enabled = True
# dark/night mode
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.bg = "black"

c.tabs.position = "left"
c.completion.shrink = True
