class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :image
    	t.integer :position
      t.string :price
    	t.timestamps
    end

    reversible do |dir|
      dir.up do
        Product.create_translation_table! :title => :string, :text => :text
      end

      dir.down do 
        Product.drop_translation_table!
      end
    end

  end
end
