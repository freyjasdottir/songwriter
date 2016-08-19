## Songwriter

Songwriter is my 'breakable toy' project for Launch Academy. 'It's a Pinterest for sound' content collection app intended for songwriters to keep clips of their inspirations during the writing process.

## Production Site

Songwriter on [Heroku](http://secret-ridge-50831.herokuapp.com)

## Features

* Creating Songs: Songs are container objects that have a title and lyrics, which are simple free text fields.

* Uploading Images: Images can be attached to a song via CarrierWave

* SoundCloud API Integration: Users can embed a player for individual tracks on SoundCloud by inputting a valid SoundCloud URL.

* Media Grid: All clips are stored in a Foundation flex-grid on an individual song's page.

* Privacy: Users can only see their own songs.

## Modules

Songwriter was built with the following technologies:

* [Ruby](https://www.ruby-lang.org/en/)
* [RubyOnRails](http://rubyonrails.org/)
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
* Authentication using [Devise](https://github.com/plataformatec/devise)
* Database using [Postgres sql](https://www.postgresql.org)
* Uploading images [CarrierWave](https://github.com/carrierwaveuploader/carrierwave.git)
* Embedding an audio player [SoundCloud](https://developers.soundcloud.com/docs/api/guide)
* Media Grid [Foundation](http://foundation.zurb.com/sites/docs/flex-grid.html)
