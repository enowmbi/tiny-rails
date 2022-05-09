module ActiveRecord
  class Base
    def self.primary_abstract_class
    end

    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(name, *args)
      columns = self.class.connection.columns(self.class.table_name)

      if columns.include?(name)
         @attributes[name]
      else
        super
      end
    end

    def self.table_name
      name.downcase + "s"
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{self.table_name} where id=#{id.to_i}").first
    end

    def self.all
      find_by_sql("SELECT * FROM #{self.table_name}")
    end

    def self.find_by_sql(sql)
      attributes = connection.execute(sql).map do |attribute|
        new(attribute)
      end
    end

    def self.establish_connection(options)
      @@connection = ConnectionAdapter::SqliteAdapter.new(options[:database])
    end

    def self.connection
      @@connection
    end
  end
end
