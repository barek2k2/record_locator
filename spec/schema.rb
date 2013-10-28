ActiveRecord::Schema.define(:version => 20131015114743) do

  create_table "books", :force => true do |t|
    t.integer "id"
    t.integer "publisher_id"
  end

end