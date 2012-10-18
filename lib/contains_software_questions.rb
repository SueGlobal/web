module ContainsSoftwareQuestions
  def self.included(base)
    base.has_one :software_question, as: :studiable
  end
end
