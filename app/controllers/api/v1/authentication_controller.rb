module Api
  module V1
    class AuthenticationController < BaseApiController
      skip_before_action :authorize_request, only: :authenticate
=begin
        @api {post} /auth/login Login User
        @apiName loginUser
        @apiGroup User

        @apiParam {String} password Contraseña del usuario.
        @apiParam {String} email email del usuario.

        @apiSuccess {String} auth_token  Token de usuario para hacer todas las demas peticiones
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
            "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE0OTE0MjY4Njh9.3W-lc2ytYjhddmV5xQYuJFQMZXM-4rYwz6cyxnHNr-4"
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }

=end
      # return auth token once user is authenticated
      def authenticate
        auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

        #response = {auth_token: auth_token, exp: exp, user: user }
        json_response({message: Message.login, auth: auth_token})
      end

      private

      def auth_params
        params.permit(:email, :password)
      end
    end
  end
end
