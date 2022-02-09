defmodule ComsumeDeps.BlogTest do
  use ComsumeDeps.DataCase

  alias ComsumeDeps.Blog

  describe "post" do
    alias ComsumeDeps.Blog.Post

    import ComsumeDeps.BlogFixtures

    @invalid_attrs %{body: nil, replys: nil, username: nil}

    test "list_post/0 returns all post" do
      post = post_fixture()
      assert Blog.list_post() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{body: "some body", replys: 42, username: "some username"}

      assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
      assert post.body == "some body"
      assert post.replys == 42
      assert post.username == "some username"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{body: "some updated body", replys: 43, username: "some updated username"}

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.body == "some updated body"
      assert post.replys == 43
      assert post.username == "some updated username"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
