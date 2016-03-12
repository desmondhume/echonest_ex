defmodule EchonestEx.ClientTest do
  use ExUnit.Case
  import EchonestEx.Client

  test "api_key and endpoint" do
    client = EchonestEx.Client.new("MY_SECRET_KEY")
    assert client == %EchonestEx.Client{api_key: "MY_SECRET_KEY", endpoint: "http://developer.echonest.com/api/v4/"}
  end
end
