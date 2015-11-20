class ChangePriceTypeInConcerts < ActiveRecord::Migration
  def change
    change_column :concerts, :price, :float
  end
end
