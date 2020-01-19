Golf.find_or_create_by(name: '宇陀カントリークラブ', place: '宇陀市〇〇〇〇')
Golf.find_or_create_by(name: '花吉野ゴルフクラブ', place: '〇〇〇〇')

Point.find_or_create_by(valuation: 1)
Point.find_or_create_by(valuation: 2)
Point.find_or_create_by(valuation: 3)
Point.find_or_create_by(valuation: 4)
Point.find_or_create_by(valuation: 5)

# User.create!(username: 'example', email: 'example@yahoo.co.jp', password: 'hogehoge', password_confirmation: 'hogehoge', confirmed_at: Time.now - 100)
# User.create!(username: 'example00', email: 'example123@yahoo.co.jp', password: 'fugafuga', password_confirmation: 'fugafuga', confirmed_at: Time.now - 100)
