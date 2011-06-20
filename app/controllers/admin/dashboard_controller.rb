class Admin::DashboardController < AdminController

  # The main property of a dashboard controller is that it
  # has the advantage of no sidebar by default.

  hide_sidebar!

end