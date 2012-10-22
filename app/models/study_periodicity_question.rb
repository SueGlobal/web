class StudyPeriodicityQuestion < ActiveRecord::Base
  belongs_to :studiable, polymorphic: true

  attr_accessible :other_description, :periodicity

  def self.select_options
    [
      ["Anual", "anual"],
      ["Bianual", "bianual"],
      ["Trianual", "trianual"],
      ["Sin periodicidad", "no periodicity"],
      ["Otro", "other"]
    ]
  end
end
