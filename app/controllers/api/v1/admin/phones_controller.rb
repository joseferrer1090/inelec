module Api
  module V1
    module Admin
      class PhonesController < BaseApiController
        before_action :set_client
        before_action :set_client_phone, only: [:show, :update, :destroy]

        # GET /clients/:client_id/phones
        def index
          json_response(@client.phones)
        end

        # GET /clients/:client_id/phones/:id
        def show
          json_response(@phone)
        end

        # POST /clients/:client_id/phones
        def create
          phone = @client.phones.create!(phone_params)
          json_response(phone, :created)
        end

        # PUT /clients/:client_id/phones/:id
        def update
          @phone.update(phone_params)
          json_response(@phone)
        end

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
          @client = User.find(params[:client_id])
        end

        def set_client_phone
          @phone = @client.phones.find_by!(id: params[:id]) if @client
        end
      end
    end
  end
end
