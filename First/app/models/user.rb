# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true
    
    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy
    

    has_many :viewed_artworks,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy
    

    has_many :received_artworks,
        through: :viewed_artworks,
        source: :artwork,
        dependent: :destroy
    


end
#rails g migration CreatePluralcase
#rails g model Singular
