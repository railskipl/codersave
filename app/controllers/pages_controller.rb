class PagesController < ApplicationController
   layout 'dashboard'
  def show
    @page = Page.find(params[:id])
  end
end
