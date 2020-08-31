require 'httparty'
class PersonInfo
  include HTTParty
  BASE_URL = 'https://npiregistry.cms.hhs.gov/api/'

  def call(args)
    request = BASE_URL + "?" + args.to_query
    response = self.class.send(:get, request)
    save_info(request, response)
  end

  private

  def save_info(request, response)
    people = []

    response["results"].each do |result|
      person = Person.new
      person.npi_number = result["number"]
      person.request = request
      person.response = result
      update_timestamp(person.npi_number) unless person.save
      people.push(person)
    end

    people
  end

  def update_timestamp(npi_number)
    person = Person.find_by(npi_number: npi_number)
    person.update_attribute(:search_count, person.search_count + 1)
  end
end
