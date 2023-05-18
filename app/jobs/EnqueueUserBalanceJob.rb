class EnqueueUserBalanceJob < ApplicationJob
  queue_as :default

  def perform
    Resque.enqueue(IncreaseUserBalanceJob)
  end
end