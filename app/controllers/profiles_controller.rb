class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def bind_telegram

        @user = current_user
        
       
        Telegram::Bot::Client.run(ENV['7016732427:AAEENWKNqzwXeRvqwNRmK7mC957T89pIJJ8']) do |bot|
          
          bot.api.send_message(chat_id: @user.telegram_chat_id, text: "Чтобы привязать свой Telegram-аккаунт, войдите в бота и выполните необходимые действия.")
          
          
        end
        
        
        @user.update(telegram_id: params[:telegram_id])
        
        
        redirect_to profile_path, notice: "Аккаунт Telegram успешно привязан."
      end
    
  
    def show
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(profile_params)
        redirect_to profile_path, notice: 'Профиль успешно обновлен.'
      else
        render :show
      end
    end
  
    private
  
    def profile_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :current_password)
    end
  end
  