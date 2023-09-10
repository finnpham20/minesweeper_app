class ApplicationController < ActionController::Base
  include ErrorsHandler
  include FetchPage

  layout 'theme/_main'

  def params_index
    params.permit(:page, :per_page).to_h.symbolize_keys
  end

  def render_404
    flash[:error] = 'Page not found!'

    redirect_to root_path
  end
end
