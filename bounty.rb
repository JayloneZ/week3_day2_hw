require 'pg'

class Bounty
attr_reader :id
attr_accessor :name, :species, :bounty_value, :danger_level, :bounties_hash
def initialize(options)
@id = options['id'].to_i if options['id']
@name = options['name']
@species = options['species']
@bounty_value = options['bounty_value'].to_i
@danger_level = options['danger_level'].to_i
end

def self.show_all
  db = PG.connect({
    dbname: 'bounty_hunters',
    host: 'localhost'
    })
    sql = "
    SELECT * FROM bounty"
    values = []
    db.prepare("all", sql)
    result = db.exec_prepared("all", values)
    db.close()
    @bounties_hash = result.map {|bounty| Bounty.new(bounty)}
    return @bounties_hash

end

def save()
  db = PG.connect({
    dbname: 'bounty_hunters',
    host: 'localhost'
    })
    sql = "
    INSERT INTO bounty
    (
      name,
      species,
      bounty_value,
      danger_level
    )
    VALUES
    (
      $1,
      $2,
      $3,
      $4
    )
    "
    values = [@name, @species, @bounty_value, @danger_level]
    db.prepare("save", sql)
    db.exec_prepared("save", values)
    db.close()
end

def self.delete(id)
  db = PG.connect({
    dbname: 'bounty_hunters',
    host: 'localhost'
    })
    sql = "
    DELETE FROM bounty WHERE id = $1
    "
    values = [id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def update()
    db = PG.connect({
      dbname: 'bounty_hunters',
      host: 'localhost'
      })
      sql = "
      UPDATE bounty SET (
        name,
        species,
        bounty_value,
        danger_level
      ) =
      (
        $1,
        $2,
        $3,
        $4
      ) "

      values = [@name, @species, @bounty_value, @danger_level]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
  end

  def self.find(id)
    for bounty in @bounties_hash
     if bounty.id == id
        return bounty
      end
    end
  end
end
