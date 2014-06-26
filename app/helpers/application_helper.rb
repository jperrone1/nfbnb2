module ApplicationHelper

  # This code enables use of price ranges in search: 

  def accommodation_price_ranges
    [['Cheap <= $50','50'],['Low <= $100','100'],['Mid Range <= $200','200'],['Expensive <= $500','500'],['Elite  <= $200000','200000']]
  end

  def extract_label full_label
    label = full_label[0...(full_label.index("<"))]
  end

  def lookup_price_range_label max_price
    
    ranges = accommodation_price_ranges

    index = ranges.index { |x| 
      x[1] == max_price.to_s
    }

    if index.blank?
      nil
    else  
      extract_label ranges[index][0]
    end
    
  end  

end
