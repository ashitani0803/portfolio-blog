class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def confirm
		@contact = Contact.new(contact_params)
		render :new if @contact.invalid?
	end

	def create
		@contact = Contact.new(contact_params)
		if params[:back]
			render :new
		elsif @contact.save
			ContactMailer.send_mail(@contact).deliver
			redirect_to complete_contacts_path
		else
			render :new
		end
	end

    def complete
    	@user = User.find(1)
    	@tags = Tag.all
    end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :title, :body)
	end

end
