/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct RedBlue : Codable {
	let back_default : String?
	let back_gray : String?
	let back_transparent : String?
	let front_default : String?
	let front_gray : String?
	let front_transparent : String?

	enum CodingKeys: String, CodingKey {

		case back_default = "back_default"
		case back_gray = "back_gray"
		case back_transparent = "back_transparent"
		case front_default = "front_default"
		case front_gray = "front_gray"
		case front_transparent = "front_transparent"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		back_default = try values.decodeIfPresent(String.self, forKey: .back_default)
		back_gray = try values.decodeIfPresent(String.self, forKey: .back_gray)
		back_transparent = try values.decodeIfPresent(String.self, forKey: .back_transparent)
		front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
		front_gray = try values.decodeIfPresent(String.self, forKey: .front_gray)
		front_transparent = try values.decodeIfPresent(String.self, forKey: .front_transparent)
	}

}
