defmodule EchonestEx.Artists.Biography do
  import EchonestEx

  @collection_key "biographies"
  @endpoint       "artist/biographies"

  @derive [Poison.Encoder]
  defstruct text: "", url: "", site: ""

  def search(id, client) do
    get(@endpoint, client, %{"id": id})
    |> unwrap
    |> Enum.map(&build_resource(&1))
  end

  defp unwrap(%EchonestEx.Client.Response{response: response}) do
    Map.get(response, @collection_key, [])
  end

  defp build_resource(%{"text" => text, "url" => url, "site" => site}) do
    %__MODULE__{text: text, url: url, site: site}
  end
end