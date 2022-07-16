module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def guest_user
    OpenStruct.new(
      name: "Guest User", 
      first_name: "Guest", 
      last_name: "User", 
      email: '1123@gmail.com')
  end

  # this method already exists in devise, we are overriding it
  def current_user
    super || guest_user
  end
end