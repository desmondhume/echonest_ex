defmodule EchonestEx do
  use HTTPoison.Base
  alias EchonestEx.Client

  def get(path, client, params \\ %{}) do
    url_for(path, client)
    |> add_mandatory_params_to_url(client)
    |> add_params_to_url(params)
    |> get!
    |> parse_response
  end

  defp url_for(path, %Client{endpoint: endpoint}) do
    endpoint <> path
  end

  defp add_params_to_url(url, params \\ %{}) do
    <<url :: binary, "&", URI.encode_query(params) :: binary>>
  end

  defp add_mandatory_params_to_url(url, %Client{api_key: api_key}) do
    <<url :: binary, start_query_string(%{"api_key": api_key, "format": "json"}) :: binary>>
  end

  defp start_query_string(params) do
    to_string('?' ++ URI.encode_query(params))
  end

  def parse_response(response) do
    response.body
    |> Poison.decode!(as: EchonestEx.Client.Response)
  end
end
