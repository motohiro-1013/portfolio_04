class Post < ApplicationRecord
    validates :name, presence: true
    validates :text, {presence: true, uniqueness: true}
    mount_uploader :image, ImageUploader
end
