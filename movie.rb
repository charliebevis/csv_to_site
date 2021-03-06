class Movie
	attr_accessor :title, :director, :summary, :img, :main_link
	attr_accessor :showtime
	attr_accessor :country
	attr_accessor :voice
	attr_accessor :voice_link
	attr_accessor :location

	attr_accessor :filmmaker_attending
	attr_accessor :special_guest_attending
	attr_accessor :short_link
	attr_accessor :short_title
	attr_accessor :type

	def initialize(parameters)
		@parse_failures = []

		@title = access_field(parameters,:title)
		@director = access_field(parameters,:director)
		@country = access_field(parameters,:country)
		@voice = access_field(parameters,:voice)
		@voice_link = access_field(parameters,:voice_link)
		@location = access_field(parameters,:location)
		@summary = access_field(parameters,:summary)
		@showtime = access_field(parameters,:showtime)
		@img = access_field(parameters,:img)
		@main_link = access_field(parameters,:main_link)
		@type = access_field(parameters,:type)

		@filmmaker_attending = !access_field(parameters,:filmmaker_attending).nil?
		@special_guest_attending = !access_field(parameters,:special_guest_attending).nil?
		@short_title = access_field(parameters,:short_title)
		@short_link = access_field(parameters,:short_link)

		unless @parse_failures.empty?
			puts "film row with title #{@title} did not parse fields #{@parse_failures}"
		end
	end

	private
	def access_field(fields, symbol)
		field = fields[symbol.to_s]
			if ( field )
				field.strip
			else
				@parse_failures << symbol.to_s
				nil
			end
	end
end
