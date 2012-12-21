class AnnualReport < Document
  class << self
    def published
      where(published: true)
    end
  end
end
