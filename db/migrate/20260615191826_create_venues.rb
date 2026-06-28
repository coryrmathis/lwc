class CreateVenues < ActiveRecord::Migration[7.2]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :website
      t.text :notes
      t.datetime :last_contacted_at
      t.datetime :next_follow_up_at

      t.timestamps
    end
  end
end
