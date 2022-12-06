/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Versions : Codable {
	let generationi : GenerationI?
	let generationii : GenerationII?
	let generationiii : GenerationIII?
	let generationiv : GenerationIV?
	let generationv : GenerationV?
	let generationvi : GenerationVI?
	let generationvii : GenerationVII?
	let generationviii : GenerationVIII?

	enum CodingKeys: String, CodingKey {

		case generationi = "generation-i"
		case generationii = "generation-ii"
		case generationiii = "generation-iii"
		case generationiv = "generation-iv"
		case generationv = "generation-v"
		case generationvi = "generation-vi"
		case generationvii = "generation-vii"
		case generationviii = "generation-viii"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		generationi = try values.decodeIfPresent(GenerationI.self, forKey: .generationi)
		generationii = try values.decodeIfPresent(GenerationII.self, forKey: .generationii)
		generationiii = try values.decodeIfPresent(GenerationIII.self, forKey: .generationiii)
		generationiv = try values.decodeIfPresent(GenerationIV.self, forKey: .generationiv)
		generationv = try values.decodeIfPresent(GenerationV.self, forKey: .generationv)
		generationvi = try values.decodeIfPresent(GenerationVI.self, forKey: .generationvi)
		generationvii = try values.decodeIfPresent(GenerationVII.self, forKey: .generationvii)
		generationviii = try values.decodeIfPresent(GenerationVIII.self, forKey: .generationviii)
	}

}
