class Competition < ApplicationRecord
  before_create :assign_defaults
  has_one :answer_key

  validate :at_most_one_active

  def is_guess_correct(guess)
    guess == self.answer_key.key
  end

  def process_guess(guess)
    update(:correct_answer_count => correct_answer_count + 1) if is_guess_correct(guess)
    is_guess_correct(guess)
  end

private

  def at_most_one_active
    unless Competition.where(:is_active => true).count <= 1
      errors.add :base, "There can be only one active competition"
    end
  end

  def assign_defaults
    self.correct_answer_count = 0
  end
end
