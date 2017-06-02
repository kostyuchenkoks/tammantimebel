class UserMailer < ApplicationMailer

  # Тема письма может быть указана в файле I18n config/locales/en.yml
  # следующим образом:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Тема письма может быть указана в файле I18n config/locales/en.yml
  # следующим образом:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
