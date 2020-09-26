class ItemStatusChoice < ActiveHash::Base
    self.date = [
        { id: 1, choice: '---' },
        { id: 2, choice: '新品、未使用' },
        { id: 3, choice: '未使用に近い' },
        { id: 4, choice: '目立った傷や汚れなし' },
        { id: 5, choice: 'やや傷や汚れあり' },
        { id: 6, choice: '全体的に状態が悪い' }
    ]
end
