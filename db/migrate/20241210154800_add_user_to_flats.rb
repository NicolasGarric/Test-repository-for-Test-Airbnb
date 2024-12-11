class AddUserToFlats < ActiveRecord::Migration[7.0]
  def change
    # Ajout initial de la colonne sans la contrainte NOT NULL
    add_reference :flats, :user, foreign_key: true

    # Associe un utilisateur par défaut (ex. ID: 1) pour tous les enregistrements existants
    reversible do |dir|
      dir.up do
        default_user_id = User.first.id # Assurez-vous qu'il y a un utilisateur existant
        Flat.update_all(user_id: default_user_id)
      end
    end

    # Ajoute la contrainte NOT NULL après avoir mis à jour les enregistrements existants
    change_column_null :flats, :user_id, false
  end
end
