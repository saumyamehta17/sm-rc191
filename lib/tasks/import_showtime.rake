require 'mechanize'
desc "import movies"
task movie_name: :environment do
  agent = Mechanize.new
  agent.get('http://www.google.co.in/movies?hl=en&near=New+Delhi,+Delhi&dq=movies&sort=1&q=movies&sa=X&ei=nhbAUpb5K8yrlQWEjoCYAw&sqi=2&ved=0CCkQxQMoAA')


  #If need to login to any site
  #agent.page
  #agent.page.forms
  #form.username = 'smehta1289@gmail.com'
  #form.password = 'mehtasweety8'
  #form.submit
  Movie.delete_all
  agent.page.search("h2 a").map(&:text).each do |movie_name|
      Movie.create(name: movie_name)
  end

end

desc "import showtimes for movie"
task show_time: :environment do
  agent = Mechanize.new
  ShowTime.delete_all
  Movie.all.each do |movie_name|
        #I place it here as after click agent will change and unbable to find link from previous agent
        agent.get('http://www.google.co.in/movies?hl=en&near=New+Delhi,+Delhi&dq=movies&sort=1&q=movies&sa=X&ei=nhbAUpb5K8yrlQWEjoCYAw&sqi=2&ved=0CCkQxQMoAA')
        #now link will change after click
        show_time = agent.page.link_with(text: movie_name.name)
        show_time.click.search(".show_left a").map(&:text).reject {|x| x.empty?}.each do |show_name|
          movie_name.show_times.create(content: show_name)
        end
  end
end