require "sinatra"
require_relative "contact"

get "/" do
  redirect to("/contacts")
end

get "/contacts" do
  @title = "Contacts"
  @list_size = Contact.count
  @all_contacts = Contact.all
  erb :home
end

get "/contacts/new" do
  erb :new
end

get "/contacts/:id" do
  params[:id]
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    erb :error
  end
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end


get "/about" do
  @title = "About Me"
  erb :about
end