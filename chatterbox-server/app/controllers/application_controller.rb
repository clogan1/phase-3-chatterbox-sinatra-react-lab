class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do 
    messages = Message.all.order('created_at ASC')
    messages.to_json
  end

  post '/messages' do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

  patch '/messages/:id' do
    updated_message = Message.find(params[:id])
    updated_message.update(
      body: params[:body]
    )
    updated_message.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end

  
end
