import dracula.draw

config.load_autoconfig()


#c.qt.force_software_rendering = 'chromium'
config.unbind('d', mode='normal')
config.unbind('D', mode='normal')
config.unbind('<Ctrl-w>', mode='normal')
config.unbind('<Ctrl-a>', mode='normal')
config.unbind('<Ctrl-x>', mode='normal')
config.unbind('m', mode='normal')
config.unbind('M', mode='normal')
config.unbind('b', mode='normal')

config.bind('Q', 'tab-close')

# config.bind('wa', mode='normal', command='spawn --userscript custom-bw --totp')
# config.bind('wu', mode='normal', command='spawn --userscript custom-bw --username-only')
# config.bind('wp', mode='normal', command='spawn --userscript custom-bw --password-only')
# config.bind('wt', mode='normal', command='spawn --userscript custom-bw --totp-only')


config.bind('<Ctrl-j>', mode='command', command='completion-item-focus next')
config.bind('<Ctrl-k>', mode='command', command='completion-item-focus prev')
config.bind('<Ctrl-Shift-j>', mode='command', command='completion-item-focus --history next')
config.bind('<Ctrl-Shift-k>', mode='command', command='completion-item-focus --history prev')
config.bind('<Ctrl-w>', mode='command', command='rl-backward-kill-word')

config.bind('<Ctrl-w>', mode='insert', command='fake-key <Ctrl-backspace>')
config.bind('<Ctrl-h>', mode='insert', command='fake-key <Backspace>')
config.bind('<Ctrl-w>', mode='passthrough', command='fake-key <Ctrl-backspace>')
config.bind('<Ctrl-h>', mode='passthrough', command='fake-key <Backspace>')

config.bind('<Shift-e>', mode='caret', command='fake-key <Shift-End>')

config.bind('<Ctrl-b>', mode='normal', command='fake-key <Pgup>')
config.bind('<Ctrl-f>', mode='normal', command='fake-key <Pgdown>')
config.bind('b', mode='normal', command='fake-key <Ctrl-Left>')
config.bind('e', mode='normal', command='fake-key <Ctrl-Right>')

config.bind('gg', mode='normal', command='fake-key <Home>')
config.bind('G', mode='normal', command='fake-key <End>')
config.bind('>', mode='normal', command='tab-move +')
config.bind('<', mode='normal', command='tab-move -')

config.bind('cm', mode='normal', command='clear-messages')
config.set("fonts.hints", 'bold 13px JetBrainsMono Nerd Font')

c.fonts.default_family='JetBrainsMono Nerd Font' 

config.bind('do', mode='normal', command='download-open')
config.bind('dr', mode='normal', command='download-retry')

config.bind('bd', mode='normal', command='bookmark-del')
config.bind('ba', mode='normal', command='bookmark-add')



c.hints.selectors["code"] = [
    ":not(pre) > code",
    "pre"
]

dracula.draw.blood(c, {})


c.url.searchengines = {'DEFAULT': "https://google.com/search?q={}"}
c.url.start_pages = 'https://fitrafep.com'
c.content.javascript.clipboard = 'access'

config.bind('<Ctrl+k>', 'spawn --userscript qute-keepass -p ~/KeePassFiles/Database.kdbx')
config.bind('<Ctrl-a>', 'fake-key <Ctrl-a>')
# config.bind('zl', 'spawn --userscript qute-bitwarden')
