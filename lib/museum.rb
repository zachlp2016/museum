class Museum

  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @exhibit_interest = {}
    @patrons_interest = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests
  end

  def admit(patron)
    @patrons << patron
  end

  def calculate_interests
    @exhibit_interests = Hash.new {|hash, key| hash[key] = []}
    @patrons_interest.each do |exhibit|
    @exhibit_interests[exhibit.count] << exhibit
    end
  end

  def patrons_by_exhibit_interest
    @exhibit_interest
  end

end
