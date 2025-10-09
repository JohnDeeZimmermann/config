local animate = require('mini.animate')
require('mini.animate').setup({
  cursor = {
    timing = animate.gen_timing.linear({ duration = 70, unit = 'total' }),
  },
  scroll = {
    enabled = true,
    timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }),
  },
  resize = {
    enabled = false
  },
  close = {
    enabled = false
  }
})
