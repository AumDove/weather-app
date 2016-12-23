require 'barometer'

puts "Enter your location."
place = gets.chomp

barometer = Barometer.new(place)
weather = barometer.measure

puts "Today's Weather for: "+ place.upcase + "\n"
puts "Current temperature: " + weather.current.temperature.f + " degrees F" + "\n"
puts "Conditions: " + weather.current.condition + "\n"

tomorrow = Time.now.strftime('%d').to_i + 1

weather.forecast.each do |forecast|
    day = forecast.starts_at.day

    if day == tomorrow
        dayName = "TOMORROW"
    else
        dayName = forecast.starts_at.strftime('%A').upcase
    end

    puts dayName + ' is going to be ' + forecast.icon + ' with lows around ' + forecast.low.f.to_s + ' and highs around ' + forecast.high.f.to_s + "\n"
    puts "\n"
end
