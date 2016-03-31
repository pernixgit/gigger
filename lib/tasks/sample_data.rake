namespace :sample_data do
  desc "Creates sample data"
  task all: :environment do
    Rake::Task["sample_data:admin_user"].invoke unless Rails.env.production?
    Rake::Task["sample_data:clients"].invoke
    Rake::Task["sample_data:musicians"].invoke
    Rake::Task["sample_data:bands"].invoke
    Rake::Task["sample_data:events"].invoke
  end

  desc "Creates admin user"
  task admin_user: :environment do
    AdminUser.create email: "admin@livewatch.com", password: "password", password_confirmation: "password"
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
      new_band = update_or_create_band(
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
    Band.all.each do |band|
      3.times do
        band.musicians.create(
          email: "musician#{band.id}@email.com",
          password: "password",
          password_confirmation: "password",
          name: "Musician #{band.id}",
          last_name: "McMusic",
          phone: "9999-9999",
          identification: "0-0000-0000"
        )
      end
    end

    5.times do |n|
      update_or_create_musician(
        email: "musician#{n + Band.all.count}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Musician #{n + Band.all.count}",
        last_name: "McMusic",
        phone: "9999-9999",
        identification: "0-0000-0000"
      )
    end
  end

  desc "Createss events"
  task events: :environment do
    10.times do |n|
      update_or_create_event(
        name: "Event #{n}",
        date: Date.tomorrow,
        description: "description #{n}"
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