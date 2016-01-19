task ping_site: :environment do
  `curl http://recordly.herokuapp.com/`
end