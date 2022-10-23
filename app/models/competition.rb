class Competition < ApplicationRecord
  before_create :assign_defaults
  has_one :answer_key

  def is_guess_correct(guess)
    guess == self.answer_key.key
  end

  def process_guess(guess)
    update(:correct_answer_count => correct_answer_count + 1) if is_guess_correct(guess)
    is_guess_correct(guess)
  end

private

  def assign_defaults
    self.correct_answer_count = 0
  end
end
