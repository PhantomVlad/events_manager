class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "#{@name} подписался на мероприятие '#{event.title}'"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event
    email1 = "dl4pj2kn@spamtest.smtp.bz"
    email2 = "postmasterbz@gmail.com"

    if @comment.user.present?
      mail to: email, subject: "Новый комментарий в '#{@event.title}' от @#{@comment.user.name}"
    else
      mail to: email1, subject: "Новый комментарий в '#{@event.title}' от @#{@comment.user_name}"
      mail to: email2, subject: "Новый комментарий в '#{@event.title}' от @#{@comment.user_name}"
      mail to: email, subject: "Новый комментарий в '#{@event.title}' от @#{@comment.user_name}"
    end
  end

  def photo(event, email, photo)
    @event = event
    @photo = photo

    mail to: email, subject: "Новое фото в мероприятии '#{@event.title}'"
  end
end
