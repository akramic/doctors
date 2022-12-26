defmodule DoctorsWeb.SearchLive do
  use Phoenix.LiveView
 

  @postcode_pattern "(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})"
  @name_pattern "[^\[\]!#$%&()*+,-/:;<=>?^_`{|}~]"


  def mount(_params, _session, socket) do
    {:ok, assign(
      socket,
      autofocus: true,
      placeholder: "Enter your postcode",
      pattern: @postcode_pattern,
      postcode_checked: true,
      name_checked: false
      )}
  end


  def handle_event("search", %{"search" => "name", "search_term" => search_name }, socket) do
    IO.inspect(search_name, label: "Search Name")
    {:noreply, socket}
  end

  def handle_event("search", %{"search" => "postcode", "search_term" => search_name }, socket) do
    IO.inspect(search_name, label: "Search postcode")
    {:noreply, socket}
  end



  def handle_event("option_changed", %{"search" => "name"}, socket) do
    {:noreply, assign(
      socket,
      pattern: @name_pattern,
      placeholder: "Enter doctor's last name",
      name_checked: true,
      postcode_checked: false
      )}
  end

  def handle_event("option_changed", %{"search" => "postcode"}, socket) do
    {:noreply, assign(
      socket,
      pattern: @postcode_pattern,
      placeholder: "Enter your postcode",
      name_checked: false,
      postcode_checked: true
      )}
  end








end


# !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
