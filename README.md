# README for recordly Rails app

NOTE: Because crud operations aren't implemented yet, use the `generate_clean_random_sample_data` rake task to see some sample data to mess around with.

Basic album search functionality (case insensitive, and will match prefixes, so "hel" would match an album called "Hello") and album pages implemented with tests and responsive design. Responsiveness is implemented using style attributes from CSS flexbox, with browser compatibility for the styles covered (mostly) by the autoprefixer-rails gem.

To finish, I would add the basic CRUD pages for albums, make the search form use AJAX and an album list partial. I think the best way to make that work would be to make it update as the user types ('keyup' event), and use the `pg_search` gem to allow full-text searching (e.g. it would match by album name or artist name).

For favoriting, clickable star icons (from Font Awesome icons gem) would ping an endpoint that would set a "favorited" variable on the song, album, or artist. This would also work with ajax, so the page wouldn't need to reload just to favorite something.

User login works but serves no purpose at the moment. I'm unclear on whether or not the spec called for a master list of albums/artists/songs that a user could add to their collection, or if each user has their own individual collection of albums/artists/songs all of which they add to the app themselves. If the former, there would need to be a join model for ownership. If the latter, each song/artist/album would just need to have a user_id column with the id of their owner.