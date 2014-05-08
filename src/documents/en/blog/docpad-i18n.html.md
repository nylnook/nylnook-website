---
title: 'Docpad Internationalized ?'
date: 2014-04-07 17:00
---

In my way building this website, one the major technical point to solve was internationalization and multilingual support. I want to publish in English and French, and maybe more languages when times comes.   
But for now (v6.64), [Docpad](http://docpad.org/), the publishing system I choosed for this website, [do not have any official localization abilities](https://github.com/bevry/docpad/issues/17).  
So here is a full description the solution I finally implemented today (took much more time than expected !).  

####TL; DR;
No, sorry, I'm afraid there is no shortways.

####Table of content
- [Thanks first](#thanks-first)
- [How I like it to be](#how-i-like-it-to-be)
- [The solution I ended up with](#the-solution)
	- [Structure](#structure)
	- [Declaration](#declaration)
	- [Generate language specific Metadatas with collections](#generate-metadata)
	- [Translation strings, and translation files in JSON Format](#translation-strings-and-files)
		- [The translations functions](#translations-functions)
		- [Tell Docpad where are our translation files](#where-are-translation-files)
	- [Localize Dates](#localize-dates)
	- [Path and urls](#path-urls)
		- [Navigation and menus](#navigation-menus)
		- [Collections of associated files](#associated-files)
		- [Language switcher](#language-switcher)
	- [Language redirection for visitors](#language-redirection)
		- [Server side](#server-side-redirection)
		- [Client side](#client-side-redirection)
		- [Client side storage of prefered language](#client-side-storage)
		- [The 404 case](#404)
	- [Limits](#limits)
- [Abstracting ?](#abstracting)


### <a name="thanks-first"></a>Thanks first
I'm a designer, not a real coder, and my solution is heavily inspired by 3 already existing projets.   
Without their code available, I wouldn't have acheived this work: many thanks for being open !

In chronological order :
- Zeno Rocha's [Browser Diet](https://github.com/zenorocha/browser-diet) website
- Adam Pritchard's [Psiphon Circumvention System](https://bitbucket.org/psiphon/psiphon-circumvention-system/src/tip/Website/?at=default) website
- Artem Sapegin's [Blog](http://blog.sapegin.me/all/multilingual-docpad)

I must also thanks [Benjamin Lupton](https://github.com/balupton) for his work on Docpad, the needed infrastructure work, and the initial idea behind this solution.
	
### <a name="how-i-like-it-to-be"></a>How I like it to be
As you may have noticed, I host many, many images, they will grow, and I can't aford to duplicate them, a major flaw IMHO in two of the previous mentionned already exiting solutions.   
So no duplication, or a minimum : duplicate only text, which you can't avoid in a translation !   

My requierments were :
1. Minimal disk usage
2. KISS
3. translations strings available for templating (like ```@_ 'translate-me' ```) with plural support
4. localize dates
5. Transparent visitor redirection, server side prefered
6. SEO friendly (urls and titles in the correct language)
7. do not mess too much with Docpad behavior, and let important plugins do their usual job (Clean URLs, tagging, partials...). 
8. generate every language in one go, with a simple ```docpad run``` (no parameters like ```--lang-en```)
9. Allow for translation services like [Transifex](https://www.transifex.com/) to be used partially or fully. So JSON format for translation files. Artem Sapegin's solution use YAMLjs instead.

## <a name="the-solution"></a>The solution I ended up with
I spend many days messing around with this code, and it's not perfect. But it mostly do what I want so far.
As already mentioned in the footer of this website, my code is available on [Github](https://github.com/nylnook/nylnook-website), and it's commented if you want to test an implementation or dig into it.   

### <a name="structure"></a>Structure
First of all, a structure. I tried to keep it as simple and near to an untranslated Docpad project as possible.

My solution work by setting up language specific directories inside the ```documents``` folder, which automatically force Docpad in using language specific subdirectories.  
This mean visitors will always see the subdirectories in your URLS, like ```example.com/en/``` or ```example.com/fr/```. Yes, even for your base language (often english).  
If you don't want subdirectories, this is not for you. You may try [Artem Sapegin's solution](http://blog.sapegin.me/all/multilingual-docpad) if you want to publish into subdomains or differents domains, or try to adapt my solution to your context with some Express.js server-side redirection.

So, your project structure must look like this one :
- docpad-project
	- src
		- documents
			- en
				- blog
				- other-category
			- fr
				- blog
				- other-category
			- any-language
				- blog
				- other-category
			- scripts
			- styles
		- files
		- layouts
	- out

With one document subdirectory for each language, even the base one. You can place a document directly in ```documents``` root, but it must not call translation functions, and it won't be translated.

If you want to keep things simple, a limit is that if you want to get collections of documents into sub-subdirectories like ```blog``` from your layouts, thoses sub-subdirectories must have the same name in every language . Not really a problem in my case, because ```blog``` and ``img`` can be untranslated. One way to have a workaround may be to use metadatas instead of sub-subdirectories for your categories (```cat: 'My category'```), and another is to use the navigation menu trick I will explain later.

Note that the ```file``` directory remain untouched. That's on purpose, to avoid duplication of files and blobs especially.

Additionnaly, you can create a ```lang``` or ```locale``` directory somewhere, to put your translation files into it. In my case I choosed not to have one more subdirectory, and I put my translation file directly in the corresponding folder, for example ```documents/en/en.json``` and ```documents/fr/fr.json```

Right now, you can start translating files into each subdirectory, and it will work. But that's limited because Docpad still have no idea of what we do.

### <a name="declaration"></a>Declaration
Second step is to tell Docpad what we expect from it to do on this front.

So, open ```docpad.coffee``` or your docpad configuration file and start to declare :

``` coffeescript
templateData:
	
		# -----------------------------
		# Language Definition
		
		# List all available languages here
		# Must match with a corresponding directory in src/documents/ 
		languages: ['en', 'fr']
		
		# Define default language
		default_lang: 'en'
		
		# Define plural for each language. A list is available here :
		# https://github.com/airbnb/polyglot.js/blob/master/lib/polyglot.js
		# (don't forget to convert to coffeescript !)
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
```

and you can continue with your classical template datas :

``` coffeescript
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

			# The website author
			author: "Camille Bissuel"
```

Ok, we have done some declaration, but so what ? Next, use them.

### <a name="generate-metadata"></a>Generate language specific Metadatas with collections
Next step is to automatically build language metadatas for every document in every language. That's sound crazy, but this is the only reliable method to be able to easily know what is the current language in any document. With this, a simple ```@document.lang``` (with eco templating) will give us the current language.

Thanks again to Adam Pritchard, this is almost a copy-and-paste from his work :
``` coffeescript
	# =================================
	# Collections
	collections:
		# This is internationalized, and only to build automatic template data !!!
		# If you try to use it in your files, you will obtain all results in every language
		# In your templates, use for example 
		# @getCollection("html").findAllLive({relativeOutDirPath: @document.lang+'/blog'},[{date:-1}])
		# instead of thoses collections
	
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
```
And you can continue with this technic to generate other metadatas, in this example a layout 
``` coffeescript
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
```
**This is the core of our solution**. This is absolutelly needed to make translation work.

But this mean you cannot use anymore in your templates nice calls like the one explained [in the Docpad Beginner guide](http://docpad.org/docs/begin#creating-custom-collections-via-the-configuration-file)  :

```
<% for posts in @getCollection("posts").toJSON(): %>
```
because this wil send you every post in every language.
But instead you will have to use less nice ones like (note the ```relativeOutDirPath: @document.lang+'/blog'``` parameter) : 

```
<% for posts in @getCollection("html").findAllLive({relativeOutDirPath: @document.lang+'/blog'},[{date:-1}]).toJSON(): %>
```
That's ok, but I don't know what it does on the preformance side. For now, I didn't noticed any difference.

### <a name="translation-strings-and-files"></a>Translation strings, and translation files in JSON Format

In our templates at least, we want to be able to translate any sentence in the correct language. We will do that by replacing text with a call to a translation function.

So HTML 
```
<p>I want to translate this sentence</p>
```
will become (with Eco)
```
<p><%- @_ 'I want to translate this sentence' %></p>
```
or shortly
```
<p><%- @_ 'sentence_key' %></p>
```

You can add variables into it
``` 
<p><%- @_ 'The answer is', num: 42 %></p>
```

And even use the plural
```
<p><%- @_ 'posts-number', num: documents.length, posts: @plural(documents.length, 'post|posts') %></p>
```

The translation is send to JSON, so characters you must escape with a ```\``` are the ```\``` itself and ```"```   

But until now there is no corresponding translation file to our calls, and our sentences will not be translated (they will appear as they are). So we must create the files we declared before.

In my case ```documents/en/en.json``` 


``` json
{
	"sentence_key" : "I want to translate this sentence",
	"The answer is": "The answer is {num}",
	"post|posts" : "post|posts",
	"posts-number" : "{num} {posts}"
	
}
```

and ```documents/fr/fr.json```

``` json
{
	"sentence_key" : "Je veux traduire cette phrase",
	"The answer is": "La réponse est {num}",
	"post|posts" : "article|articles",
	"posts-number" : "{num} {posts}"
	
}
```

#### <a name="translations-functions"></a>The translations functions

but as is Docpad will send you errors if we don't add the translations functions in ```docpad.coffee``` templateData
``` coffeescript
	templateData:
		# ...
		
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
		
		# ...
```

#### <a name="where-are-translation-files"></a>Tell Docpad where are our translation files

That's not enough... Docpad need to load our translation files before starting to render documents !   
So we add a dedicated event :
``` coffeescript
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
```
Remember we have declared their relative urls in the ```templateData``` part earlier.

> And the magic can happen... translated strings !


### <a name="localize-dates"></a>Localize Dates

Next step is to localize dates. We will need the essential [Moment.js](http://momentjs.com/) library to manage that with beauty.  

So, let's install it :
``` bash
npm install --save moment
```

And let's add 2 more functions in our ```docpad.coffee templateData``` :
``` coffeescript
	templateData:
		# ...
		
		# Returns a human readable formatted date. Require Moment.js
		# Example : @date()
		# Example with parameters : @date(post.date, post.lang)
		date: (date, lang) ->
			if not date
				date = @document.date
			if not lang
				lang = @document.lang
			moment = require 'moment'
			moment.lang(lang)
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
			
		# ...
```

in our templates, we will just put 

```
<time pubdate="<%- @computerDate() %>"><%- @date() %></time>
```

To get a localized date. Please adjust the ```format``` as mentioned on [Moment.js website](http://momentjs.com/) to suit your needs.

To use dates in a call for a collections, we will just add parameters 
```
<% for post in @getCollection("html").findAllLive({relativeOutDirPath: @document.lang+'/blog'},[{date:-1}]).toJSON(): %>
	<article class="post">
	   <h2><a href="<%= post.url %>"><%- post.title %></a></h2>
	   <time pubdate="<%- @computerDate(post.date) %>"><%- @date(post.date, post.lang) %></time>
	       <%- post.contentRenderedWithoutLayouts %>
	</article>
<% end %>
```
> Ok for dates, thank you Moment.js !

### <a name="path-urls"></a>Path and urls

Additionally, you may want to create link to your images, or to any file.  
Good news is that's quite easy : just use relative urls, and do not forget to go one parent directory earlier in your paths.

If your document path is for example ```/en/blog/this-post.html```
the path to your file will be at
``` bash
../../img/mypicture.jpg
```

If you absolutely need to parse url, here are 2 relatively useless functions for reference, but I finally removed them in my case, they were unused, and bad for performances.

``` coffeescript
	templateData:
		# ...
		# Allow to obtain current language from URL if @document.lang isn't available
		# Using @document.lang is prefered for performance
		langFromPath: (document) ->
			if not document
				document = @document
			return document.relativeDirPath.split('/').slice(0,1)
			
		# Get a path without current language. Maybe useful in templates to get a file path
		# Example : <%= @pathWithoutLang(post) %>
		pathWithoutLang: (document) ->
			if not document
				document = @document
			return document.relativeOutDirPath.split('/').slice(1)
```
#### <a name="navigation-menus"></a>Navigation and menus

The tricky part is when you want to link to a corresponding document in another language. For example, you have a navigation menu refering to 
``` xml
documents/en/about.html
```
in english
 
and to 
``` xml
documents/fr/a-propos.html
```
in french.  

We may use the same filename in every language, and just change the lang path :
``` xml
documents/<% @document.lang %>/about.html
```
But remember we want to be SEO friendly, so path name should be similar to titles names in the corresponding language.

The simplest solution I found is to add additional "key":"value" in our translations files.

in en.json
``` json
{
	"about": "About",
	"about-filename": "about"
}

in fr.json
``` json
{
	"about": "About",
	"about-filename": "a-propos"
}
```

So the link in our template become :
```
<a href="/<%- @document.lang %>/<%= @_ 'about-filename' %>"><%= @_ 'about' %></a>
```

If your navigation is quite short (6 entries in my case), which is a good idea anyway, this is ok.
But you will have to find another solution if you have a lot. See [Adam Pritchard's solution](https://bitbucket.org/psiphon/psiphon-circumvention-system/src/tip/Website/?at=default) maybe.

#### <a name="associated-files"></a>Collections of associated files
As a side note to path management, the [associatedfiles Docpad plugin](https://github.com/docpad/docpad-plugin-associatedfiles) will not work anymore with this internationalization solution.

Replace it simply with this kind of templating (```@getFilesAtPath``` is a Docpad function) :
```
<% for file in @getFilesAtPath('../../img/gallery').toJSON(): %>
	
<% end %>
```

#### <a name="language-switcher"></a>Language switcher
That's not the strongest part of my code, but in my case I wanted it very simple, so here it is, in a template :
```
<nav id="language-selector">
	<a href="#" class="current-lang"><%- @document.lang %></a>
	<% for lang in @languages : %>
		<% if lang isnt @document.lang : %>
			<a href="/<%- lang %>" ><%- lang %></a>
		<% end %>
	<% end %>
</nav>
```
And no functions at all.

Yes, that mean there is no way for a visitor to switch from a blog post in a language to the same blog post in another language. A visitor will always have to go back to home page...

But are you constantly switching language when you visit a website ?   
I simply suppose the behavior is :
1. land on the website in a language (correctly detected from visitor browser preferences if possible)
2. switch language if it doesn't suit
3. visit and never change the language again

So I don't need complex functions and a lot of metadatas everywhere just to handle a marginal case.

And if a correspondance is absolutely needed somewhere, use the menu trick mentionned before.


### <a name="language-redirection"></a>Language redirection for visitors
#### <a name="server-side-redirection"></a>Server side

So, we want visitors to land in the best language according to their preference.   
If possible, we want to do that server side to avoid the"no-script" user case.  

Good news once again, if we have a dynamic server, it's possible ! Furthermore, it's my case.  
The main idea is to use the ```req.headers["accept-language"] ``` Express.js function to detect our vistor HTTP header.

To have a robust and simple code, we will use the [Negociator library](https://github.com/federomero/negotiator).

Installation :
``` bash
npm install --save negociator
```

and in the event section of ```docpad.coffee``` we will add a second part to the classic ```serverExtend``` event :

``` coffeescript
	events:
		
		#...


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
```

So, if a visitor hit the root domain, he is redirected to the best language we can find for him, or to the default one.


#### <a name="client-side-redirection"></a>Client side 

If you can't do server-side redirection because your server is static or you render static files, client side redirection is required.
Create an ```index.html`` file at the ```documents``` root, with this script (by Adam Pritchard) :

``` javascript
<script>
	var defaultLanguage, supportedLanguages, language, redirectLanguage;

	defaultLanguage = 'en';
	supportedLanguages = <%- JSON.stringify @languages %>;
	redirectLanguage = defaultLanguage;

	try {
		language = window.navigator.userLanguage || window.navigator.language || defaultLanguage;

	// Some languages we support look like 'en' and some like 'en-US'. Some languages
	// set in navigator.language look like 'en' and some like 'en-US'. So we'll
	// check both combinations.

		if (supportedLanguages.indexOf(language) >= 0) {
			redirectLanguage = language;
		}
		else if (supportedLanguages.indexOf(language.substr(0, 2)) >= 0) {
			redirectLanguage = language.substr(0, 2);
		}
	}
	catch (e) {
	// Really old Internet Explorer seems to throw an exception on the above code.
	// We'll just catch and pass.
	}

	// Redirect to a language-specific index page
	window.location.href = '/' + redirectLanguage + '/index.html';
</script>
```

and a fallback link to default language for the "no script" visitor. Remember that you can't add any translation function in this file, this will result in an 'undefined' error.

#### <a name="client-side-storage"></a>Client side storage of prefered language
Not done yet... Plan to use the  [lawnchair](http://brian.io/lawnchair/plugins/) library.

#### <a name="404"></a>The 404 case
If a visitor go to a missing url, what happen ? How to redirect him to a page in his language ?

We can't rely on the urls he will use, nor on any metadata. So we are back again with language redirection, server side or client side.
Unfortunatelly, a [Docpad bug](https://github.com/bevry/docpad/issues/779) prevent us to do any server side 404 redirection, because setting ```middleware404: false``` in ```docpad.coffee``` results in a long node.js Type error.

So we use a client side redirection :
put a 404.html file at the ```documents``` root with this script :
``` javascript
<script>
	var defaultLanguage, supportedLanguages, language, redirectLanguage;

	defaultLanguage = 'en';
	supportedLanguages = <%- JSON.stringify @languages %>;
	redirectLanguage = defaultLanguage;

	try {
		language = window.navigator.userLanguage || window.navigator.language || defaultLanguage;

	// Some languages we support look like 'en' and some like 'en-US'. Some languages
	// set in navigator.language look like 'en' and some like 'en-US'. So we'll
	// check both combinations.

		if (supportedLanguages.indexOf(language) >= 0) {
			redirectLanguage = language;
		}
		else if (supportedLanguages.indexOf(language.substr(0, 2)) >= 0) {
			redirectLanguage = language.substr(0, 2);
		}
	}
	catch (e) {
	// Really old Internet Explorer seems to throw an exception on the above code.
	// We'll just catch and pass.
	}

	// Redirect to a language-specific index page
	window.location.href = '/' + redirectLanguage + '/404.html';
</script>
```
and a fallback link to default language for the "no script" visitor. Remember that you can't add any translation function in this file, this will result in an 'undefined' error.

Plus create a translated 404 files in each document language : they can be translated  
So the visitor will see the error in the detected language : arguably it's better than "english only".

Working examples :
- [documents/404.html](https://github.com/nylnook/nylnook-website/blob/master/src/documents/404.html.eco)
- [documents/en/404.html](https://github.com/nylnook/nylnook-website/blob/master/src/documents/en/404.html.md)
- [documents/fr/404.html](https://github.com/nylnook/nylnook-website/blob/master/src/documents/fr/404.html.md)


### <a name="limits"></a>Limits
The main one : this a subdirectory only solution.

Additionally to the 404 bug, two Docpad plugins at least break with this internationalization solution : [associatedfiles](https://github.com/docpad/docpad-plugin-associatedfiles) and [docpad-plugin-moment](https://github.com/brockfanning/docpad-plugin-moment).

And I didn't test right-to-left or non-latin languages yet. So this code probably miss some declarations and functions to make them work. Adam Pritchard's [Psiphon Circumvention System](https://bitbucket.org/psiphon/psiphon-circumvention-system/src/tip/Website/?at=default) website contain some, if you want to dig into that.

## <a name="abstracting"></a>Abstracting ?

With some abstration to manage the subdomain and other domains cases, all this may go into a Docpad plugin to simplify installation... But I'm afraid I'm not the good guy for that... Remember : I'm a designer, not really a coder !

Let's dream : some bits of this code may even be part of Docpad one day. No modesty here ;p

