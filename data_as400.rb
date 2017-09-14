class DataAs400

  def create_table_sql
    #   Get the columns to make a create table statement? 
    x = []
    Survey.columns.each { |c| x << "#{ c.name } #{ c.sql_type }" }
    "create table xxx (#{ x.join(', ')})"
    sql = []
    #
    #
  end

  def make_create_for_seeds
    # This is how you convert DB2 data into create statements
    Survey.all.each do |survey|
      x = []
      survey.attributes.each do |k,v| 
        x << "#{ k }: '#{ v.to_s.strip }'" 
      end
      sql << "Survey.create(#{ x.join(', ') })"
    end

    File.open("data_to_save2.txt","w:UTF-8") do |f| 
      sql.each do |s|
        f.write (s.encode("UTF-8", "ISO-8859-15"))
        f.write "\n"
      end
    end
  end
end