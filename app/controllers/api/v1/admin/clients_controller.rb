module Api
  module V1
    module Admin
      # app/controllers/users_controller.rb
      class ClientsController < BaseApiController
         before_action :set_client, only: [:show, :update, :destroy]
=begin
        @api {post} /admin/clients Crear clientes
        @apiName CreateClients
        @apiGroup Clients

        @apiParam {String} name Nombre del usuario.
        @apiParam {String} password Contraseña del usuario.
        @apiParam {String} email email del usuario.

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 8,
          "name": "Juan Ruiz",
          "last_name": null,
          "email": "juanmaca@hotmail.com",
          "password_digest": "$2a$10$8tQ1Ui7WbjVWmK1mgD2sBuVccKtJ0GeaMeJNlGpPH2z/sJNpD40O2",
          "created_at": "2017-04-10T16:17:17.855Z",
          "updated_at": "2017-04-10T16:17:17.855Z"
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
          json_response(user, :created)
        end
=begin
        @api {get} /admin/clients Obtener todos los clientes
        @apiName getClients
        @apiGroup Clients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        [
          {
            "id": 3,
            "name": "Erika",
            "last_name": "De la Vega",
            "email": "erikavega@gmail.com",
            "password_digest": "$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy",
            "created_at": "2017-04-06T18:42:10.839Z",
            "updated_at": "2017-04-06T18:42:10.839Z"
          },
          {
            "id": 4,
            "name": "Viviannys Diaz",
            "last_name": null,
            "email": "2arqwer1234z@gsafmailqwer.com",
            "password_digest": "$2a$10$nSsv9QiYaLfKth71.N38Pef/ggjwlRNy989w9iw7IR504ecfAiYIG",
            "created_at": "2017-04-10T15:22:57.622Z",
            "updated_at": "2017-04-10T15:22:57.622Z"
          }
        ]
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        def index
          role = Role.find_by(slug: 'client')
          json_response(role.users)
        end
=begin
        @api {get} /admin/clients/:id Obtener el cliente por su id
        @apiName getClientById
        @apiGroup Clients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 3,
          "name": "Erika",
          "last_name": "De la Vega",
          "email": "erikavega@gmail.com",
          "password_digest": "$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy",
          "created_at": "2017-04-06T18:42:10.839Z",
          "updated_at": "2017-04-06T18:42:10.839Z"
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # GET /clients/:id
        def show
         json_response(@client)
        end

=begin
        @api {put} /admin/clients/:id Editar el cliente por su id
        @apiName editClientById
        @apiGroup Clients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 3,
          "name": "Erika",
          "last_name": "De la Vega",
          "email": "erikavega@gmail.com",
          "password_digest": "$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy",
          "created_at": "2017-04-06T18:42:10.839Z",
          "updated_at": "2017-04-06T18:42:10.839Z"
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # PUT /clients/:client_id
        def update
          @client.update(user_params)
          json_response(@client)
        end
=begin
        @api {delete} /admin/clients/:id Eliminar el cliente por su id
        @apiName deleteClientById
        @apiGroup Clients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 3,
          "name": "Erika",
          "last_name": "De la Vega",
          "email": "erikavega@gmail.com",
          "password_digest": "$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy",
          "created_at": "2017-04-06T18:42:10.839Z",
          "updated_at": "2017-04-06T18:42:10.839Z"
        }
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # DELETE /clients/:client_id/phones/:id
        def destroy
          @client.destroy
          json_response(@client)
        end

        private

        def user_params
          params.permit(
            :name,
            :last_name,
            :email,
            :password,
            :password_confirmation,
            :avatar
          )
        end

        def set_client
          @client = Role.find_by(slug: 'client').users.find(params[:id])
        end
      end
    end
  end
end
