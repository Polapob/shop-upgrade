// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "trix";
import "@rails/actiontext";
import $ from "jquery";
require("imports-loader?define=>false!datatables.net")(window, $);
require("imports-loader?define=>false!datatables.net-select")(window, $);

// Load datatables styles
import "datatables.net-dt/css/jquery.dataTables.css";
import "datatables.net-select-dt/css/select.dataTables.css";
