class Finder
  def initialize(model,record_locator_field)
    @model = model
    @record_locator_field = record_locator_field
  end

  def find(id)
    find_all(id).first
  end
  def find_all(id)
    @model.where("#{@record_locator_field}=?", Util::Base::decode(id.to_s))
  end
end
