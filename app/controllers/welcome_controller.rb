require 'rubygems'
require 'twilio-ruby'

class WelcomeController < ApplicationController
  def Index
  end

  def Send
    account_sid = 'AC98c784aefb43e53f826c83f5e4b165ea' 
    auth_token = '4360925595a83e9ff93acc284cd8fcaf' 
    sender = '+13019692806'
    @receiver = params[:number]
    @message = params[:message]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
     :from => sender, 
      :to => @receiver,
      :body => @message
    })
    render :text => "Message Sent", :layout => false
  end

end
