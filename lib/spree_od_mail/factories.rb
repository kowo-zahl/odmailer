FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_od_mail/factories'
  

  
  factory :email, class: 'Spree::Odmailer' do
    email { ['test1@example.com','test2@example.com','test3@example.com'].sample}
  end
  

end
