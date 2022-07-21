class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def user_url
        @event=current_user.created_events
    end

    def show
        @user = User.find(params[:id])
        @event=@user.created_events
      end

    
    private
    def sign_up_params
        params.require(:user).permit(:name,:last_name,:email, :password, :password_confirmation)
    end
    
    def account_update_params
        params.require(:user).permit(:name,:last_name,:email, :password,:password_confirmation,:current_password)
    end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :email, :password, :password_confirmation])
        
    end
end
