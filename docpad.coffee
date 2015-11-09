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


		development:
			templateData:
				site:
					services:
						googleAnalytics: false

	templateData:

		# -----------------------------
		# Language Definition

		# List all available languages here
		# Must match with a corresponding directory in src/documents/
		languages: ['en', 'fr']

		# Define default language
		default_lang: 'en'

		# Define plural for each language. A list is available here : https://github.com/airbnb/polyglot.js/blob/master/lib/polyglot.js (don't forget to convert to coffeescript !)
		plural_types:
			en: (n) -> (if n isnt 1 then 1 else 0)
			fr: (n) -> (if n > 1 then 1 else 0)

		# Translation file location
		# Depending on your translation system, you may want to change that
		# remember this path start from the docpad directory
		translation_files:
			en: 'src/documents/en/en.json'
			fr: 'src/documents/fr/fr.json'

		# Translations will be loaded into this object. Required.
		translations: {}


		# -----------------------------
		# Non translated definitions (untranslated names, urls ..)
		site:
			# The production url of our website
			url: "http://nylnook.com"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.nylnook.com'
			]

			# The default title of our website
			title: "nylnook"

			# Description for RSS feeds
			description: "Camille Bissuel ❄ Free (as in Freedom) Comics & Illustrations"

			# The website author
			author: "Camille Bissuel"

			#default Creative commons license for content
			default_license:  "by-sa"

			services:
				hackerNewsSubmitButton: false

				#flattrButton: '2878350/nylnook'
				githubFollowButton: 'nylnook'
				githubStarButton: 'nylnook/nylnook-website'

				googleAnalytics: 'UA-50089163-1'
				disqus: 'nylnook'


		# -----------------------------
		# Helper Functions

		# -----------------------------
		# Internationalization functions

		# Translate the given key into the language of the current document.
		# Fallback to default language if the key if not found or fallback again to unstranslated string.
		# You can use simple variables: @_ 'The answer is', num: 42
		_: (key, translations_with_parameters=null) ->
			translations_with_parameters ?= []
			if @translations[@document.lang][key]?
				message = @translations[@document.lang][key]
			else if @translations[@default_lang][key]?
				message = @translations[@default_lang][key]
			else
				message = key
			message.replace /\{([^\}]+)\}/g, (translation, param) ->
				translations_with_parameters[param] or translation

		# Plural form for translations
		# Fallback to default language if the key if not found or fallback again to unstranslated string.
		# Simple example : @plural(3, 'dog|dogs')
		# Example in context : @_ '{num} {posts}', num: documents.length, posts: @plural(documents.length, 'post|posts')
		plural: (n, key) ->
			if @translations[@document.lang][key]?
				return ((@_ key).split '|')[@plural_types[@document.lang](n)]
			else if @translations[@default_lang][key]?
				return ((@_ key).split '|')[@plural_types[@default_lang](n)]
			else
				return ((@_ key).split '|').slice(0,1)

		# Returns a human readable formatted date. Require Moment.js
		# Example : @date()
		# Example with parameters : @date(post.date, post.lang)
		date: (date, lang) ->
			if not date
				date = @document.date
			if not lang
				lang = @document.lang
			moment = require 'moment'
			moment.locale(lang)
			return moment(date).format('LL');

		# Returns a computer readable formatted date. Require Moment.js
		# Example : @computerDate()
		# Example with parameters : @computerDate(post.date)
		# Example in HTML5: <time pubdate="<%- @computerDate() %>"><%- @date() %></time>
		computerDate: (date) ->
			if not date
				date = @document.date
			moment = require 'moment'
			return moment(date).format('YYYY-MM-DD');


		# -----------------------------
		# Generic functions

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

		# Get the prepared site/document description. Require previous i18n functions
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @_ 'site-description'


		# Same for keywords. Require previous i18n functions
		getPreparedKeywords: ->
			@document.keywords or @_ 'keywords'

		getLicense:->
			@document.license or @document.tag or @site.default_license

		getSoftware:->
			@document.made or @document.tag


		getStyles: ->
			(["/styles/styles.css"])



	# =================================
	# Collections
	collections:
		# This is internationalized, and only to build automatic template data !!!
		# If you try to use it in your files, you will obtain all results in every language
		# In your templates, use for example @getCollection("html").findAllLive({relativeOutDirPath: @document.lang+'/blog'},[{date:-1}]) instead of thoses collections

		# This collection is absolutely required to make internationalization work !
		# this wil add a "lang" metadata correponding to the same directory to each file in documents
		setlangforalldocuments: (database) ->
			lang_dirs = ('/'+lang+'/' for lang in @config.templateData.languages)
			lang_regex = ('^'+lang_dir for lang_dir in lang_dirs).join('|')

			@getCollection('documents').createChildCollection()
				.setFilter 'search', (model) ->
					return false if not model.get('url')

					lang_match = model.get('url').match(lang_regex)
					return false if not lang_match

					lang = lang_match[0].replace(/^\/|\/$/g, '')
					model.setMetaDefaults { lang: lang }
					true

		# Build template data for posts (only relative path and metadata change)
		posts: (database) ->
			lang_dirs = ('/'+lang+'/blog' for lang in @config.templateData.languages)
			lang_regex = ('^'+lang_dir for lang_dir in lang_dirs).join('|')

			@getCollection('documents').createChildCollection()
				.setFilter 'search', (model) ->
					return false if not model.get('url')

					lang_match = model.get('url').match(lang_regex)
					return false if not lang_match

					lang = lang_match[0].replace(/^\/|\/$/g, '')
					model.setMetaDefaults { layout:"post-layout"}
					true

		# Build template data for images (only relative path and metadata change)
		images: (database) ->
			lang_dirs = ('/'+lang+'/img' for lang in @config.templateData.languages)
			lang_regex = ('^'+lang_dir for lang_dir in lang_dirs).join('|')

			@getCollection('documents').createChildCollection()
				.setFilter 'search', (model) ->
					return false if not model.get('url')

					lang_match = model.get('url').match(lang_regex)
					return false if not lang_match

					lang = lang_match[0].replace(/^\/|\/$/g, '')
					model.setMetaDefaults { layout:"img-layout" }
					true

		# Collections for RSS feeds, next/previous links and pagging
		all: ->
			@getCollection("html").findAllLive(
						$or: [
							{relativeOutDirPath:'en/img'},
							{relativeOutDirPath:'en/blog'},
							{relativeOutDirPath:'en/comics'},
							{relativeOutDirPath:'fr/img'},
							{relativeOutDirPath:'fr/blog'},
							{relativeOutDirPath:'fr/bd'}
						],
						[date:-1]
						)

		all_en: ->
			@getCollection("html").findAllLive(
						$or: [
							{relativeOutDirPath:'en/img'},
							{relativeOutDirPath:'en/blog'},
							{relativeOutDirPath:'en/comics'}
						],
						[date:-1]
						)

		all_fr: ->
			@getCollection("html").findAllLive(
						$or: [
							{relativeOutDirPath:'fr/img'},
							{relativeOutDirPath:'fr/blog'},
							{relativeOutDirPath:'fr/bd'}
						],
						[date:-1]
						)

		img_en: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'en/img'},[{date:-1}])

		img_fr: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'fr/img'},[{date:-1}])

		blog_en: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'en/blog'},[{date:-1}])

		blog_fr: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'fr/blog'},[{date:-1}])

		comics_en: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'en/comics'},[{date:-1}])

		comics_fr: ->
			@getCollection("html").findAllLive({relativeOutDirPath:'fr/bd'},[{date:-1}])




	# =================================
	# Docpad Plugins
	plugins:

		ghpages:
			deployRemote: 'target'
			deployBranch: 'master'

		sitemap:
			cachetime: 600000
			changefreq: 'weekly'
			priority: 0.5

		rss:
			default:
				collection: 'all'
				title: 'Multilingual RSS feed'
				url: '/rss.xml'
			all_en:
				collection: 'all_en'
				title: 'Every News'
				url: '/en-rss.xml'
			all_fr:
				collection: 'all_fr'
				title: 'Toutes les actualités'
				url: '/fr-rss.xml'
			img_en:
				collection: 'img_en'
				title: 'Wallpapers'
				url: '/wallpaper-en-rss.xml'
			img_fr:
				collection: 'img_fr'
				title: "Les fonds d'écran"
				url: '/wallpaper-fr-rss.xml'
			blog_en:
				collection: 'blog_en'
				title: 'The Blog'
				url: '/blog-en-rss.xml'
			blog_fr:
				collection: 'blog_fr'
				title: 'Le Blog'
				url: '/blog-fr-rss.xml'
			comics_en:
				collection: 'comics_en'
				title: 'The Comics'
				url: '/comics-en-rss.xml'
			comics_fr:
				collection: 'comics_fr'
				title: 'Les BDs'
				url: '/comics-fr-rss.xml'


	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# We add this event to load the translations from locale JSON files
		renderBefore: (opts, next) ->
			fs = require 'fs'

			for lang of opts.templateData.translation_files
				langJSON = fs.readFileSync opts.templateData.translation_files[lang]
				try
					opts.templateData.translations[lang] = JSON.parse(langJSON)
				catch error
					console.log "\n\nERROR: Language JSON fail: #{lang}: #{error}\n"
					throw error

			next()


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


			# We add this event to redirect visitor reaching root domain to their prefered language
			# at the corresponding subdomain.
			# We use the "Accept-Language" header for that. Require the "negociator" npm package
			# If negociator fail to find any solution, default language is used

			# /!\ This will not work if the server is static !
			# If static, use an index.html file with client side javascript detection to replace this.
			# Example script in /src/documents/404.hml.eco
			###
			server.use (req,res,next) ->
				if req.path == "/"
					Negotiator = require('negotiator')
					negotiator = new Negotiator(req)
					available_languages = latestConfig.templateData.languages
					if (!!negotiator.language(available_languages))
						#console.log('redirect to /' + negotiator.language(availableLanguages))
						res.redirect(negotiator.language(available_languages))
					else
						#console.log('redirect to default language')
						res.redirect(latestConfig.templateData.default_lang)
				else
					next()
			###

}


# Export our DocPad Configuration
module.exports = docpadConfig
