class CreateBenefitCategories < ActiveRecord::Migration
  def change
    create_table :benefit_categories do |t|
      t.string :name,null: false, :limit => 60
      t.integer :meansure,null: false
      t.timestamps null: false
    end
  end
end
