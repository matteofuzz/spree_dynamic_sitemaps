namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(DynamicSitemaps.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{DynamicSitemaps.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
end
