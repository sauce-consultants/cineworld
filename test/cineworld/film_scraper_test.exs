defmodule CineworldFilmScraperTest do
  use ExUnit.Case

  alias Cineworld.Films.Scraper

  # This is nasty, but there's no sandbox environment so we'll just have to
  # update these values periodically.
  @cinema_id 35
  @film_id 178339

  # Anyway... on with the tests...

  test "can retrieve title" do
    %{title: title} =
      Scraper.load_page(@cinema_id, @film_id)
      |> Scraper.get_title

    assert title == "Ghost In The Shell"
  end

  test "can retrieve synopsis" do
    %{synopsis: synopsis} =
      Scraper.load_page(@cinema_id, @film_id)
      |> Scraper.get_synopsis

    assert synopsis == "Based on the internationally-acclaimed sci-fi property, “GHOST IN THE SHELL” follows Major, a special ops, one-of-a-kind human-cyborg hybrid, who leads the elite task force Section 9. Devoted to stopping the most dangerous criminals and extremists, Section 9 is faced with an enemy whose singular goal is to wipe out Hanka Robotic’s advancements in cyber technology."
  end


end
