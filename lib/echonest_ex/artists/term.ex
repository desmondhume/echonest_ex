defmodule EchonestEx.Artists.Term do
  import EchonestEx

  @collection_key "terms"
  @endpoint       "artist/terms"

  @derive [Poison.Encoder]
  defstruct name: "", frequency: 0.0, weight: 0.0

  def search(artist_id, client) do
    get(@endpoint, client, %{"id": artist_id})
    |> unwrap
    |> Enum.map(&build_resource(&1))
  end

  defp unwrap(%EchonestEx.Client.Response{response: response}) do
    Map.get(response, @collection_key, [])
  end

  def build_resource(%{"name" => name, "frequency" => frequency, "weight" => weight}) do
    %__MODULE__{name: name, frequency: frequency, weight: weight}
  end
end