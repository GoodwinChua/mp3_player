class User < ActiveRecord::Base
    has_many :playlists
    has_many :songs
    
    def self.create_user(email, password, password_confirm)
        return false if password != password_confirm
        return false if User.where(email: email).to_a.size > 0

        salt = BCrypt::Engine.generate_salt
        hashed_password = BCrypt::Engine.hash_secret(password, salt)
        new_user = User.create(email: email, password_hash: hashed_password, salt: salt)
        new_user
    end

    def self.authenticate(email, password)
          user = User.where(email: email).first
          if user.present? && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)
            user
          else
            nil
          end
    end

end
