require("codecompanion").setup({
  opts = {
    log_level = "DEBUG", -- or "TRACE"
  },
  strategies = {
    chat = {
      adapter = {
          name = "ollama",
          model = "gpt-oss:20b",
      },
    },
    inline = {
      adapter = "ollama",
    },
    cmd = {
      adapter = "ollama",
    }
  },
  adapters = {
    http = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "neptune:11434",
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
  },
})
