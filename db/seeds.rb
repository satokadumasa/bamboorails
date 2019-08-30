# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars'}, { name: 'Lord of the Rings'}])
#   Character.create(name: 'Luke', movie: movies.first)

pref_names =[
	'北海道','青森県','岩手県','宮城県','秋田県','山形県','福島県',
	'茨城県','栃木県','群馬県','埼玉県','千葉県','東京都','神奈川県',
	'新潟県','富山県','石川県','福井県','山梨県','長野県','岐阜県','静岡県','愛知県','三重県',
	'滋賀県','京都府','大阪府','兵庫県','奈良県','和歌山県',
	'鳥取県','島根県','岡山県','広島県','山口県',
	'徳島県','香川県','愛媛県','高知県',
	'福岡県','佐賀県','長崎県','熊本県','大分県','宮崎県','鹿児島県','沖縄県'
]

pref_names.each{ |pref_name|
	pref = Pref.new 
	pref.name = pref_name
	pref.save
}

user = User.new
user.email = 'admin@example.com'
user.password = 'glxre297'
user.password_confirmation = 'glxre297'
user.confirmed_at = DateTime.now
user.admin = 1
user.save

user_info = UserInfo.new
user_info.user_id = 1
user_info.name = 'Administrator'
user_info.user_name = 'Administrator'
user_info.mobile = '08011112222'
user_info.pref_id = 12
user_info.postal_code = '2702251'
user_info.address = 'Kanegasaku 408-115, Matsudo'
user_info.save

user = User.new
user.email = 'sato.kadumasa@gmail.com'
user.password = 'glxre297'
user.password_confirmation = 'glxre297'
user.confirmed_at = DateTime.now
user.admin = 1
user.save

user_info = UserInfo.new
user_info.user_id = 2
user_info.name = 'ksato'
user_info.user_name = 'ksato'
user_info.mobile = '08011112222'
user_info.pref_id = 12
user_info.postal_code = '2702251'
user_info.address = 'Kanegasaku 408-115, Matsudo'
user_info.save

user = User.new
user.email = 'mari@example.com'
user.password = 'glxre297'
user.password_confirmation = 'glxre297'
user.confirmed_at = DateTime.now
user.admin = 1
user.save

user_info = UserInfo.new
user_info.user_id = 2
user_info.name = 'mari'
user_info.user_name = 'mari'
user_info.mobile = '08011112222'
user_info.pref_id = 12
user_info.postal_code = '2702251'
user_info.address = 'Kanegasaku 408-115, Matsudo'
user_info.save


category_names = [
	'随筆','小説(恋愛)','小説(ファンタジー)','小説(SF)','小説(ハードボイルド)',
	'技術(プログラミング)','技術（ハードウェア)','科学',
	'ファンタジー','雑記帳','時事問題'
]


category_names.each{ |category_name|
	category = Category.new 
	category.name = category_name
	category.save
}

forum_categories = [
	'ノージャンル',
	'時事',
	'科学・技術',
	'食いしん坊万歳',
	'アニメ',
	'小説',
]

forum_categories.each do |forum_category|
	category = ForumCategory.create(name: forum_category)
	category.save
end

