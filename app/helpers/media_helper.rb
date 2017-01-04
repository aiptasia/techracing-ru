module MediaHelper

  def original_medium_path(medium)
    Rails.root.join('app', '_images', "#{medium.file_name}.jpg")
  end

  def preview_medium_path(medium)
    Rails.root.join('app', 'assets', 'images', 'media', "#{medium.file_name}_p.jpg")
  end

  def preview_medium_asset_path(medium)
    "media/#{medium.file_name}_p.jpg"
  end

  def gallery_medium_path(medium)
    Rails.root.join('app', 'assets', 'images', 'media', "#{medium.file_name}.jpg")
  end

  def gallery_medium_asset_path(medium)
    "media/#{medium.file_name}.jpg"
  end

  def download_medium_path(medium)
    Rails.root.join('app', 'assets', 'images', 'media', 'download', "#{medium.file_name}.jpg")
  end

  def save_medium( medium, file_io )
    medium.file_name = "%06x" % medium.id
    medium.save

    File.open(original_medium_path(medium), 'wb') do |file|
      file.write(file_io.read)
    end

    generate_medium_assets medium
    generate_created_at medium
  end

  def generate_medium_assets(medium)
    puts 'generate_medium_assets: ' << medium.file_name
    fork do
      img = Magick::Image.read(original_medium_path medium).first

      download_img = img.crop_resized(1920, 1080)
      download_img.write(download_medium_path medium)
      download_img.destroy!

      gallery_img = img.crop_resized(1366, 768)
      gallery_img.strip!
      gallery_img.write(gallery_medium_path medium) { self.interlace = Magick::PlaneInterlace }

      # { self.quality = 80 }
      gallery_img.destroy!

      preview_img = img.crop_resized(192*2, 108*2)
      preview_img.strip!
      preview_img.write(preview_medium_path medium) { self.interlace = Magick::PlaneInterlace }
      # { self.quality = 90 }
      preview_img.destroy!

      img.destroy!
    end
    Process.wait
  end

  def generate_created_at(medium)
    #fork do
    #  img = Magick::Image.read(original_medium_path medium).first
    #  medium.created_at = DateTime.strptime(img.properties['exif:DateTime'], '%Y:%m:%d %H:%M:%S')
    #  medium.save
    #end
    #Process.wait
  end

  def delete_medium_assets(medium)
    assets = []
    assets.push(original_medium_path medium)
    assets.push(preview_medium_path medium)
    assets.push(gallery_medium_path medium)
    assets.push(download_medium_path medium)

    assets.each do |asset_path|
      File.delete(asset_path) if File.exist? asset_path
    end
  end

end
