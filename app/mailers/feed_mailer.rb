class FeedMailer < ApplicationMailer

  def feed_mail(feed)
  @feed = feed
  
  mail to: "thy2017a@yahoo.co.jp", subject: "お問い合わせの確認メール"
  end
end
