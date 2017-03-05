class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :username
	    t.string :password_digest
      t.integer :version_number
      t.string :email
      t.string :telephone
      t.string :address
      t.string :image
      t.integer :products_last_position
      t.integer :wines_last_position
      t.integer :services_last_position
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Admin.create_translation_table! :title => :string, :text => :text
      end

      dir.down do 
        Admin.drop_translation_table!
      end
    end
  end
end
