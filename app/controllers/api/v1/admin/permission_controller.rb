module Api
  module V1
    module Admin
      class PhonesController < BaseApiController
        before_action :set_client
        before_action :set_client_phone, only: [:show, :update, :destroy]
=begin
        @api {get} /admin/clients/:id/phones Obtener todos los telefonos del cliente
        @apiName getPhoneClients
        @apiGroup PhoneClients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        [
          {
            "id": 1,
            "number": "158 156215",
            "type_number": "Casa",
            "primary": false,
            "country_code": "+57",
            "user_id": 3,
            "created_at": "2017-04-11T14:05:11.055Z",
            "updated_at": "2017-04-11T14:05:11.055Z"
          },
          {
            "id": 2,
            "number": "158 4234215",
            "type_number": "Trabajo",
            "primary": false,
            "country_code": "+57",
            "user_id": 3,
            "created_at": "2017-04-11T14:05:42.575Z",
            "updated_at": "2017-04-11T14:05:42.575Z"
          }
        ]
        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # GET /clients/:client_id/phones
        def index
          json_response(@client.phones)
        end
=begin
        @api {get} /admin/clients/:client_id/phones/:id Obtener el telefono por su id
        @apiName getPhoneClientById
        @apiGroup PhoneClients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 1,
          "number": "158 156215",
          "type_number": "Casa",
          "primary": false,
          "country_code": "+57",
          "user_id": 3,
          "created_at": "2017-04-11T14:05:11.055Z",
          "updated_at": "2017-04-11T14:05:11.055Z"
        }

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # GET /clients/:client_id/phones/:id
        def show
          json_response(@phone)
        end
=begin
        @api {post} /admin/clients/:id/phones Crear telefono
        @apiName CreatePhoneClientById
        @apiGroup PhoneClients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 1,
          "number": "158 156215",
          "type_number": "Casa",
          "primary": false,
          "country_code": "+57",
          "user_id": 3,
          "created_at": "2017-04-11T14:05:11.055Z",
          "updated_at": "2017-04-11T14:05:11.055Z"
        }

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # POST /clients/:client_id/phones
        def create
          phone = @client.phones.create!(phone_params)
          json_response(phone, :created)
        end
=begin
        @api {put} /admin/clients/:client_id/phones/:id Editar el telefono por su id
        @apiName editPhoneClientById
        @apiGroup PhoneClients

        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "id": 1,
          "number": "158 156215",
          "type_number": "Casa",
          "primary": false,
          "country_code": "+57",
          "user_id": 3,
          "created_at": "2017-04-11T14:05:11.055Z",
          "updated_at": "2017-04-11T14:05:11.055Z"
        }

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # PUT /clients/:client_id/phones/:id
        def update
          @phone.update(phone_params)
          json_response(@phone)
        end
=begin
        @api {delete} /admin/clients/:client_id/phones/:id eliminar el telefono por su id
        @apiName deletePhoneClientByIdclients
          "id": 1,
          "number": "158 156215",
          "type_number": "Casa",
          "primary": false,
          "country_code": "+57",
          "user_id": 3,
          "created_at": "2017-04-11T14:05:11.055Z",
          "updated_at": "2017-04-11T14:05:11.055Z"
        }

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
            "error": "UserNotFound"
        }
=end
        # DELETE /clients/:client_id/phones/:id
        def destroy
          @phone.destroy
          json_response(@phone)
        end

        private

        def phone_params
          params.permit(:number, :type_number, :country_code, :primary)
        end

        def set_client
          @client = User.find(params[:client_id] || params[:user_id])
        end

        def set_client_phone
          @phone = @client.phones.find_by!(id: params[:id]) if @client
        end
      end
    end
  end
end
