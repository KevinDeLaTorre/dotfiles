local present, project_nvim = pcall(require, "project_nvim")

if not present then
  return
end

project_nvim.setup {
  detection_methods = { 'pattern' },

  patterns = { '.git', 'Dockerfile', 'Gemfile', '.gitignore', '.env', '.dockerignore', 'docker-compose.yml' },

  show_hidden = true,

  silent_chdir = false,
}
