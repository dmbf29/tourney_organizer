puts "Making players"
# 12.times do
#   Player.create(name: Faker::Name.unique.name)
# end

Player.create(
  name: "Dan"
)
Player.create(
  name: "Rory"
)
Player.create(
  name: "Daragh"
)
Player.create(
  name: "Shaun"
)
Player.create(
  name: "Doug"
)
Player.create(
  name: "Scott"
)
Player.create(
  name: "Mark"
)
Player.create(
  name: "Craig"
)
Player.create(
  name: "Alan"
)
Player.create(
  name: "Andre"
)
Player.create(
  name: "Lee"
)
Player.create(
  name: "Chris"
)

puts "Players made"

puts "Making screens"
Screen.create(
  name: "Inside"
)

Screen.create(
  name: "Outside"
)
puts "Screns made"

puts "Making teams"
Team.where(
name: "Real Madrid",
badge: "real_madrid.png",
rating: 5
).first_or_create

Team.where(
name: "Bayern",
badge: "bayern.png",
rating: 5
).first_or_create

Team.where(
name: "Juventus",
badge: "juventus.png",
rating: 5
).first_or_create

Team.where(
name: "FC Barcelona",
badge: "fc_barcelona.png",
rating: 5
).first_or_create

Team.where(
name: "PSG",
badge: "psg.png",
rating: 5
).first_or_create

Team.where(
name: "Chelsea",
badge: "chelsea.png",
rating: 5
).first_or_create

Team.where(
name: "Atletico Madrid",
badge: "atletico_madrid.png",
rating: 5
).first_or_create

Team.where(
name: "Manchester Utd",
badge: "manchester_utd.png",
rating: 5
).first_or_create

Team.where(
name: "Manchester City",
badge: "manchester_city.png",
rating: 5
).first_or_create

Team.where(
name: "Arsenal",
badge: "arsenal.png",
rating: 5
).first_or_create

Team.where(
name: "Spurs",
badge: "spurs.png",
rating: 4.5
).first_or_create

Team.where(
name: "Borussia Dortmund",
badge: "borussia_dortmund.png",
rating: 4.5
).first_or_create

Team.where(
name: "Liverpool",
badge: "liverpool.png",
rating: 4.5
).first_or_create

Team.where(
name: "Napoli",
badge: "napoli.png",
rating: 4.5
).first_or_create

Team.where(
name: "Roma",
badge: "roma.png",
rating: 4.5
).first_or_create

Team.where(
name: "Sevilla FC",
badge: "sevilla.png",
rating: 4.5
).first_or_create

Team.where(
name: "Inter",
badge: "inter.png",
rating: 4.5
).first_or_create

Team.where(
name: "AS Monaco",
badge: "as_monaco.png",
rating: 4.5
).first_or_create

Team.where(
name: "Everton",
badge: "everton.png",
rating: 4.5
).first_or_create

Team.where(
name: "AC Milan",
badge: "ac_milan.png",
rating: 4.5
).first_or_create

Team.where(
name: "Villareal",
badge: "villareal.png",
rating: 4.5
).first_or_create

Team.where(
name: "Real Sociedad",
badge: "real_sociedad.png",
rating: 4.5
).first_or_create

Team.where(
name: "Lazio",
badge: "lazio.png",
rating: 4.5
).first_or_create

Team.where(
name: "Benfica",
badge: "benfica.png",
rating: 4.5
).first_or_create

Team.where(
name: "Atletico Bilbao",
badge: "atletico_bilbao.png",
rating: 4.5
).first_or_create

Team.where(
name: "Besiktas",
badge: "besiktas.png",
rating: 4.5
).first_or_create

Team.where(
name: "West Ham",
badge: "west_ham.png",
rating: 4.5
).first_or_create

Team.where(
name: "Sporting CP",
badge: "sporting.png",
rating: 4.5
).first_or_create

Team.where(
name: "Porto",
badge: "porto.png",
rating: 4.5
).first_or_create

Team.where(
name: "Marseille",
badge: "marseille.png",
rating: 4
).first_or_create

Team.where(
name: "Wolfsburg",
badge: "wolfsburg.png",
rating: 4
).first_or_create

Team.where(
name: "Bayer Leverkusen",
badge: "bayer_leverkusen.png",
rating: 4
).first_or_create

Team.where(
name: "Valencia",
badge: "valencia.png",
rating: 4
).first_or_create

Team.where(
name: "Zenit",
badge: "zenit.png",
rating: 4
).first_or_create

Team.where(
name: "Fenerbahce",
badge: "fenerbahce.png",
rating: 4
).first_or_create

Team.where(
name: "Nice",
badge: "nice.png",
rating: 4
).first_or_create

Team.where(
name: "Espanyol",
badge: "espanyol.png",
rating: 4
).first_or_create

Team.where(
name: "Leicester City",
badge: "leicester_city.png",
rating: 4
).first_or_create

Team.where(
name: "Borussia M'gladbach",
badge: "borussia_mgladbach.png",
rating: 4.5
).first_or_create

Team.where(
name: "Schalke 04",
badge: "schalke04.png",
rating: 4
).first_or_create

Team.where(
name: "Southampton",
badge: "southampton.png",
rating: 4
).first_or_create

Team.where(
name: "Celta Vigo",
badge: "southampton.png",
rating: 4
).first_or_create

Team.where(
name: "RB Leipzig",
badge: "rb_leipzig.png",
rating: 4
).first_or_create

Team.where(
name: "Galatasaray",
badge: "galatasaray.png",
rating: 4
).first_or_create

Team.where(
name: "Real Betis",
badge: "real_betis.png",
rating: 4
).first_or_create

Team.where(
name: "Shaktar Donestsk",
badge: "shaktar_donestk.png",
rating: 4
).first_or_create

Team.where(
name: "Torino",
badge: "torino.png",
rating: 4
).first_or_create

Team.where(
name: "Fiorentina",
badge: "fiorentina.png",
rating: 4
).first_or_create

Team.where(
name: "Lyon",
badge: "lyon.png",
rating: 4
).first_or_create

Team.where(
name: "Hoffenheim",
badge: "hoffenheim.png",
rating: 4
).first_or_create

Team.where(
name: "Ajax",
badge: "ajax.png",
rating: 4
).first_or_create

Team.where(
name: "Feyenoord",
badge: "feyenoord.png",
rating: 4
).first_or_create

Team.where(
name: "Newcastle",
badge: "newcastle.png",
rating: 4
).first_or_create

Team.where(
name: "Malaga",
badge: "malaga.png",
rating: 4
).first_or_create

Team.where(
name: "Las Palmas",
badge: "las_palmas.png",
rating: 4
).first_or_create

Team.where(
name: "Sampdoria",
badge: "sampdoria.png",
rating: 4
).first_or_create

Team.where(
name: "Olympiakos",
badge: "olympiakos.png",
rating: 4
).first_or_create

Team.where(
name: "Atalanta",
badge: "atalanta.png",
rating: 4
).first_or_create

Team.where(
name: "Werder Bremen",
badge: "werder_bremen.png",
rating: 4
).first_or_create

Team.where(
name: "Braga",
badge: "braga.png",
rating: 4
).first_or_create

Team.where(
name: "PSV",
badge: "psv.png",
rating: 4
).first_or_create

Team.where(
name: "Celtic",
badge: "celtic.png",
rating: 3.5
).first_or_create

Team.where(
name: "Boca Juniors",
badge: "boca_juniors.png",
rating: 3.5
).first_or_create
puts "Teams made"
