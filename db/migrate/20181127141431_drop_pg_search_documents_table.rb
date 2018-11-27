class DropPgSearchDocumentsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :pg_search_documents
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
