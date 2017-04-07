module Api
  module V1
    # app/controllers/users_controller.rb
    class UsersController < BaseApiController
      skip_before_action :authorize_request, only: :create

=begin
        @api {post} /auth/signup Signup User
        @apiName signupUser
        @apiGroup User

        @apiParam {String} name Nombre del usuario.
        @apiParam {String} password Contraseña del usuario.
        @apiParam {String} email email del usuario.

        @apiSuccess {String} message Mensaje de registro.
        @apiSuccess {String} auth_token  Token de usuario para hacer todas las demas peticiones
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
            "message": "Account created successfully",
            "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE0OTE0MjY4Njh9.3W-lc2ytYjhddmV5xQYuJFQMZXM-4rYwz6cyxnHNr-4"
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }

=end

      def create
        user = User.create!(user_params)
        role = Role.find_by(slug: 'client')
        user.roles << role
        auth_token = AuthenticateUser.new(user.email, user.password).call
        response = { message: Message.account_created, auth: auth_token}
        json_response(response, :created)
      end

      private

      def user_params
        params.permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
