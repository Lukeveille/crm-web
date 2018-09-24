require "sinatra"
require_relative "contact"

get "/" do
  redirect to("/home")
end

get "/home" do
  @title = "Home"
  @list_size = Contact.count
  @all_contacts = Contact.all
  erb :home
end

get "/add_contact" do
  @title = "Add a Contact"
  erb :add_contact
end

get "/about" do
  @title = "About Me"
  erb :about
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