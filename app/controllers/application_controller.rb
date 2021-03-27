class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def home
      render html: "ここはホーム画面だよん"
    end
end
