defmodule EchonestEx.Client.Response do
  @derive [Poison.Encoder]
  defstruct response: %{
    status: %{
      version: "",
      code: 0,
      message: ""
    }
  }
end