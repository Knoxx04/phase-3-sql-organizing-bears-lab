describe 'querying the bears table' do
  let(:db) do
    SQLite3::Database.new(':memory:')
  end

  before do
    create_sql = File.read("lib/create.sql")
    db.execute_batch(create_sql)
    insert_sql = File.read("lib/seed.sql")
    db.execute_batch(insert_sql)
  end
  
  def selects_all_female_bears_return_name_and_age
    "SELECT bears.name, bears.age FROM bears WHERE sex='F';"
  end

  def selects_all_of_the_bears_names_and_orders_them_in_alphabetical_order 
    "SELECT bears.name FROM bears"
  end

  def selects_all_of_the_bears_names_and_ages_that_are_alive_and_order_them_from_youngest_to_oldest
    "SELECT bears.name, bears.age, bears.alive FROM bears" 
  end

  def selects_the_oldest_bear_and_returns_their_name_and_age
    "SELECT bears.name, bears.age WHERE age = (SELECT MAX(age) FROM bears)"
  end

  def selects_the_youngest_bear_and_returns_their_name_and_age 
    "SELECT bears.name, bears.age WHERE age = (SELECT MIN(age) FROM bears)"
  end
end
