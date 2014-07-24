class WishMailer < ActionMailer::Base
  # include MailerHelper

  default from: "mailer@groupwish.co.za"
  # add_template_helper(ApplicationHelper)
  

  def wish_email(recipient, birthday, wisher_id)
  	@wisher_id = wisher_id
  	@url = 'groupwish.herokuapp.com/wishes'
  	@birthday = birthday
  	mail(to: recipient, subject: "Wish #{birthday.name} a happy birthday!")
  end
end
