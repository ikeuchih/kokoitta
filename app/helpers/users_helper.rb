module UsersHelper

    # ユーザーの画像を返す動作の指定
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.username, class: "gravatar")
    end
    
end
