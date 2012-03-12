    require 'rubygems'
	require 'mechanize'
	require 'hpricot'
	require 'open-uri'	
	require 'dbi'
	
	@@title = ""
	
=begin	
	#class Scrap
	
	#def recipe
     puts "######################################################################"
	
    page=@obj.get('http://simplyrecipes.com/tag/Artichoke')
	@@intro = page.content
	doc1=Hpricot(@@intro)
	 (doc1/"div.archive-entry-title/a").each do |j|	
     j.attributes['href']
	 link_open_one = open(j.attributes['href'])
		 doc1=Hpricot(link_open_one)
	     puts doc1 
		 end	
	

   end
	
end
=end

	
	

	@obj=Mechanize.new
    page=@obj.get('http://simplyrecipes.com/subject-index.php')
	
	    @@title = page.content
		doc=Hpricot(@@title)
		#obj=Scrap.new
		#recipe = (doc/"div.center-module/p/a").innerHTML
		
		#var2 = (doc/"div./").innerHTML
		
		(doc/"div.center-module/p/a").each do |i|
			#puts i.attributes['href']
			link_open = open(i.attributes['href'])
			doc=Hpricot(link_open)
			puts doc
			
		puts "######################################################################"
	
		#page=@obj.get('http://simplyrecipes.com/tag/Artichoke')
		@@title = page.content
		doc1=Hpricot(@@title)
		(doc1/"div.archive-entry-title/a").each do |j|	
		     puts j.attributes['href']
		link_open_one = open(j.attributes['href'])
		 doc1=Hpricot(link_open_one)
	     puts doc1 
		 end	
			
			
			#page=@obj.get('')
			#@@title = page.content
			#doc=Hpricot(@@title)
			#puts doc
		end

		#puts (doc/"div.center-module/p/a").class
		#links = doc.search("a")
		#links = doc.search("a").select { |ele| ele.inner_text }
		
		#puts doc.methods
		
=begin		
		desc1 = (doc/"div#recipe-intro/p").innerHTML
		desc2 = (doc/"div#recipe-intro/blockquote").innerHTML
		ingredients = (doc/"li.ingredient").innerHTML
		method = (doc/"div#recipe-method/p").innerHTML
		yields = (doc/"span.yield").innerHTML
=end		
=begin		
	begin
		# connect to the MySQL server
		dbh = DBI.connect("DBI:Mysql:training:localhost", "root", "webonise6186")
		sth = dbh.prepare( "insert into scrap(Desc1,Desc2,Ingredients,Method,Yield) values (?,?,?,?,?)" )
		sth.execute(desc1,desc2,ingredients,method,yields)
		dbh.commit
		puts "Record has been created"
		rescue DBI::DatabaseError => e
		puts "An error occurred"
		puts "Error code:#{e.err}"
		puts "Error message: #{e.errstr}"
		dbh.rollback
		ensure
		# disconnect from server
		dbh.disconnect if dbh
	end	
=end	


