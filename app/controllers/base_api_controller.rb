class BaseApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:show, :update, :destroy, :create, :authenticate, :options]

  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  def options
      head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Bearer'
  end

  private
    def json_response(object, status = :ok)
      render json: object, status: status
    end
    # Check for valid request token and return user
    def authorize_request
      render json: (AuthorizeApiRequest.new(request.headers).call)
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
    skip_before_action :authorize_request, only: :options
end
