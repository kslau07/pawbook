# Pin npm packages by running ./bin/importmap

# NOTE: We were double loading controllers, here and in application.js
# pin "application", preload: true
# pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
# pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
# pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# pin_all_from "app/javascript/controllers", under: "controllers"
pin "emoji-picker-element", to: "https://ga.jspm.io/npm:emoji-picker-element@1.20.1/index.js", preload: true
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
