module EvaluacionMediaFiles
  def media_is_video?
    media? and VIDEO_EXTENSIONS.include?(media.sanitized_file.extension.downcase)
  end
  def media_is_audio?
    media? and AUDIO_EXTENSIONS.include?(media.sanitized_file.extension.downcase)
  end
  def media_is_image?
    media? and IMAGE_EXTENSIONS.include?(media.sanitized_file.extension.downcase)
  end
end
