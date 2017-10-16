class Spree::Admin::OdmailersController < Spree::Admin::ResourceController
  
  def index
      @emails = Spree::Odmailer.all
      
      respond_with do |format|
      format.html
      format.json
    end
  end
  
  def new
    @email = Spree::Odmailer.new
      respond_with do |format|
      format.html
      format.json
    end
  end
  
end