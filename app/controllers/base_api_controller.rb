class BaseApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:show, :update, :destroy, :create, :authenticate]
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  private
    def json_response(object, status = :ok)
      render json: object, status: status
    end
    # Check for valid request token and return user
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
