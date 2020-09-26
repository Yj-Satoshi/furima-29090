class SendFeeChoice < ActiveHash::Base
    self.date = [
        { id: 1, choice: '---' },
        { id: 2, choice: '着払い（購入者負担）' },
        { id: 3, choice: '送料込み（出品者負担）' }
    ]
end

