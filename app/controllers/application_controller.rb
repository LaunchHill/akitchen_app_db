class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    if params[:per_page]
      resource = resource.per(params[:per_page])
    end

    return resource
  end
end
