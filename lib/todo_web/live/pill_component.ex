defmodule TodoWeb.PillComponent do
  @moduledoc """
  ## Assigns

  Pills have defaults set so the only required assigns is `content`.
  The default Pill is non-removable & teal-colored.

  * `content` (string) - required
  * `type` (string) - optional
  * `removable` (boolean) - optional
  * `click_handler` (string) - optional

  Removable pills accept an optional assigns `click_handler`.
  The default handler for this is "remove-tag".
  These must be tied to a LiveView handler function, e.g. "phx-click"

  ## Available types

  The default type is a teal pill that is not removable (no `X`).
  Types are semantically named and include colors. No additional styling should be required.

  * `default` - teal
  * `active` - green
  * `confirm` - green
  * `disabled` - grey
  * `warning` - yellow
  * `error` - red

  ## Examples

      <%= live_component @socket, TodoWeb.PillComponent, content: "removed", type: "confirm" %>
  """
  #use Phoenix.LiveComponent
  use TodoWeb, :live_component

  @impl true
  def render(assigns) do
    type = Map.get(assigns, :type, "teal")
    removable = Map.get(assigns, :removable, false)
    click_handler = Map.get(assigns, :click_handler, "remove-tag")

    ~L"""
    <span class="pill-component-container <%= type %>">
      <div class="content">
        <%= if type != "neutral" do %>
          <span class="dot"></span>
        <% end %>
        <%= @content %>
        <%= if removable do %>
          <span class="ex" phx-value-tag="<%= @content %>" phx-click="<%= click_handler %>"></span>
        <% end %>
      </div>
    </span>
    """
  end
end
