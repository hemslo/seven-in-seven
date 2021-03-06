defmodule VidStoreTest do
  use ExUnit.Case
  import Should

  should "update count" do
    rented_video = VidStore.renting(video)
    assert rented_video.times_rented == 1
  end

  should "rent video" do
    rented_video = VidStore.rent video
    assert :rented == rented_video.state
    assert 3 == Enum.count( rented_video.log )
  end

  should "handle multiple transitions" do
    import VidStore
    vid = video |> rent |> return |> rent |> return |> rent
    assert 11 == Enum.count( vid.log )
    assert 3 == vid.times_rented
  end

  should "find video" do
    import VidStore
    vid = video |> rent |> lose |> find
    assert :found == vid.state
  end

  def video, do: %Video{title: "XMen"}
end
