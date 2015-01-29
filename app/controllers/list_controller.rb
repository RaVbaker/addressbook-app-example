class ListController < ApplicationController
  def index
    @contacts = Contact.order(:last_name).page(params[:page])
  end
end
