defmodule MyBlockAdminWeb.E2E.SanityTest do
  use MyBlockAdminWeb.ConnCase
  use Hound.Helpers

  @moduletag :e2e_test

  hound_session()

  test "should be able to run multiple sessions" do
    root_page_url = "http://localhost:3001"
    google_page_url = "https://www.google.com.hk"

    # Navigate to a root_page_url
    navigate_to(root_page_url)

    # Change to another session
    change_session_to(:another_session)
    # Navigate to a url in the second session
    navigate_to(google_page_url)
    # Then assert url
    another_session_url = current_url()
    assert String.starts_with?(another_session_url, google_page_url)

    # Now go back to the default session
    change_to_default_session()
    # Assert if the url is the one we visited
    default_session_url = current_url()
    assert String.starts_with?(default_session_url, root_page_url)
  end

  test "should be able to run multiple sessions using in_browser_session" do
    root_page_url = "http://localhost:3001"
    google_page_url = "https://www.google.com.hk"

    # Navigate to a url
    navigate_to(root_page_url)

    # In another session...
    in_browser_session(:another_session, fn ->
      navigate_to(google_page_url)
      another_session_url = current_url()
      assert String.starts_with?(another_session_url, google_page_url)
    end)

    # Assert if the url is the one we visited
    default_session_url = current_url()
    assert String.starts_with?(default_session_url, root_page_url)
  end
end
