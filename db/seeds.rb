require 'faraday_middleware'

country_io_connection = Faraday.new 'http://country.io' do |conn|
  conn.response :json, :content_type => /\bjson$/
  conn.use :instrumentation
  conn.adapter Faraday.default_adapter
end

c_iso3 = country_io_connection.get('iso3.json').body
c_names = country_io_connection.get('names.json').body
c_currency = country_io_connection.get('currency.json').body

c_names.map do |(code, name)|
  { iso2_code: code, iso3_code: c_iso3[code], name: name, currency: c_currency[code] }
end.map do |country_data|
  Country.new country_data
end.select(&:valid?).each(&:save)

