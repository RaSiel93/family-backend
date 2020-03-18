output_path = "/media/rasiel/SONY_16M1/#{Time.now.strftime("%Y-%m-%d")}"

timer = Time.now

`mkdir -p #{output_path}`
`cp -r dragonfly #{output_path}`

puts("Finished for #{(Time.now - timer).round} seconds.")
