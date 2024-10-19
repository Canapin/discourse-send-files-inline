# frozen_string_literal: true

# name: discourse-send-files-inline
# about: serve some files inline
# version: 0.1
# authors: Coin-coin le Canapin
# url: https://github.com/Canapin/discourse-send-files-inline

module SendMediaInline
  module UploadsControllerExtension
    def send_file(path, options={})
      if options.key?(:content_type) && (options[:content_type] == "application/pdf" || options[:content_type].start_with?("video/"))
        options[:disposition] = :inline
      end
      super(path, options)
    end
  end
end

after_initialize do
  ::UploadsController.prepend SendMediaInline::UploadsControllerExtension
end
