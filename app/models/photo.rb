class Photo < ActiveRecord::Base
  #Paperclip.options[:command_path] = 'C:/ImageMagick-6.9.2-Q16'
  belongs_to :car
  has_attached_file :image, 
  #:styles => { :size => "640x480#" },
    path: ":rails_root/public/images/:id/:filename",
    url:  "/images/:id/:filename"
  #do_not_validate_attachment_file_type :image
  validates_attachment :image,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..5000.kilobytes }
end
