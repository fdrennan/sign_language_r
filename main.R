library(signlanguage)

if (FALSE)
  install_venv()

LOCAL_PYTHON_PATH = '/Users/digitalfirstmedia/.virtualenvs/r-tensorflow/bin/python'
AWS_PYTHON_PATH = '/home/ubuntu/.virtualenvs/r-tensorflow/bin/python'

if (file.exists('/Users/digitalfirstmedia/.virtualenvs/r-tensorflow/bin/python')) {
  PYTHON_PATH = LOCAL_PYTHON_PATH
} else {
  PYTHON_PATH = AWS_PYTHON_PATH
}

use_python(
  PYTHON_PATH
)

dir_name = 'videos'

if(!dir.exists('temp')) dir.create('temp')

if (TRUE) {
  map(
    c(
      'https://www.youtube.com/watch?v=a5BD8SjhPSg',
      'https://www.youtube.com/watch?v=lYhAAMDQl-Q',
      'https://www.youtube.com/watch?v=6_gXiBe9y9A',
      'https://www.youtube.com/watch?v=DCb7yaK1-q4',
      'https://www.youtube.com/watch?v=csBb71UPN8E'
    ),
    ~ grab_video(link = ., name = ., dir_name = dir_name)
  )

}

mpg_files <- file.path(dir_name, list.files(dir_name))

mpg_data <-
  mpg_files[[1]] %>%
  load.video(frames=10,
             verbose = TRUE)

n_images <- dim(mpg_data)[3]

for(i in 1:n_images) {
  save.image(
    as.cimg(mpg_data[,,i,],dim = dim(mpg_data)[c(1, 2, 4)]),
    file.path('temp', paste0('image', i, '.jpg'))
  )
}






