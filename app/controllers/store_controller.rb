class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end
  def index_time
    @time = Time.now.strftime("%H:%M:%S ")
    logger.debug "!!!!!!!!!!!"
    logger.debug @time
  end
  def get_time
    @time = Time.now.strftime("%H:%M:%S ")
    render "store/date"
  end
end
