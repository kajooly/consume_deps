defmodule ComsumeDepsWeb.PostLive.Index do
  use ComsumeDepsWeb, :live_view

  alias ComsumeDeps.Blog
  alias ComsumeDeps.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :post_collection, list_post())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Post")
    |> assign(:post, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :post_collection, list_post())}
  end

  defp list_post do
    Blog.list_post()
  end
end
