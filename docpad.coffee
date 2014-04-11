# The DocPad Configuration File
# http://docpad.org/docs/config
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
	
	#env: "production"
	
	# Change the port DocPad uses from the default 9778 to 8080
	port: 8080
	
	environments:
		production:
			maxAge: 86400000
	

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://nylnook.com"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.nylnook.com'
			]

			# The default title of our website
			title: "nylnook"

			# The website description (for SEO)
			description: """
				Free illustrations and creative wallpapers to share, adapt and reuse freely in the best quality !
				"""
			
			# The website baseline 
			baseline: """
				Free illustrations and creative wallpapers to share, adapt and reuse freely in the best quality !
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				wallpaper, wallpapers, HD, FHD, 4K, 8K, illustration, free, open source, creative commons, source, creative, share, adapt, reuse, quality
				"""
			# The website author
			author: "Camille Bissuel"
			
			#default Creative commons license for content
			defaultLicense:  "by-sa"

		# -----------------------------
		# Helper Functions
		
		getSiteUrl: ->
			@site.url

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} ❄ #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description
		
		# Get the prepared site/document description
		getPreparedBaseline: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@site.baseline

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')
		
		getLicense:->
			@document.license or @site.defaultLicense
			

		getStyles: ->
			(["/vendor/normalize.css", "/styles/styles.css"])
				

		getDeferedScripts: ->
			(["/vendor/log.js","/scripts/scripts.js"])


			
				
	# =================================
	# Collections
	collections:
		pages: ->
			@getCollection("html").findAllLive({isPage:true}, [{filename:1}])
		posts: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'blog'},[{date:-1}]).on "add", (model) ->
				model.setMetaDefaults({layout:"post-layout"})
		images: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'img'},[{date:-1}]).on "add", (model) ->
				model.setMetaDefaults({layout:"img-layout"})
			
	plugins:
		moment:
			formats: [
				{raw: 'date', format: 'MMMM Do YYYY', formatted: 'humanDate'}
				{raw: 'date', format: 'YYYY-MM-DD', formatted: 'computerDate'}
			]
			
		associatedfiles:
			# The paths for the associated files.
			associatedFilesPath: 'img'

			# Whether to use relative base paths for the document. This would
			# use associated-files/subfolder/myarticle/image.jpg instead of
			# associated-files/myarticle/image.jpg.
			useRelativeBase: false

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

}


# Export our DocPad Configuration
module.exports = docpadConfig
