namespace :cleanup do
  #run rake cleanup:kaizen to run sweeper
  desc "removes stale and inactive model instances from the database"

  task :kaizen => :environment do
    stale_patients = Patient.where(username: nil)
    stale_patients.map(&:destroy)

    stale_providers = Provider.where(username: nil)
    stale_providers.map(&:destroy)
 
    stale_drivers = Driver.where(username: nil)
    stale_drivers.map(&:destroy)
  
    stale_transportations = Transportation.where(username: nil)
    stale_transportations.map(&:destroy) 
  end
end