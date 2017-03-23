defmodule Cineworld.Films.Scraper do
  @moduledoc """
  Scrape the Cineworld website for Film information
  """

  def load_page(film_url) do
    %{} |> Map.put(:html, HTTPoison.get!(film_url, []).body)
  end
  def load_page(cinema_id, edi) do
    film = Cineworld.Films.get(cinema_id, edi)
    %{} |> Map.put(:html, HTTPoison.get!(film[:film_url], []).body)
  end

  def get_title(%{:html => html} = context) do
    title =
      Floki.find(html, ".dark.noBg.summary h1")
      |> Floki.text
      |> String.trim

    context |> Map.put(:title, title)
  end

  def get_synopsis(%{:html => html} = context) do
    synopsis =
      Floki.find(html, ".dark.collapse.in .text-content")
      |> Floki.text

    context |> Map.put(:synopsis, synopsis)
  end

  def get_running_time(%{:html => html} = context) do
    running_time =
      Floki.find(html, ".dark.collapse.in .info-descr")
      |> List.last
      |> Floki.text

    context |> Map.put(:running_time, running_time |> String.replace(" minutes", ""))
  end

  def get_director(%{:html => html} = context) do
    director =
      Floki.find(html, ".tbl-cell-descr.director span")
      |> Floki.text

    context |> Map.put(:director, director)
  end


end
