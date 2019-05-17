require "application_system_test_case"

class StatsTest < ApplicationSystemTestCase
  setup do
    @stat = stats(:one)
  end

  test "visiting the index" do
    visit stats_url
    assert_selector "h1", text: "Stats"
  end

  test "creating a Stat" do
    visit stats_url
    click_on "New Stat"

    fill_in "Device", with: @stat.device_id
    fill_in "Disk free", with: @stat.disk_free
    fill_in "Disk total", with: @stat.disk_total
    fill_in "Hostname", with: @stat.hostname
    fill_in "Kernel", with: @stat.kernel
    fill_in "Memory free", with: @stat.memory_free
    fill_in "Memory total", with: @stat.memory_total
    fill_in "Uptime", with: @stat.uptime
    click_on "Create Stat"

    assert_text "Stat was successfully created"
    click_on "Back"
  end

  test "updating a Stat" do
    visit stats_url
    click_on "Edit", match: :first

    fill_in "Device", with: @stat.device_id
    fill_in "Disk free", with: @stat.disk_free
    fill_in "Disk total", with: @stat.disk_total
    fill_in "Hostname", with: @stat.hostname
    fill_in "Kernel", with: @stat.kernel
    fill_in "Memory free", with: @stat.memory_free
    fill_in "Memory total", with: @stat.memory_total
    fill_in "Uptime", with: @stat.uptime
    click_on "Update Stat"

    assert_text "Stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Stat" do
    visit stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stat was successfully destroyed"
  end
end
