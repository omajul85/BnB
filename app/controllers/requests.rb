class BnByte4 < Sinatra::Base
  post '/requests/new' do
    space = Space.get(params[:space_id])
    request = Request.new(
      date_from: params[:request_from],
      date_to: params[:request_to],
      user: current_user,
      space: space,
      owner_id: params[:owner_id]
      )
    if request.user.id == request.space.user.id
      flash.next[:errors] = ['This space belongs to you']
    else
      flash.next[:saved] = ['Your booking request has been sent']
      request.save
    end
    redirect("/requests")
  end

  get '/requests' do
    @spaces = current_user.spaces
    @received_request = []
    @spaces.each do |space|
      space.requests.each do |request|
        @received_request << request
      end
    end
    @requests = current_user.requests
    @space_names = []
    @requests.each do |request|
      @space_names << request.space.name
    end
    erb :'/requests/requests'
  end

  post '/requests/approve/:request_id' do
    Request.first(id: params[:request_id]).update(status: "Confirmed")
    redirect '/requests'
  end
end