class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name = "", type = "", id = "", hp = nil, db = "")
    @name = name
    @type = type
    @db = db
    @hp = hp
    @id = id
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten

    pokemon_id = found_pokemon[0]
    pokemon_name = found_pokemon[1]
    pokemon_type = found_pokemon[2]
    pokemon_hp = found_pokemon[3]

    new_pokemon = Pokemon.new(pokemon_name, pokemon_type, pokemon_id, pokemon_hp, db)
  end

  def fight(new_hitpoint_value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hitpoint_value, self.id)
  end

end
