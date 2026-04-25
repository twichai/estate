class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: "Logged in successfully.",
        user: {
          id: resource.id,
          email: resource.email,
          roles: resource.roles.pluck(:name)
        }
      }, status: :ok
    else
      render json: { message: "Invalid email or password." }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully." }, status: :ok
  end
end
