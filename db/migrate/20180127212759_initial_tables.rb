class InitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :variants do |t|
      t.string :name
      t.integer :product_id
      t.timestamps
    end

    create_table :documents do |t|
      t.string :name
      t.timestamps
    end

    create_table :items do |t|
      t.integer :variant_id
      t.integer :document_id
      t.timestamps
    end

    add_attachment :products, :picture
    add_index :variants, :product_id
    add_index :items, :variant_id
    add_index :items, :document_id
  end
end
