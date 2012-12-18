class AddConfirmedTrueToPreviousIndices < ActiveRecord::Migration
  def change
    Index.find_each do |idx|
      idx.confirmed = true
      idx.save
    end
  end
end
