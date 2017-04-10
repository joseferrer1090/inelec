module Api
  module V1
    class CompaniesController < BaseApiController
      before_action :set_client
      before_action :set_client_company, only: [:show, :update, :destroy]

      # GET /clients/:client_id/companies
      def index
        json_response(@Client.companies)
      end

      # GET /clients/:client_id/companies/:id
      def show
        json_response(@company)
      end

      # POST /clients/:client_id/companies
      def create
        @Client.companies.create!(item_params)
        json_response(@Client, :created)
      end

      # PUT /clients/:client_id/companies/:id
      def update
        @company.update(company_params)
        head :no_content
      end

      # DELETE /clients/:client_id/companies/:id
      def destroy
        @company.destroy
        head :no_content
      end

      private

      def company_params
        params.permit(:name, :done)
      end

      def set_client
        @Client = Clients.find(params[:client_id])
      end

      def set_client_company
        @company = @Client.companies.find_by!(id: params[:id]) if @Client
      end
    end
  end
end
