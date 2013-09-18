class ZipcodesController < ActionController::Base 
  
  def new
    @zipcode = Zipcode.new
  end

 def create
  binding.pry
   @zipcode = Zipcode.new(params[:zipcode])
   if @zipcode.save
     render text: "ok"
   else
     render text: "not ok"
     binding.pry
   end
 end
  def get_zip_data
    @zipcode = Zipcode.find_by_code(params[:code], :include => [:county, :state])
    if @zipcode
      @counties = County.find(:all, :conditions => [ "state_id = ?", @zipcode.county.state_id ])
      data = {
        'state' => @zipcode.state.abbr,
        'county' => @zipcode.county.name,
        'city' => @zipcode.city.titleize
      }
      render :text => data.to_json
    else
      if params[:code].blank?
        return true
      else
        if params[:code].is_zipcode?
          data = {
            'err' => "Could not find Zipcode [#{params[:code]}].  If this is a valid zipcode please notify support <support@mydomain.com>, so we can update our database."
          }
        else
          data = {
            'err' => "[#{params[:code]}] is not a valid Zipcode."
          }
        end
        render :text => data.to_json
      end
    end
  end
end
