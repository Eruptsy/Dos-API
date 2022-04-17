module core

import os

pub fn get_all_methods() map[string]string {
	mut methods = os.ls(os.getwd() + "/assets/methods/") or { [''] }
}