class FeedMailer < ApplicationMailer
  def feed_mail(feed)
  @feed = feed

  mail to: "自分のメールアドレス", subject: "お問い合わせの確認メール"
  end
end
