namespace :geocode_my_data do
  desc "Geocode all objects without coordinates."
  task :all => :environment do
    class_name = ENV['CLASS'] || ENV['class']
    sleep_timer = ENV['SLEEP'] || ENV['sleep']
    raise "Please specify a CLASS (model)" unless class_name
    klass = class_from_string(class_name)

klass.not_geocoded.find_each(batch_size: 1500) do |obj|
      obj.geocode; obj.save
      sleep(sleep_timer.to_f) unless sleep_timer.nil?
    end
  end
end
