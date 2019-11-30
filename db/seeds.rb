# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ユーザ情報　5人分
12.times do |i|
	User.create!(:email=>"user#{i + 1}@com", :password=>"000000", :user_introduction=>"ユーザ紹介文#{i + 1}",:sex=>0, :name =>"ユーザ名", :age=>0)
end

# 管理者ログイン情報
Admin.create(:email => "admin@com", :password=>"000000")


Item.create(:item_name=>"カタン", :item_body=>"無人島の開拓競争！5つの資源をめぐったプレイヤー間の「貿易」が超おもしろい！", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"宝石の煌き", :item_body=>"無人島の開拓競争！5つの資源をめぐったプレイヤー間の「貿易」が超おもしろい！", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"カルソンヌ", :item_body=>"地形を作って占領ポイントをゲット！自分を育てるか・相手を潰すかはあなた次第。", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ニムト", :item_body=>"牛を引き取らないようにカードを出せ！大人数でもできる大人気パーティゲーム", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"犯人は踊る", :item_body=>"アリバイカードと犯人カードを両方持っている人は、犯人ではありません。", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ラブレター", :item_body=>"短時間で決着がつく奥深いカードゲーム！
", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ドミニオン", :item_body=>"デッキを構築しながら強化しよう！成長型カードゲームの最定番", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"バトルライン", :item_body=>"ポーカー×陣取りゲーム！？戦略力が試される２人専用カードゲーム", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ハゲタカのえじき", :item_body=>"ドッキドキな数字比べ！熱い駆け引きが楽しめる簡単ボードゲーム！", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ごきぶりポーカー", :item_body=>"きも～いカードを押し付け合って1人負けを決める！仲良い友達と遊ぶのがオススメ", :price=>"5000", :category=>"", :person=>"", :time=>"" )
Item.create(:item_name=>"ディクシット", :item_body=>"絵と物語りがゲームとなったコミュニケーションゲーム", :price=>"5000", :category=>"", :person=>"", :time=>"" )

