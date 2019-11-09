class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

		#referncesは、relationshipsモデルにbelongs_to:userを自動的に追加、外部キー制約を行うマイグレーションファイルも自動的に作成
    	t.references :user, foreign_key: true
	    t.references :follow, foreign_key: { to_table: :users }

	    t.timestamps

		#データの検索高速化、一意制約の付与により、重複フォローを防ぐ
	    t.index [:user_id, :follow_id], unique: true
    end
  end
end
