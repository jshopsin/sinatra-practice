get '/' do
  "Hello World"
end

# CONTACTS RESTful actions


# COLLECTION ACTIONS:

# index
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

# new
get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

# create
post '/contacts' do
  puts params
  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end


# MEMBER ACTIONS:

# show
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

# edit
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# update
def update_contact
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}"
end

patch '/contacts/:id' do
  update_contact
end

put '/contacts/:id' do
  update_contact
end

# delete
delete '/contacts/:id' do
  "This is the contacts delete action"
end