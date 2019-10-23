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

  def patrons_array(cat)
    cat_pat = []
    @patrons.each do |patron|
      if patron.interests.include?(cat)
        cat_pat << patron
      end
    end
    cat_pat
  end

  def patrons_by_exhibit
    ex = Hash.new([])

    @exhibits.each do |exhibit|
      ex[:exhibit] = patrons_array(exhibit.name)
    end
  end
end
