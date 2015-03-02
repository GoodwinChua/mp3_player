class PlayersController < ApplicationController
    def home
        @errormessage = params[:error]
    end

	def login_user
        e = params[:loginemail]
        p = params[:loginpassword]
        
        authenticated = User.authenticate(e,p)
        
        if authenticated.present?
            redirect_to action: :mp3
        else
            msg = 'Invalid User/Password'
            redirect_to action: :home , :error => msg
        end
        
	end

	def new_user	
        @errormessage = params[:error]
	end
    
    def register_user
        e = params[:email]
        p = params[:password]
        cp = params[:confirm_password]
        
		registered = User.create_user(e, p, cp)
        
        if registered.present?  
            redirect_to action: :mp3
        else
            msg = 'User creation failed. Username is already taken or Passwords don\'t match'
            redirect_to action: :new_user , :error => msg
        end
    end
    
    def mp3
	end
    
end
