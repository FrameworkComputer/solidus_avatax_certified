# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SolidusAvataxCertified::Engine do
  describe 'decorator loading' do
    it 'registers the Spree::Order cancel_avalara callback once' do
      expect(callback_count(Spree::Order, :cancel_avalara)).to eq(1)
    end

    it 'registers the Spree::Order validate_ship_address callback once' do
      expect(callback_count(Spree::Order, :validate_ship_address)).to eq(1)
    end

    it 'registers the Spree::Payment avalara_finalize callback once' do
      expect(callback_count(Spree::Payment, :avalara_finalize)).to eq(1)
    end

    it 'registers the Spree::Payment cancel_avalara callback once' do
      expect(callback_count(Spree::Payment, :cancel_avalara)).to eq(1)
    end
  end

  def callback_count(klass, method)
    klass.state_machine.callbacks.values.flatten.count do |callback|
      callback.instance_variable_get(:@methods)&.include?(method)
    end
  end
end
