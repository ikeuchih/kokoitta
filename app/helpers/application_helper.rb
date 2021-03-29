module ApplicationHelper
    
    # ページごとの完全なタイトルを返す
    def full_title(page_title = '')
        base_title = "kokoitta!"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    # ベースタイトルはkokoittaです
    # ページタイトルが空であればベースタイトルのみ表示
    # 空じゃないのであればページタイトル|ベースタイトルを表示
end
