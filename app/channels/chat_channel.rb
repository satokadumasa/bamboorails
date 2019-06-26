class ChatChannel < ApplicationCable::Channel
  def subscribed()
    room = "chat_#{params[:room]}"
    stream_from room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def remark(data)
    remark = Remark.new()
    remark.lounge_id = data['lounge_id']
    remark.user_id = data['user_id']
    remark.content = data['content']
    room = data['room']
    remark.save
    remarks = Remark.eager_load(user: :user_info).where('remarks.created_at > ? ', data['last_posted_at']).where(lounge_id: data['lounge_id']).order(:created_at)
    @remarks = remark.resp_with_json(remarks)
    ActionCable.server.broadcast("chat_#{room}",@remarks)
  end
end
