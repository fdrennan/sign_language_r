#' @export grab_video
grab_video = function(link, name, dir_name = 'videos') {
  if(!dir.exists(dir_name)) {
    dir.create(dir_name)
    message('video directory created')
  }
  pytube = import('pytube')
  yt = pytube$YouTube(link)
  stream = yt$streams$first()
  stream$download(dir_name, name)
}
