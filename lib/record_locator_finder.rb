class Finder
  def initialize(model,record_locator_field)
    @model = model
    @record_locator_field = record_locator_field
  end

  def find(id)
    find_all(id).first
  end
  def find_all(id)
    # for Rails > 4.0, use ActiveRecord where method
    #@model.where("#{@record_locator_field}=?", Util::Base::decode(id.to_s))

    # supported until rails 4.0 from rails 2.3
    @model.find(:all, :conditions => "#{@record_locator_field}='#{Util::Base::decode(id.to_s)}'")
  end
end
