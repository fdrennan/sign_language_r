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

video_urls =
  c(
    'https://www.youtube.com/watch?v=a5BD8SjhPSg',
    'https://www.youtube.com/watch?v=lYAAMDQl-Q',
    'https://www.youtube.com/watch?v=6_gXiBe9y9A',
    'https://www.youtube.com/watch?v=DCb7yaK1-q4',
    'https://www.youtube.com/watch?v=csBb71UPN8E'
  )

tags = str_remove(video_urls, ".*=")

if (FALSE) {
  map2(
    video_urls,
    tags,
    function(link, tag) {
      grab_video(link = link, name = tag, dir_name = dir_name)
    }
  )
}


create_photos <- function(filename, sep = 5) {
  save_to = file.path('temp', filename)
  unlink(save_to, recursive=TRUE)
  dir.create(save_to)
  command = paste0(
    'ffmpeg -i videos/', filename, '.mp4 -r ', sep, ' ', save_to, '/output_%04d.png'
  )
  system(command)
}

map(tags, create_photos)







