import React from 'react';

const DrawingAppColors = () => {
  const palettes = [
    {
      name: "Artist's Cream",
      description: "Warm, inviting cream tones perfect for creativity",
      colors: [
        { name: "Vanilla Cream", hex: "#FBF8F3", rgb: "251, 248, 243" },
        { name: "Warm Ivory", hex: "#F7F2E8", rgb: "247, 242, 232" },
        { name: "Soft Beige", hex: "#F0E6D2", rgb: "240, 230, 210" },
        { name: "Canvas Cream", hex: "#F5F0E8", rgb: "245, 240, 232" },
        { name: "Linen White", hex: "#FAF0E6", rgb: "250, 240, 230" }
      ]
    },
    {
      name: "Earth Studio",
      description: "Natural earth tones for grounded creativity",
      colors: [
        { name: "Clay Cream", hex: "#F4EDE4", rgb: "244, 237, 228" },
        { name: "Warm Sand", hex: "#E8D5B7", rgb: "232, 213, 183" },
        { name: "Soft Taupe", hex: "#D4C4A8", rgb: "212, 196, 168" },
        { name: "Mushroom", hex: "#C8B99C", rgb: "200, 185, 156" },
        { name: "Adobe", hex: "#B5A085", rgb: "181, 160, 133" }
      ]
    },
    {
      name: "Pastel Artist",
      description: "Soft pastels that inspire gentle creativity",
      colors: [
        { name: "Chalk White", hex: "#FEFDF9", rgb: "254, 253, 249" },
        { name: "Peach Cream", hex: "#FDF2E9", rgb: "253, 242, 233" },
        { name: "Blush Pink", hex: "#F5E6E0", rgb: "245, 230, 224" },
        { name: "Lavender Mist", hex: "#E8E2F0", rgb: "232, 226, 240" },
        { name: "Sage Whisper", hex: "#E5F0E3", rgb: "229, 240, 227" }
      ]
    },
    {
      name: "Vintage Paper",
      description: "Aged paper tones for classic artistic feel",
      colors: [
        { name: "Old Paper", hex: "#F8F4E6", rgb: "248, 244, 230" },
        { name: "Antique White", hex: "#F2E7D5", rgb: "242, 231, 213" },
        { name: "Sepia Cream", hex: "#E6D2B7", rgb: "230, 210, 183" },
        { name: "Tea Stain", hex: "#D4C4A0", rgb: "212, 196, 160" },
        { name: "Parchment", hex: "#F0E8D0", rgb: "240, 232, 208" }
      ]
    },
    {
      name: "Modern Neutral",
      description: "Contemporary neutral tones for clean interfaces",
      colors: [
        { name: "Pure Cream", hex: "#FFFEF7", rgb: "255, 254, 247" },
        { name: "Soft White", hex: "#F9F7F4", rgb: "249, 247, 244" },
        { name: "Light Beige", hex: "#F2F0ED", rgb: "242, 240, 237" },
        { name: "Warm Gray", hex: "#E8E6E3", rgb: "232, 230, 227" },
        { name: "Stone", hex: "#D1CFC8", rgb: "209, 207, 200" }
      ]
    }
  ];

  const ColorSwatch = ({ color }) => (
    <div className="flex items-center space-x-3 p-3 rounded-lg bg-white shadow-sm hover:shadow-md transition-shadow">
      <div 
        className="w-12 h-12 rounded-full shadow-inner border border-gray-200"
        style={{ backgroundColor: color.hex }}
      ></div>
      <div>
        <div className="font-medium text-gray-800">{color.name}</div>
        <div className="text-sm text-gray-500">{color.hex}</div>
        <div className="text-xs text-gray-400">rgb({color.rgb})</div>
      </div>
    </div>
  );

  return (
    <div className="max-w-6xl mx-auto p-6 bg-gradient-to-br from-gray-50 to-white min-h-screen">
      <div className="text-center mb-12">
        <h1 className="text-4xl font-bold text-gray-800 mb-4">Drawing App Color Palettes</h1>
        <p className="text-lg text-gray-600">Beautiful cream and neutral colors perfect for artistic apps</p>
      </div>

      <div className="grid gap-8">
        {palettes.map((palette, index) => (
          <div key={index} className="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div className="bg-gradient-to-r from-gray-100 to-gray-50 p-6 border-b">
              <h2 className="text-2xl font-bold text-gray-800 mb-2">{palette.name}</h2>
              <p className="text-gray-600">{palette.description}</p>
            </div>
            
            <div className="p-6">
              <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
                {palette.colors.map((color, colorIndex) => (
                  <ColorSwatch key={colorIndex} color={color} />
                ))}
              </div>
              
              {/* Color strip preview */}
              <div className="mt-6 rounded-lg overflow-hidden shadow-sm border">
                <div className="flex h-16">
                  {palette.colors.map((color, colorIndex) => (
                    <div 
                      key={colorIndex}
                      className="flex-1"
                      style={{ backgroundColor: color.hex }}
                    ></div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* SwiftUI Code Examples */}
      <div className="mt-12 bg-gray-900 rounded-2xl p-6 text-white">
        <h3 className="text-xl font-bold mb-4">SwiftUI Usage Examples</h3>
        <div className="bg-gray-800 rounded-lg p-4 text-sm font-mono">
          <div className="text-green-400">// Artist's Cream Palette</div>
          <div className="text-blue-300">extension Color {`{`}</div>
          <div className="ml-4 text-gray-300">static let vanillaCream = Color(red: 0.98, green: 0.97, blue: 0.95)</div>
          <div className="ml-4 text-gray-300">static let warmIvory = Color(red: 0.97, green: 0.95, blue: 0.91)</div>
          <div className="ml-4 text-gray-300">static let canvasCream = Color(red: 0.96, green: 0.94, blue: 0.91)</div>
          <div className="text-blue-300">{`}`}</div>
          <br />
          <div className="text-green-400">// Usage</div>
          <div className="text-gray-300">.background(Color.canvasCream)</div>
          <div className="text-gray-300">.foregroundStyle(.brown.opacity(0.8))</div>
        </div>
      </div>
    </div>
  );
};

export default DrawingAppColors;