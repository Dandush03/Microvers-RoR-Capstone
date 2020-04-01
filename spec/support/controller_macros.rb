module ControllerMacros
  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    FactoryBot.create_list(:user, 3)
    user = User.first
    sign_in user
  end
end
