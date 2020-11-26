class MigrateLastWordstoRichBodyObituaries < ActiveRecord::Migration[6.0]
  def up
    Obituary.find_each do |obituary|
      obituary.update(rich_body: obituary.last_words)
    end
  end

  def down
    Obituary.find_each do |obituary|
      obituary.update(last_words: obituary.rich_body)
      obituary.update(rich_body: nil)
    end
  end
end
