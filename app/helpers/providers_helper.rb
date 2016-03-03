module ProvidersHelper
  def all_providers
    all_of_the_providers = []
    Provider.all.order(facility_name: :ASC).each do |provider|
      all_of_the_providers << [provider.facility_name, provider.id]
    end
    return all_of_the_providers
  end
end
