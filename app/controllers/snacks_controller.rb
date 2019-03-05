class SnacksController < ApplicationController
  # GET /snacks
  # GET /snacks.json
  def index
  end

  # the endpoint
  def pdf_metadata
    # accepts the urls[] parameter
    # a comma delimited string
    # unwrapped into an array
    @urls = snack_params[:urls][0].split(',')
    # send the urls to docraptor
    @results = []
    @urls.each do |url|
      filename = "#{url.parameterize}.pdf"
      filepath = "#{Rails.root}/tmp/#{filename}"
      response = $docraptor.create_doc(
                 test: true,
         document_url: url,
                 name: filename,
        document_type: 'pdf'
      )
      # save to the filesystem
      File.open(filepath, 'wb') do |file|
        file.write(response)
      end
      puts "Docraptor file saved to: #{filepath}"
      # analyze with pdf-reader
      pdf_reader = PDF::Reader.new(filepath)
      metadata = {
                url: url,
        pdf_version: pdf_reader.pdf_version,
               info: pdf_reader.info,
           metadata: pdf_reader.metadata,
         page_count: pdf_reader.page_count
      }
      @results.push metadata
    end
  end

  private
    # parameters whitelist
    def snack_params
      params.permit(:format, :utf8, :commit, urls: [])
    end
  #/private
end
