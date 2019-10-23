class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recc = []
    patron.interests.map do |interest|
      recc << @exhibits.find(interest)
    end
    recc
  end

  def admit(patron)
    @patrons << patron
  end


end
