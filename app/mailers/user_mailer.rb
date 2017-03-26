class UserMailer < ApplicationMailer
	default from: "mauricio.medina.munoz@gmail.com"
	def welcome()
		mail(to: "mauricio.medina.munoz@gmail.com", subject: 'Seguimiento')
	end




end
