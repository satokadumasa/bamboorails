class ChatChannel < ApplicationCable::Channel
  def subscribed
  	logger.debug("ChatChannel.subscribed")
    stream_from "chat_remark"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def remark(data)
    remark = Remark.new()
    remark.lounge_id = data['lounge_id']
    remark.user_id = data['user_id']
    remark.content = data['content']
  	logger.debug("ChatChannel.remark remark:" + remark.inspect)
    remark.save
    remarks = Remark.eager_load(user: :user_info).where('remarks.created_at > ? ', data['last_posted_at']).where(lounge_id: data['lounge_id'])
    @remarks = remark.resp_with_json(remarks)
    ActionCable.server.broadcast('chat_remark',@remarks)
  end
end
