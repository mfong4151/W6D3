#Each user has a set of artworks that they own/control. 
#These artworks can also be shared with other users.
#An artwork that has been shared with one or more other users will be visible to those users, but the artwork still 'belongs to' the original user.
#Although you will maintain this conceptual distinction between a user's own artworks vs. the artworks that have been shared with that user,
# you will eventually write an index method that will combine both types of a user's viewable artworks together so that you can see any art made by or shared with that user.

User model
Arts Table
-foreign_key user_id to art

Art model
    -belongs_to users_artwork
    -has_many shared_art
    -has_many users_viewable_art  through:

User 
    -has_many artworks
    -has_many shared_artworks


SharedArt joins table
    -belong_to art
    -belongs_to users 

