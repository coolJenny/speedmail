class AddKeywordgroupRefToRecipients < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipients, :keywordgroup, foreign_key: true
  end
end
