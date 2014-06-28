class WishMailer < ActionMailer::Base
  default from: "mailer@groupwish.co.za"

  def wish_email(recipient, name, day)
  	@url = 'cryptic-wave-8513.herokuapp.com/wishes'
  	@name = name
  	@day = day
  	mail(to: recipient, subject: "Wish #{name} a happy birthday!")
  end
end
