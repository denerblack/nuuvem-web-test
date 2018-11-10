class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def upload
    if attachment = params[:attachment]
      purchases = purchase_service.upload(attachment)
    else
      flash[:alert] = 'There\'s no file.'
    end
    redirect_to action: :index
  end

  private

  def purchase_service
    @purchase_service ||= PurchaseService.new
  end
end
