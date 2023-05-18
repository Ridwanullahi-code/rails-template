class IncreaseUserBonusJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
      previous_balance = user.balance
      new_balance = previous_balance + 200

      # Perform the balance update
      user.update(balance: new_balance)

      if user.errors.empty?
        Rails.logger.info("User #{user.id}: Balance updated successfully. Previous balance: #{previous_balance}. New balance: #{new_balance}")
      else
        Rails.logger.error("User #{user.id}: Failed to update balance. Errors: #{user.errors.full_messages.join(', ')}")
      end
    end
  end
end
