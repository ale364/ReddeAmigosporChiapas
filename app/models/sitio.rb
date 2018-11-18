class Sitio < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  has_attached_file :sitio_img, styles: { sitio_index: "250x350>", sitio_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :sitio_img, content_type: /\Aimage\/.*\z/

end
