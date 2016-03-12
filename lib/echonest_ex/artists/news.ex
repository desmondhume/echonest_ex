defmodule EchonestEx.Artists.News do
  import EchonestEx

  @collection_key "news"

  @derive [Poison.Encoder]
  defstruct url: "", id: "", date_found: "", name: "", summary: ""

  def build_resource(%{"url" => url, "id" => id, "date_found" => date_found, "name" => name, "summary" => summary}) do
    %__MODULE__{url: url, id: id, date_found: date_found, name: name, summary: summary}
  end
end