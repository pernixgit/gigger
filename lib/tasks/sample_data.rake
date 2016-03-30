namespace :sample_data do
  desc "Creates sample data"
  task all: :environment do
    Rake::Task["sample_data:admin_user"].invoke unless Rails.env.production?
    Rake::Task["sample_data:clients"].invoke
    Rake::Task["sample_data:musicians"].invoke
    Rake::Task["sample_data:bands"].invoke
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
        identification: "0-0000-0000",
        type: "Client"
      )
    end
  end

  desc "Creates musicians"
  task musicians: :environment do
    15.times do |n|
      update_or_create_musician(
        email: "musician#{n}@email.com",
        password: "password",
        password_confirmation: "password",
        name: "Musician #{n}",
        last_name: "McMusic",
        phone: "9999-9999",
        identification: "0-0000-0000",
        type: "Musician"
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
        last_name: "McAlbum",
        phone: "9999-9999",
        identification: "0-0000-0000",
        type: "Band"
      )
    end

    band_1 = Band.first
    band_2 = Band.last

    Musician.first(5) do |member|
      band_1.musicians.add(member)
    end

    Musician.last(5) do |member|
      band_2.musicians.add(member)
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
    event = Event.find_or_initialize_by(email: attributes.delete(:email))
    event.update_attributes(attributes)
  end
end