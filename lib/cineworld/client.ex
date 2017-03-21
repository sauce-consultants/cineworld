defmodule Cineworld.Client do
  @moduledoc """
  An HTTP client for Cineworld.
  """

  # Build the client on top of HTTPoison
  use Application
  use HTTPoison.Base

  def start(_type, _args) do
    Cineworld.Supervisor.start_link
  end

  @doc """
  Creates the URL for our endpoint.
  """
  def process_url(endpoint) do
    "https://www.cineworld.co.uk/api/quickbook/" <> endpoint
  end

  @doc """
  Decodes the response to JSON and converts the binary keys in our response to atoms.
  """
  def process_response_body(body) do
    JSX.decode!(body, [{:labels, :atom}])
  end

  @doc """
  Boilerplate code to make requests.
  """
  def request(endpoint, body \\ %{})

  def request(endpoint, %{key: _} = params) do
    Cineworld.Client.get!(
      endpoint,
      headers(),
      params: params
    ).body
  end

  def request(endpoint, body) do
    request(endpoint, Map.put(body, :key, api_key()))
  end

  @doc """
  Default json headers
  """
  def headers do
    %{
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  end

  @doc """
  Gets the api key from :cineworld, :api_key application env or
  CINEWORLD_API_KEY from system ENV
  """
  def api_key do
   Application.get_env(:cineworld, :api_key) ||
     System.get_env("CINEWORLD_API_KEY")
  end

end
