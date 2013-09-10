class NewsletterController < ApplicationController
  def subscribe
    @subscriber = Subscriber.new(email: params[:email])
    if @subscriber.with(safe: true).save
      redirect_to root_path, flash: { notice: 'You have successfully signed up!' }
    else
      redirect_to root_path, flash: { error: 'We were unable to sign you up. Please try again.' }
    end
  end
end
