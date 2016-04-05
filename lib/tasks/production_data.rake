namespace :production_data do
  desc "Loads everything"
  task all: :environment do
    Rake::Task["production_data:genres"].invoke
    Rake::Task["production_data:event_types"].invoke
  end

  desc "Loads genre data"
  task genres: :environment do
    genres = [
      "Rock", "Metal", "Electronica", "Rap / Hip-Hop",
      "Reggae / Ska", "Bachata", "Salsa", "Merengue",
      "Reggaeton", "Cumbia", "Calypso", "Instrumental",
      "Coro", "Religioso", "Tipica costarricense", "Otro",
      "Mariachi"
    ]

    genres.each do |g|
      update_or_create_genre(name: g)
    end
  end

  desc "Loads event type data"
  task event_types: :environment do
    event_types = [
      "Cumpleaños para niños",
      "15 años",
      "50 años",
      "Bautizos",
      "Primera Comunion",
      "Boda",
      "Fiesta familiar",
      "Concierto",
      "Festival",
      "Graduacion",
      "Serenata",
    ]

    event_types.each do |e|
      update_or_create_event_type(name: e)
    end
  end

  # Helpers

  def update_or_create_event_type(attributes)
    event_type = EventType.find_or_initialize_by(name: attributes.delete(:name))
    event_type.update_attributes(attributes)
  end

  def update_or_create_genre(attributes)
    genre = Genre.find_or_initialize_by(name: attributes.delete(:name))
    genre.update_attributes(attributes)
  end
end
