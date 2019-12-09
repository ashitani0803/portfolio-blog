class ContactsController < ApplicationController

	def new 
		@contact = Contact.new
	end

	def confirm
		@contact = Contact.new(contact_params)
		render :new if @contact.invalid?
	end

	def create
		contact = Contact.new(contact_params)
		if params[:back]
			render :new
		elsif contact.save
			ContactMailer.send_mail(contact).deliver
			flash[:success] = "お問い合わせを受け付けました"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :title, :body)
	end

end
