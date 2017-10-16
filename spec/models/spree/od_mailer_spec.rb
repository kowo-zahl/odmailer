require 'spec_helper'
require 'rspec/active_model/mocks'

class FakeCalculator < Spree::Calculator
  def compute(computable)
    5
  end
end

describe Spree::Order, type: :model do
  include ActiveJob::TestHelper
  let(:user) { stub_model(Spree::User, email: "spree@example.com") }
  let(:order) { stub_model(Spree::Order, user: user) }

  before do
    create(:store)
    allow(Spree::User).to receive_messages(current: mock_model(Spree::LegacyUser, id: 123))
    clear_enqueued_jobs
  end
  

    it "should not send an od email" do
      order.finalize!
      expect(ActionMailer::DeliveryJob.queue_adapter.enqueued_jobs.count{ |x| x[:job] == ActionMailer::DeliveryJob}).to eq(1)
    end
    
    it "should send 1 od email" do
      email = create(:email)
      order.finalize!
      expect(ActionMailer::DeliveryJob.queue_adapter.enqueued_jobs.count{ |x| x[:job] == ActionMailer::DeliveryJob}).to eq(2)
    end
    
    it "should not send 3 od email" do
      create(:email)
      create(:email)
      create(:email)
      order.finalize!
      expect(ActionMailer::DeliveryJob.queue_adapter.enqueued_jobs.count{ |x| x[:job] == ActionMailer::DeliveryJob}).to eq(4)
    end


end
