module Goldencobra
  class Import < ActiveRecord::Base
    require "csv"
    belongs_to :upload, :class_name => Goldencobra::Upload
    serialize :assignment
    
    BlockedAttributes = ["id", "created_at", "updated_at", "url_name", "slug"]
    
    def analyze_csv
      result = []
      data = CSV.read(self.upload.image.path, {:col_sep => self.separator})
      data.first.each_with_index do |a, index|
        result << [a,index.to_s]
      end 
      @analyze_csv ||= result
    end
    
    def get_model_attributes
      @get_model_attributes ||= eval("#{self.target_model}.new.attributes").delete_if{|a| BlockedAttributes.include?(a) }.keys
    end
    
    
    def method_missing(meth, *args, &block)
      if meth.to_s.include?("assignment_")
        self.assignment[meth.to_s.split("_")[1]]
      end
    end   
    
    def status
      @status ||="ready to import"
    end
    
    def run!
      self.result = []
      count = 0
      CSV.foreach(self.upload.image.path, {:col_sep => self.separator} ) do |row|
        new_object = self.target_model.constantize.new
        self.assignment.each do |key,value|
          next if value.blank?
          attr_name = key
          attr_value = row[value.to_i]
          new_object.send("#{attr_name}=", attr_value)
        end
        begin
          new_object.save
        rescue e
          self.result << "#{count} - #{e}"
        end
        count += 1
      end
    end
    
  end
end
