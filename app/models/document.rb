class Document < ActiveRecord::Base
  attr_accessible :description, :published,
    :title, :file

  validates_presence_of :title, :description
  mount_uploader :file, DocumentUploader
end
