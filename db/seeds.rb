# WHEREAS
#   the first viz will be plotting the career scoring totals of the top ten
#   career scorers, with (x, y) axes of (games played, points scored); and
# WHEREAS
#   it seems awfully rude to grab a shitload of players all at once from
#   someone else's API;
# BE IT RESOLVED
#   to just grab those ten dudes' games in this here seeds file.

top_ten_scorers = {
  "Kareem Abdul-Jabbar" => "76003",
  "Karl Malone"         => "252",
  "Kobe Bryant"         => "977",
  "Michael Jordan"      => "893",
  "Wilt Chamberlain"    => "76375",
  "Shaquille O'Neal"    => "406",
  "Dirk Nowitzki"       => "1717",
  "Moses Malone"        => "77449",
  "Elvin Hayes"         => "76979",
  "Hakeem Olajuwon"     => "165"
}

top_ten_scorers.each do |name, nba_stats_id|
  Player.create!(name: name, nba_stats_id: nba_stats_id).fetch_unstored_games
end
