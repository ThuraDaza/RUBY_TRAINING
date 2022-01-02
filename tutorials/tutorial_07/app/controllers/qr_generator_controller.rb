class QrGeneratorController < ApplicationController

  def show_qr
    # generate qr code
    qrcode = RQRCode::QRCode.new(params[:content])
    
    # change qr code format to png
    @png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300
    )
  end

end
