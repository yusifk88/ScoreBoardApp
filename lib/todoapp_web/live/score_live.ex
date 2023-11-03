defmodule TodoappWeb.ScoreLive do

use TodoappWeb, :live_view

@impl Phoenix.LiveView
def mount(_params, _session, socket) do

  socket = assign(socket, score: 30)
  {:ok, socket}
end


@impl Phoenix.LiveView
def render(assigns) do
  ~H"""
  <h1 class="text-h1">Team score board</h1>
  <h1><%=assigns.score%></h1>
  <p>
  <button phx-click="decrease" style="color:red; margin:10px; border:1px solid red; padding:10px; border-radius:15px" class="button">- Decrease</button> <button style="color:green; margin:10px; border:1px solid green; padding:10px; border-radius:15px" phx-click="increase">Increase +</button>
  </p>

  <button phx-click="reset" style="color:red; margin:10px; border:1px solid red; padding:10px; border-radius:15px" class="button"> Reset</button> <button style="color:green; margin:10px; border:1px solid green; padding:10px; border-radius:15px" phx-click="max">Max</button>
  """
end

@impl true
def handle_event("max", _unsigned_params, socket) do

  socket = assign(socket, score: 100)

  {:noreply, socket}

end


def handle_event("reset", _unsigned_params, socket) do

  socket = assign(socket, score: 0)

  {:noreply, socket}

end


def handle_event("increase", _unsigned_params, socket) do
  current_score = socket.assigns.score + 1

  socket = assign(socket, score: current_score)

  {:noreply, socket}

end




def handle_event("decrease", _unsigned_params, socket) do




    current_score = socket.assigns.score - 1


    socket = assign(socket, score: current_score)

    {:noreply, socket}




end


end
