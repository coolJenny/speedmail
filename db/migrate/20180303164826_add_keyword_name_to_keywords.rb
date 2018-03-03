class AddKeywordNameToKeywords < ActiveRecord::Migration[5.1]
  def change
    add_column :keywords, :keyword_name, :string
  end
end
