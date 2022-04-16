import os
import vweb

pub struct App {
	vweb.Context
}

fn main() {
	vweb.run(&App{}, 81)
}

pub fn (mut app App) index() vweb.Result {
	return $vweb.html()
}

pub fn (mut app App) api() vweb.Result {
	host 		= app.query['host']
	port 		= app.query['port']
	time 		= app.query['time']
	method 		= app.query['method']

	if host == "" || port == "" || time == "" || method == "" {
		app.text("[x] Error, Fill all GET parameters to continue!")
	}

	// Sanitized and Validate all inputs

		

	return $vweb.html()
}