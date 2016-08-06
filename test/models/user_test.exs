defmodule Rumbl.UserTest do
  use Rumbl.ModelCase, async: true

  alias Rumbl.User

  @valid_atrrs %{name: "A User", username: "eve", password: "secret"}
  @invalid_attrs %{}

  test "changeset woith valid attributes" do
    changeset = User.changeset(%User{}, @valid_atrrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not accept long usernames" do
    attrs = Map.put(@valid_atrrs, :username, String.duplicate("a", 30))
    assert {:username, "should be at most 20 character(s)"} in
           errors_on(%User{}, attrs)
  end
end
