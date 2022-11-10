class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :artist_id, presence: true
    validates :title,uniqueness: { scope: :artist_id, 
        message: "One user can't have two artworks with the same title."} 
end
