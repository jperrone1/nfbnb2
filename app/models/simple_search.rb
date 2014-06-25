class SimpleSearch
  include ActiveModel::Model

  #Generic Search 'q'
  attr_accessor :q, :max_price
  validates_length_of :q, minimum: 2, message: 'Please enter at least 2 letters to search'

  # Add other search params or validations here:

  def persisted?
    false
  end

  def search_accomodations_by_city
    Accommodation.all.where("city ILIKE ('%' || ? || '%')", self.q)
  end  

  def search_cheap_accomodations_by_city
    city_search = Accommodation.all.where("city ILIKE ('%' || ? || '%')", self.q)
    price_search = city_search.where('price < 100')
  end  

  def search_accomodations_by_city_and_price max_price
    city_search = Accommodation.all.where("city ILIKE ('%' || ? || '%')", self.q)
    price_search = city_search.where('price <= ?', max_price)
  end  

  def search_accomodations_by_form
    scope = Accommodation.all
    unless self.q.blank?
      scope = scope.where("city ILIKE (? || '%')", self.q)
      # puts "Added city scope: #{scope.to_sql}"
    end  
    unless self.max_price.blank?
      scope = scope.where('price <= ?', self.max_price)
      # puts "Added price scope: #{scope.to_sql}"
    end  
    # puts "Complete search for search_accomodations_by_form: #{scope.to_sql}"
    scope
  end  

  def search_within scope, column_name
    #example where scope: only added when the q param is present
    unless self.q.blank?
      # SQL Injection protection example with LIKE operator
      # Which matches partial strings:
      scope = scope.where("#{column_name} ILIKE ('%' || ? || '%')", self.q)
    end
    #Add your own filters here
    scope
  end

  def self.get_params(params, as = :simple_search)
    if params.has_key? as
      res = params.require(as).permit(:q)
      res
    end
    
  end
end