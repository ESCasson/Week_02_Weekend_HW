require('minitest/autorun')
require('minitest/reporters')
require_relative('../song.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SongTest < MiniTest::Test

  def test_song_exists_with_name
    song =Song.new("Run","Foo Fighters")
    assert_equal("Run", song.title)
  end

  def test_song_exists_with_artist
    song =Song.new("Run","Foo Fighters")
    assert_equal("Foo Fighters", song.artist)
  end


end
