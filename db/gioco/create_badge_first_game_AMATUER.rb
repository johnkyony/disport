kind = Kind.find_or_create_by(name: 'AMATUER')
badge = Badge.create({ 
                      :name => 'first_game', 
                      :points => '20',
                      :kind_id  => kind.id,
                      :default => 'false'
                    })
puts '> Badge successfully created'