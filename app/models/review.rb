class Review < ActiveRecord::Base
  belongs_to :sitio
  belongs_to :user
end
