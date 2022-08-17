class RegistrationsController < Devise::RegistrationsController
    def update_resource(resource, params)
        return super if params['password']&.present?
        resource.update_without_password(params.except('current_password'))
    end

    private

    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

end
