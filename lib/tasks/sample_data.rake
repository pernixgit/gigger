namespace :sample_data do
  desc "Creates sample data"
  task all: :environment do
    Rake::Task["sample_data:admin_user"].invoke unless Rails.env.production?

    Rake::Task["production_data:all"].invoke
    Rake::Task["sample_data:clients"].invoke
    Rake::Task["sample_data:bands"].invoke
    Rake::Task["sample_data:musicians"].invoke
    Rake::Task["sample_data:events"].invoke
  end

  desc "Creates admin user"
  task admin_user: :environment do
    AdminUser.create email: "admin@gigger.com", password: "password", password_confirmation: "password"
  end

  desc "Creates clients"
  task clients: :environment do
    5.times do |n|
      update_or_create_client(
        email: "client#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "client #{n}",
        last_name: "McClient",
        phone: "9999-9999",
        identification: "0-0000-0000"
      )
    end
  end

  desc "Creates bands"
  task bands: :environment do
    2.times do |n|
      update_or_create_band(
        email: "band#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Band #{n}",
        phone: "9999-9999"
      )
    end
  end

  desc "Creates musicians"
  task musicians: :environment do

    5.times do |n|
      update_or_create_musician(
        email: "musician0#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Musician 0#{n}",
        last_name: "McMusic",
        phone: "9999-9999",
        identification: "0-0000-0000",
        band_id: Band.first.id
      )
    end

    5.times do |n|
      update_or_create_musician(
        email: "musician1#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Musician 1#{n}",
        last_name: "McMusic",
        phone: "9999-9999",
        identification: "0-0000-0000",
        band_id: Band.second.id
      )
    end

    5.times do |n|
      update_or_create_musician(
        email: "musician2#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Musician 2#{n}",
        last_name: "McMusic",
        phone: "9999-9999",
        identification: "0-0000-0000"
      )
    end
  end

  desc "Creates events"
  task events: :environment do
    20.times do |n|
      update_or_create_event(
        name: "Event #{n}",
        date: Date.tomorrow,
        time: Time.now,
        email: "event#{n}@email.com",
        phone: "9999-9999",
        description: "description #{n}",
        client_id: 1 + rand(Client.all.count),
        event_type_id: 1 + rand(EventType.all.count)
      )
    end
  end

  def update_or_create_client(attributes)
    client = Client.find_or_initialize_by(email: attributes.delete(:email))
    client.update_attributes(attributes)
  end

  def update_or_create_band(attributes)
    band = Band.find_or_initialize_by(email: attributes.delete(:email))
    band.update_attributes(attributes)
  end

  def update_or_create_musician(attributes)
    musician = Musician.find_or_initialize_by(email: attributes.delete(:email))
    musician.update_attributes(attributes)
  end

  def update_or_create_event(attributes)
    event = Event.find_or_initialize_by(name: attributes.delete(:name))
    event.update_attributes(attributes)
  end
end