#' @export install_venv
install_venv = function() {
  install_keras()
  virtualenv_install(envname = 'r-tensorflow',
                     packages = c('pytube'),
                     ignore_installed = TRUE)

}


