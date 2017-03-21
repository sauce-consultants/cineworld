# Cineworld

A Cineworld API wrapper for Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cineworld` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cineworld, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cineworld` is started before your application:

    ```elixir
    def application do
      [applications: [:cineworld]]
    end
    ```

## Configuration

Obtain a Cineworld API Key and assign it to a System ENV key of `CINEWORLD_API_KEY`.

Alternatively, add the following to your `config.exs` file:

```
config :cineworld,
  api_key: System.get_env("CINEWORLD_API_KEY")
```

## Usage

### Retrieve Cinemas

Retrieve a complete list of Cineworld cinemas by calling `Cineworld.Cinemas.list`

### Retrieve Films

Retrieve all Films currently being shown at a Cinema by calling `Cineworld.Films.list(cinema_id)`

#### Scrape Cineworld website

To get the Synopsis of a film as it appears on the Cineworld website call `Scraper.load_page(cinema_id, edi) |> Scraper.get_synopsis`

### Retrieve Performances

Retrieve all Performances (showings) of a Film at at a Cinema by calling `Cineworld.Performances.list(cinema_id, edi, date)`
