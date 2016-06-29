define [
	"base"
], (App) ->

	App.factory "event_tracking", ->
		return {
			send: (category, action, label, value)->
				ga('send', 'event', category, action, label, value)
				event_name = "#{action}-#{category}"
				window?.heap?.track?(event_name, {label, value})
		}


	App.directive "track", () ->
		return {
			restrict: "A"
			scope: false,
			link: (scope, el, attrs) ->
				evName  = attrs.track
				evValue = attrs.trackValue

				if (evName)
					el.on 'click', () ->
						console.log evName, evValue
		}

	#header
	$('.navbar a').on "click", (e)->
		href = $(e.target).attr("href")
		if href?
			ga('send', 'event', 'navigation', 'top menu bar', href)
