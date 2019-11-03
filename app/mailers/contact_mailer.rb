class ContactMailer < ApplicationMailer
	default from: 'no-replay@gmail.com'

	def send_mail(contact)
		@contact = contact
	  mail(
			to: ENV['EMAIL'],
			subject: "お問い合わせがありました"
		)	
	end	
end
