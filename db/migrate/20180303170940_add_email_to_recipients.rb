class AddEmailToRecipients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipients, :email, :string
  end
end
