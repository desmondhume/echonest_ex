defmodule EchonestEx.Artists do
  import EchonestEx

  def search(name, client) do
    get "artist/search", client, %{"name": name}
  end
end