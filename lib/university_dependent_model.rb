module UniversityDependentModel

  def self.included(base)
    base.belongs_to :university
  end
end
