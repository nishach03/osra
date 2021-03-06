module Payments
  class CreateFunds

    def self.call(*args)
      new(*args).call
    end

    def call
      payment = payment_builder.new(amount: amount, destination: cashbox)
      payment.save
    end

    private

    attr_reader :cashbox, :payment_builder, :amount

    def initialize(cashbox, amount, payment_builder = Payment)
      @cashbox = cashbox
      @amount = amount
      @payment_builder = payment_builder
    end
  end
end
