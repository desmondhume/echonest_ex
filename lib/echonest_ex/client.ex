defmodule EchonestEx.Client do
  defstruct api_key: nil, endpoint: "https://developer.echonest.com/api/v4/"

  @type client :: %__MODULE__{api_key: string, endpoint: binary}

  @spec new(string) :: client
  def new(api_key), do: %__MODULE__{api_key: api_key}
end