class WishMailer < ActionMailer::Base
  # include MailerHelper

  default from: "mailer@groupwish.co.za"
  # add_template_helper(ApplicationHelper)
  

  def wish_email(recipient, name, day)
  	@url = 'cryptic-wave-8513.herokuapp.com/wishes'
  	@name = name
  	@day = day
  	mail(to: recipient, subject: "Wish #{name} a happy birthday!")
  end
end
