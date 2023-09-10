# frozen_string_literal: true

module ErrorsHandler
  extend ActiveSupport::Concern

  class BadRequest < StandardError
  end

  class Forbidden < StandardError
  end

  class Unauthorized < StandardError
  end

  included do
    rescue_from BadRequest, with: :handle_bad_request
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  end

  private

  def handle_bad_request(exception)
    flash[:error] = exception.record&.errors&.messages
    redirect_to root_path
  end

  def handle_record_invalid(exception)
    flash[:error] = exception.record&.errors&.messages
    redirect_to root_path
  end

  def handle_record_not_found(exception)
    flash[:error] = exception.model ? "The #{exception.model.constantize.model_name.human} is not found." : exception.message
    redirect_to root_path
  end
end
