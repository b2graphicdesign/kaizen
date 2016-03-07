module TransportationsHelper
  def all_transportations
    all_of_the_transportations = []
    Transportation.all.order("company_name ASC").each do |transportation|
      all_of_the_transportations << [transportation.company_name, transportation.id]
    end
    return all_of_the_transportations
  end
end
