local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    fix   = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
    temp  = { pattern = '%f[%w]()TEMP()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    warn  = { pattern = '%f[%w]()WARN()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    test  = { pattern = '%f[%w]()TEST()%f[%W]',  group = 'MiniHipatternsNote'  },
    perf  = { pattern = '%f[%w]()PERF()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) #FF33AA using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
