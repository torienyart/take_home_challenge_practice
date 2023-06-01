class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error_response

  def error_response(error)
    render json: {errors: error.message}, status: 404
  end
end
