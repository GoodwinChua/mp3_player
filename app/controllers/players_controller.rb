class PlayersController < ApplicationController
        
    def mp3
        if current_user.present?
            @sessionemail = current_user.email
        else
            redirect_to action: :home
        end
    end
    
    def upload
        Song.save(params[:upload])
        
        redirect_to action: :mp3
    end
end
