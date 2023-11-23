require('project_nvim').setup {
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
}
