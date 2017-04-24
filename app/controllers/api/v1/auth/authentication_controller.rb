module Api
  module V1
    module Auth
      class AuthenticationController < BaseApiController
        skip_before_action :authorize_request, :only => [:authenticate, :create]
=begin
        @api {post} /auth/login Login User
        @apiName loginUser
        @apiGroup Auth

        @apiParam {String} password Contraseña del usuario.
        @apiParam {String} email email del usuario.

        @apiSuccess {String} auth_token  Token de usuario para hacer todas las demas peticiones
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "message": "Login successfully",
          "auth": {
            "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0OTE4NDA4NDV9.iQNyEKLUDKkdHrhkttkGfnOMtX1WM1BxpxfX1G5uzGQ",
            "exp": 1799,
            "user": {
              "id": 3,
              "name": "Erika",
              "last_name": "De la Vega",
              "email": "erikavega@gmail.com",
              "password_digest": "$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy",
              "created_at": "2017-04-06T18:42:10.839Z",
              "updated_at": "2017-04-06T18:42:10.839Z",
              "todos": [],
              "roles": [
                {
                  "id": 3,
                  "name": "Cliente de inelec",
                  "slug": "client",
                  "description": "Usuario capaz de pedir presupuestos",
                  "created_at": "2017-04-06T18:42:11.259Z",
                  "updated_at": "2017-04-06T18:42:11.259Z"
                }
              ]
            },
            "type": "Bearer"
          }
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }

=end
        # return auth token once user is authenticated
        def authenticate
          user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

          #response = {auth_token: auth_token, exp: exp, user: user }
          json_response({message: Message.login, auth: user})
        end
=begin
        @api {get} /auth/user Usuario logueado
        @apiName GetUser
        @apiGroup Auth

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "user": {
            "id": 6,
            "name": "Viviannys Diaz",:identity
            "last_name": null,
            "email": "2arqweasdfadsfr1234z@sadfgsafmailqwer.com",
            "password_digest": "$2a$10$gFKpJSYE6/HWvnEXHAA0X.EOOzlH2SFHQvsNVbYpw7ZhKKgvq4bei",
            "created_at": "2017-04-10T15:34:26.710Z",
            "updated_at": "2017-04-10T15:34:26.710Z",
            "todos": [],
            "roles": [
              {
                "id": 3,
                "name": "Cliente de inelec",
                "slug": "client",
                "description": "Usuario capaz de pedir presupuestos",
                "created_at": "2017-04-06T18:42:11.259Z",
                "updated_at": "2017-04-06T18:42:11.259Z"
              }
            ]
          },
          "exp": 1527.484673432
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }

=end
        def show
          avatar = $base_url + @current_user.avatar.url
          @user = @current_user.as_json(:include => { :roles => { :include => :permissions } }).merge("avatar" => avatar ).as_json
          json_response ({user: @user, exp: @exp })
        end

=begin
        @api {post} /auth/signup Signup User
        @apiName signupUser
        @apiGroup Auth

        @apiParam {String} name Nombre del usuario.
        @apiParam {String} password Contraseña del usuario.
        @apiParam {String} email email del usuario.

        @apiSuccess {String} message Mensaje de registro.
        @apiSuccess {String} auth_token  Token de usuario para hacer todas las demas peticiones
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "message": "Account created successfully",
          "auth": {
            "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE0OTE4NDAyNjd9.RIBUjcNndbZBQiys2JvJESQJLiBQ_NY4lk7veQBpuX0",
            "type": "Bearer"
            "exp": 1799,
            "user": {
              "id": 6,
              "name": "Viviannys Diaz",
              "last_name": null,
              "email": "2arqweasdfadsfr1234z@sadfgsafmailqwer.com",
              "password_digest": "$2a$10$gFKpJSYE6/HWvnEXHAA0X.EOOzlH2SFHQvsNVbYpw7ZhKKgvq4bei",
              "created_at": "2017-04-10T15:34:26.710Z",
              "updated_at": "2017-04-10T15:34:26.710Z",
              "todos": [],
              "roles": [
                {
                  "id": 3,
                  "name": "Cliente de inelec",
                  "slug": "client",
                  "description": "Usuario capaz de pedir presupuestos",
                  "created_at": "2017-04-06T18:42:11.259Z",
                  "updated_at": "2017-04-06T18:42:11.259Z"
                }
              ]
            }
          }
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
          user.avatar_url = $base_url + user.avatar.url(:medium)
          user.save
          auth_token = AuthenticateUser.new(user.email, user.password).call
          response = { message: Message.account_created, auth: auth_token}
          json_response(response, :created)
        end

        private

        def auth_params
          params.permit(:email, :password)
        end

        def user_params
          params.permit(
            :name,
            :email,
            :password,
            :password_confirmation,
            :avatar,
            :identity,
            :description,
            :type_identity
          )
        end
      end
    end
  end
end
