resource "azurerm_automation_account" "auto" {
  name                = "dev-automation-account"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Basic"
}

# Friday 8:00 PM Stop Schedule
resource "azurerm_automation_schedule" "friday_stop" {
  name                    = "friday-8pm-stop"
  resource_group_name     = azurerm_resource_group.rg.name
  automation_account_name = azurerm_automation_account.auto.name
  frequency               = "Week"
  interval                = 1
  timezone                = "America/New_York"
  start_time              = "2026-07-03T20:00:00Z"
  week_days               = ["Friday"]
}

# Monday 10:00 AM Start Schedule
resource "azurerm_automation_schedule" "monday_start" {
  name                    = "monday-10am-start"
  resource_group_name     = azurerm_resource_group.rg.name
  automation_account_name = azurerm_automation_account.auto.name
  frequency               = "Week"
  interval                = 1
  timezone                = "America/New_York"
  start_time              = "2026-07-06T10:00:00Z"
  week_days               = ["Monday"]
}
