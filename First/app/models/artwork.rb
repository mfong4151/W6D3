# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :artist_id, presence: true
    validates :title,uniqueness: { scope: :artist_id, 
        message: "One user can't have two artworks with the same title."} 

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User  

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        Artwork.select('*')
            .left_outer_joins(:shares)
            .where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', user_id, user_id)

    end


end
