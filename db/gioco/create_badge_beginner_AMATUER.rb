kind = Kind.find_or_create_by(name: 'AMATUER')
badge = Badge.create({ 
                      :name => 'beginner', 
                      :points => '10',
                      :kind_id  => kind.id,
                      :default => 'false'
                    })
puts '> Badge successfully created'