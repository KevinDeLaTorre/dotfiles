return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      opts = {
        detection_methods = { "pattern", "lsp" },

        patterns = {
          "build/build",
          "Dockerfile",
          ".env",
          "Gemfile",
          ".dockerignore",
          "docker-compose.yml",
          ".git",
          ".gitignore",
        },

        show_hidden = true,

        silent_chdir = false,
      },
    })
  end,
}
