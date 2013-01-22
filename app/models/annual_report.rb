class AnnualReport < Document

  before_validation :default_title, on: :create
  before_validation :default_description, on: :create

  class << self
    def published
      where(published: true)
    end
  end

  default_scope do
    order 'id DESC'
  end

  protected
  def default_title
    self.title ||= File.basename(file.filename, '.*').titleize if file
  end

  def default_description
    self.description ||= File.basename(file.filename, '.*') if file
  end
end
