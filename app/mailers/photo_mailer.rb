class PhotoMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def post_email(photo)
    @user = photo.user
    mail(to: @user.email, subject: "投稿完了しました")
  end
end
