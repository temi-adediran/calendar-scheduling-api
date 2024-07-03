class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.references :memberable, polymorphic: true

      t.timestamps
    end
  end
end
