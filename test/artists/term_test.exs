defmodule EchonestEx.Artists.TermTest do
  import EchonestEx.Artists.Term
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  @client EchonestEx.Client.new("MY_SECRET_KEY")

  test "search/2" do
    use_cassette "artists/term#search" do
      assert search("ARH6W4X1187B99274F", @client) == [
        %EchonestEx.Artists.Term{frequency: 1.0, name: "rock", weight: 1.0},
        %EchonestEx.Artists.Term{frequency: 0.46207999113990994, name: "electronic", weight: 0.8550242674815747}
      ]
    end
  end
end
