class CreateWards < ActiveRecord::Migration[5.0]
  def change
    create_table :wards do |t|
      t.integer :zone
      t.integer :ward_number
      t.string :ward_name
      t.string :ward_officer
      t.integer :ward_officer_number
      t.string :corporator
      t.integer :corporator_number
      t.string :inspector
      t.integer :inspector_number
      t.string :jawan
      t.integer :jawan_number
      t.integer :amc_labour_male
      t.integer :amc_labour_female
      t.integer :pvt_labour_male
      t.integer :pvt_labour_female
      t.integer :total_labour_male
      t.integer :total_labour_female
      t.integer :v_haathgadi
      t.integer :v_cyclericks
      t.integer :v_hydraulicauto
      t.integer :v_loadingauto
      t.integer :v_tractor
      t.integer :v_407
      t.integer :hook_loader
      t.integer :skip_loader
      t.integer :households
      t.integer :comm_est
      t.integer :edu_est
      t.integer :med_est
      t.string :waste_org
      t.string :waste_dry
      t.float :waste_org_qty
      t.float :waste_dry_qty
      t.float :waste_haz_qty

      t.timestamps
    end
  end
end
