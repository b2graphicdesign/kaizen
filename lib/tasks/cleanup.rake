namespace :cleanup do
  desc "removes stale and inactive model instances from the database"

  task :patients => :environment do
    # Find all the products older than yesterday, that are not active yet
    stale_patients = Patient.where(username: nil)
    # delete them
    stale_patients.map(&:destroy)
  end

  task :providers => :environment do
    # Find all the products older than yesterday, that are not active yet
    stale_providers = Provider.where(username: nil)
    # delete them
    stale_providers.map(&:destroy)
  end

  task :drivers => :environment do
    # Find all the products older than yesterday, that are not active yet
    stale_drivers = Driver.where(username: nil)
    # delete them
    stale_drivers.map(&:destroy)
  end

  task :transportations => :environment do
    # Find all the products older than yesterday, that are not active yet
    stale_transportations = Transportation.where(username: nil)
    # delete them
    stale_transportations.map(&:destroy)
  end
end