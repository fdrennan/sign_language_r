library(signlanguage)

if (FALSE)
  install_venv()

use_python(
  '/home/ubuntu/.virtualenvs/r-tensorflow/bin/python'
)

dir_name = 'videos'
dir.create('temp')

if (FALSE) {
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
  load.video(skip.to=0,
             frames=4,
             verbose = TRUE,
             fps = NULL)


n_images <- dim(mpg_data)[3]
for(i in 1:n_images) {
  save.image(
    as.cimg(mpg_data[,,i,],dim = dim(mpg_data)[c(1, 2, 4)]),
    paste0(tempfile(tmpdir = 'temp'), '.jpg')
  )
}






