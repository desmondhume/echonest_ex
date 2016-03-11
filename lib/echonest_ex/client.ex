defmodule EchonestEx.Client do
  defstruct api_key: nil, endpoint: "http://developer.echonest.com/api/v4/"

  @type client :: %__MODULE__{api_key: binary, endpoint: binary}

  @spec new(binary) :: client

  @doc """
  Create a new Echonest Client
  All Echonest api endpoints need an `api_key` to work. You can generate
  one here:
  https://developer.echonest.com/account/register
  ## Example
      EchonestEx.Client.new("MYVERYSECRETKEY")

  More infos: http://developer.echonest.com/docs/v4/index.html
  """
  def new(api_key), do: %__MODULE__{api_key: api_key}
end