module ContainsBasicQuestions
  def self.included(base)
    base.has_one :basic_question, as: :studiable
  end
end
