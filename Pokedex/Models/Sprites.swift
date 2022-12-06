/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Sprites : Codable {
	let back_default : String?
	let back_female : String?
	let back_shiny : String?
	let back_shiny_female : String?
	let front_default : String?
	let front_female : String?
	let front_shiny : String?
	let front_shiny_female : String?
	let other : Other?
	let versions : Versions?

	enum CodingKeys: String, CodingKey {

		case back_default = "back_default"
		case back_female = "back_female"
		case back_shiny = "back_shiny"
		case back_shiny_female = "back_shiny_female"
		case front_default = "front_default"
		case front_female = "front_female"
		case front_shiny = "front_shiny"
		case front_shiny_female = "front_shiny_female"
		case other = "other"
		case versions = "versions"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		back_default = try values.decodeIfPresent(String.self, forKey: .back_default)
		back_female = try values.decodeIfPresent(String.self, forKey: .back_female)
		back_shiny = try values.decodeIfPresent(String.self, forKey: .back_shiny)
		back_shiny_female = try values.decodeIfPresent(String.self, forKey: .back_shiny_female)
		front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
		front_female = try values.decodeIfPresent(String.self, forKey: .front_female)
		front_shiny = try values.decodeIfPresent(String.self, forKey: .front_shiny)
		front_shiny_female = try values.decodeIfPresent(String.self, forKey: .front_shiny_female)
		other = try values.decodeIfPresent(Other.self, forKey: .other)
		versions = try values.decodeIfPresent(Versions.self, forKey: .versions)
	}

}