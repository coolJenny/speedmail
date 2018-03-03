class AddCcStateToRecipients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipients, :cc_state, :boolean
  end
end
