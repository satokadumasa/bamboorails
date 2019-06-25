class MessagesController < WebsocketRails::BaseController
  def create
    # logger.debug("MessagesController.create params:" + params.inspect)
    # remark = Remark.new(remark_params)
    # remark.save
    # remarks = Remark.eager_load(user: :user_info).where('remarks.created_at > ? ', params[:last_posted_at]).where(lounge_id: remark_params[:lounge_id])
    # @remarks = remark.resp_with_json(remarks)
    # logger.debug("MessagesController.create remarks:" + @remarks.inspect)
    # send_message :spread_message, @remarks #ブラウザから送られてきたデータはmessageに入っている
  end
end
