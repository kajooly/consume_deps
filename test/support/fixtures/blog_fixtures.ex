defmodule ComsumeDeps.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ComsumeDeps.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        replys: 42,
        username: "some username"
      })
      |> ComsumeDeps.Blog.create_post()

    post
  end
end
