class Playlistsong < ActiveRecord::Base
    has_one :song
    belongs_to :playlist
end
