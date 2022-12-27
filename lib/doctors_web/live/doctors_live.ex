defmodule DoctorsWeb.DoctorsLive do
  use Phoenix.LiveView, layout: {DoctorsWeb.Layouts, :doctors}


  def mount(_session, _params, socket) do
    {:ok, socket }
  end



end
