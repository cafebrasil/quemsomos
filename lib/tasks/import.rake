require 'csv'

class CityImporter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def city
    @city ||= City.create_with(state_id: state.id).find_or_create_by(name: data['Cidade']) if state
  end

  def state
    @state ||= State.create_with(country_id: country.id).find_or_create_by(name: data['Estado']) if country
  end

  def country
    @country ||= Country.find_by(iso2_code: data['Pais'])
  end
end

namespace :cafebrasil do
  desc "Import initial data"
  task import: [:environment, 'db:seed'] do
    CSV.foreach(Rails.root.join('db', 'initial_data.csv'), col_sep: ',', quote_char: "'", headers: true) do |row|
      city = CityImporter.new(row).city
      profile = Profile.new(
        name: row['Nome'],
        date_of_birth: Time.now - (row['Idate'].to_i).years,
        gender: (row['Sexo'] == 'Masc' ? 'male' : 'female'),
        marital_status: (row['Estado Civil'] == 'Casado(a)' ? 'married' : 'single'),
        children: row['Filhos'].to_i,
        city: city,
        profession: row['Profissao'],
        occupation: row['Ocupação'],
        occupation_area: row['Area'],
        hobbies: row['Hobby'],
        goals: row['Objetivos / Propósito'],
        about: row['Sobre']
      )

      profile.save(validate: false)
    end
  end
end
