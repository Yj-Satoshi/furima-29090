class SendDateChoice < ActiveHash::Base
    self.date = [
        { id: 1, choice: '---' },
        { id: 2, choice: '1〜2日で発送' },
        { id: 3, choice: '2〜3日で発送' },
        { id: 4, choice: '4〜7日で発送' }
    ]
end

