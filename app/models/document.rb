class Document < ActiveRecord::Base
  attr_accessible :description, :published,
    :title, :file

  mount_uploader :file, DocumentUploader
end
