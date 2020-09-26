class CategoryChoice < ActiveHash::Base
    self.date = [
        { id: 1, choice: '---' },
        { id: 2, choice: 'レディース' },
        { id: 3, choice: 'メンズ' },
        { id: 4, choice: 'ベビー・キッズ' },
        { id: 5, choice: 'インテリア・住まい・小物' },
        { id: 6, choice: '本・音楽・ゲーム' },
        { id: 7, choice: 'おもちゃ・ホビー・グッズ' },
        { id: 8, choice: '家電・スマホ・カメラ' },
        { id: 9, choice: 'スポーツ・レジャー' },
        { id: 10, choice: 'ハンドメイド' },
        { id: 11, choice: 'その他' }
    ]
end
