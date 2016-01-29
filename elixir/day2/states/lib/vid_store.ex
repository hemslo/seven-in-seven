defmodule VidStore do
  use StateMachine

  state :available,
    rent: [ to: :rented,      calls: [ &VidStore.renting/1 ]]

  state :rented,
    return: [ to: :available, calls: [ &VidStore.returning/1 ]],
    lose:   [ to: :lost,      calls: [ &VidStore.losing/1 ]]

  state :lost,
    find: [ to: :found,       calls: [ &VidStore.finding/1]]

  state :found, []

  def renting(video) do
    rented_video = log video, "Renting #{video.title}"
    %{rented_video | times_rented: video.times_rented + 1}
  end

  def returning(video), do: log( video, "Returning #{video.title}" )

  def losing(video), do: log( video, "Losing #{video.title}" )

  def finding(video), do: log( video, "Finding #{video.title}" )

  def before_rent(video), do: log( video, "Before renting #{video.title}" )

  def after_rent(video), do: log( video, "After renting #{video.title}" )

  def log(video, message) do
    %{video | log: [message|video.log]}
  end
end
