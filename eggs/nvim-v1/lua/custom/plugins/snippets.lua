return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    ls.add_snippets('dart', {
      s('stless', {
        t { 'class ' },
        i(1, 'MyWidget'),
        t { ' extends StatelessWidget {', '  const ' },
        i(1, 'MyWidget'),
        t { '({super.key});', '', '  @override', '  Widget build(BuildContext context) {', '    return ' },
        i(2, 'Container()'),
        t { ';', '  }', '}' },
      }),
    })
  end,
}
