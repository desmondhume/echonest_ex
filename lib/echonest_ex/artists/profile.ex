defmodule EchonestEx.Artists.Profile do
  import EchonestEx
  alias EchonestEx.Client

  @collection_key "artist"
  @endpoint       "artist/profile"

  @derive [Poison.Encoder]
  defstruct id: "",
    name: "",
    biographies: [],
    blogs: "",
    discovery: "",
    discovery_rank: "",
    doc_counts: "",
    familiarity: "",
    familiarity_rank: "",
    genre: "",
    hotttnesss: 0,
    hotttnesss_rank: "",
    images: "",
    artist_location: "",
    news: [],
    reviews: "",
    songs: "",
    terms: "",
    urls: "",
    video: "",
    years_active: ""

  def find(id, bucket \\ [], client) do
    bucket_params = Enum.map(bucket, fn (b) -> {:bucket, b} end)

    get(@endpoint, client, [{"id", id} | bucket_params])
    |> unwrap
    |> Enum.map(&parse_property(&1))
    |> Enum.into(%{})
    |> build_resource
  end

  defp unwrap(%EchonestEx.Client.Response{response: response}) do
    Map.get(response, @collection_key, [])
  end

  defp parse_property({"biographies", biographies}) do
    {"biographies", Enum.map(biographies, &EchonestEx.Artists.Biography.build_resource(&1))}
  end
  defp parse_property({"news", news}) do
    {"news", Enum.map(news, &EchonestEx.Artists.News.build_resource(&1))}
  end
  defp parse_property({"terms", terms}) do
    {"terms", Enum.map(terms, &EchonestEx.Artists.Term.build_resource(&1))}
  end
  defp parse_property({key, value}), do: {key, value}

  defp build_resource(data) do
    map_data = for {key, val} <- data, into: %{}, do: {String.to_atom(key), val}
    struct(__MODULE__, map_data)
  end
end