/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationIV : Codable {
	let diamondpearl : DiamondPearl?
	let heartgoldsoulsilver : HeartgoldSoulsilver?
	let platinum : Platinum?

	enum CodingKeys: String, CodingKey {

		case diamondpearl = "diamond-pearl"
		case heartgoldsoulsilver = "heartgold-soulsilver"
		case platinum = "platinum"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		diamondpearl = try values.decodeIfPresent(DiamondPearl.self, forKey: .diamondpearl)
		heartgoldsoulsilver = try values.decodeIfPresent(HeartgoldSoulsilver.self, forKey: .heartgoldsoulsilver)
		platinum = try values.decodeIfPresent(Platinum.self, forKey: .platinum)
	}

}
