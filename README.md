Railscast sm-rc191
==================
Mechanize
```
As nokogiri is used to extract from single page , Mechanize will help to scrap from multiple pages of site also where sign page is present.
```
Clone
```
git clone 'https://github.com/sweetymehta/sm-rc191.git'
```
Run it
```
rake -T
rake movie_name
rake show_time
```
Scaffolding
```
for Movie and ShowTime
#todo
see import_showtime.rake under lib/tasks
```
Check any private site like movis site for movie and its sshow time
```
You can see whether it is private ornot
curl https://workflowy.com/#/910eff0c-b867-4e26-9549-14d3effc9379
```
gem file
```
gem 'mechanize'
```
rails console
```
rails c
require 'mechanize'
agent = Mechanize.new

Lets try it
```
agent.get('http://www.google.co.in/movies?hl=en&near=New+Delhi,+Delhi&dq=movies&sort=1&q=movies&sa=X&ei=nhbAUpb5K8yrlQWEjoCYAw&sqi=2&ved=0CCkQxQMoAA')

it will  return page object and form object
agent.page.forms

agent.page.links
agent.page.forms.first
agent.page.forms.first.username = ''
agent.page.forms.first.password = ''
agent.page.link.first.text
agent.page.link_with(text: 'Dhoom3')
By using selectorGadget..
agent.page.search(".show_left")


TO copy some commands from terminal
```
 puts Readline::HISTORY.entries.split("exit").last[0..-5].join("\n")
```

