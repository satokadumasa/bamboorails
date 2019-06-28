class ChatChannel < ApplicationCable::Channel
  def subscribed()
    room = "chat_#{params[:room]}"
    stream_from room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.debug("ChatChannel.unsubscribed");
  end

  def remark(data)
    remark = Remark.new()
    remark.lounge_id = data['lounge_id']
    remark.user_id = data['user_id']
    user = User.find(data['user_id'])
    user_name = user.user_info ? user.user_info.user_name : 'User-' + user.id.to_s;
    image_path = user.user_info ? user.user_info.image_path() : '/assets/nimage.png'

    attends = []
    case data['content']
    when 'attend' then
      data['content'] = '[' + user_name + ']さんが入室しました。'

      lounge_member = LoungeMember.create([lounge_id: data['lounge_id'],user_name: user_name, user_id: data['user_id'], image_path: image_path])
      lounge_members = LoungeMember.where(lounge_id: data['lounge_id'])

      lounge_members.each do |lounge_member|
        attend = {user_id: lounge_member.user_id, user_name: lounge_member.user_name, image_path: lounge_member.image_path}
        attends.push(attend)
      end
    when 'secession' then
      data['content'] = '[' + user_name + ']さんが退室しました。'
      lounge_members = LoungeMember.where(lounge_id: data['lounge_id']).where(user_id: data['user_id'])
      lounge_members.each do |lounge_member|
        lounge_member.destroy
      end
      secession = {user_id: data['user_id'], user_name: user_name, image_path: image_path}
    else
    end
    remark.content = data['content']
    remark.save

    room = data['room']
    user = User.find(data['user_id'].to_i)
    remarks = Remark.eager_load(user: :user_info).where('remarks.created_at > ? ', data['last_posted_at']).where(lounge_id: data['lounge_id']).order(:created_at)
    remarks_data = {'remarks': remark.resp_with_json(remarks), attends: attends, secession: secession}
    ActionCable.server.broadcast("chat_#{room}",remarks_data)
  end
end
