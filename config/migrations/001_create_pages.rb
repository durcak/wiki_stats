# encoding : utf-8

Sequel.migration do
  up do
    create_table(:Pages) do
      primary_key :id
      String :page
    end
  end

  down do
    drop_table(:Pages)
  end
end
