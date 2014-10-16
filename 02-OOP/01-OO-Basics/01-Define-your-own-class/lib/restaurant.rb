class Restaurant
  attr_reader :name, :ville, :avis
  def initialize(hash = {})
    @id = genere_mon_id
    @name = hash[:name]
    @ville = hash[:ville]
    @adresse = hash[:adresse]
    @horaire = hash[:horaire]
    @prix = hash[:prix]
    @type_de_cuisine = hash[:type_de_cuisine]
    @ambiance = hash[:ambiance]
    @menu = hash[:menu]
    @reduction = hash[:reduction]
    @avis = []
    @dispo = true
  end

  def to_s
    "#{name}, #{ville}"
  end

  def avis
    return "Les utilisateurs ont donné leur avis: \n" + @avis.join("\n")
  end

  def ajouter_un_avis(message)
    @avis << message
  end

  private

  def genere_mon_id
    return 1
  end
end

premier_resto = Restaurant.new({ name: "le bistro", ville: "Paris" })
p premier_resto.to_s
premier_resto.ajouter_un_avis("Super resto")
premier_resto.ajouter_un_avis("Le resto est moyen !!")
puts premier_resto.avis