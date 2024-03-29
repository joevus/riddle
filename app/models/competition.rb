class Competition < ApplicationRecord
  before_create :assign_defaults
  has_one :answer_key
  has_many :winner

  validate :at_most_one_active

  def self.with_winners
    competitions = Competition.all
    competitions = competitions.select do |competition|
      Winner.where(:competition_id => competition.id ).count >= 1
    end
    competitions
  end

  def top_winners(num)
    Winner.where(:competition_id => self.id).order(:ranking => :desc).limit(num)
  end

  def is_guess_correct(guess)
    guess == self.answer_key.key
  end

  def correct_answer_number
    # alternative way to count number of correct answers
    # there is also the correct_answer_count field on competition.
    # but this is more up to date while testing
    # will probably just want to have one way at some point
    Winner.where(:competition_id => self.id).count
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
