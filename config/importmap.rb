# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'emoji-picker-element', to: 'https://ga.jspm.io/npm:emoji-picker-element@1.21.0/index.js'
# pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
# pin "stimulus-character-counter", to: "https://ga.jspm.io/npm:stimulus-character-counter@4.2.0/dist/stimulus-character-counter.mjs"
pin '@rails/actioncable', to: 'actioncable.esm.js'
pin_all_from 'app/javascript/channels', under: 'channels'
