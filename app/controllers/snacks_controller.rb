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
    urls = snack_params[:urls][0].split(',')
    # a tasty snack
    snack = Snack.create
    # for docraptor
    notebook = []
    urls.each do |url|
      # parameterize the url for the filename
      # makes it easier to chew
      filename = "#{url.parameterize}-#{Time.now.to_i}.pdf"
      # here you go
      filepath = "#{Rails.root}/tmp/#{filename}"
      # oh look she laid an egg
      egg = $docraptor.create_doc(
                 test: true,
         document_url: url,
                 name: filename,
        document_type: 'pdf'
      )
      # save it to the filesystem
      File.open(filepath, 'wb') do |io|
        io.write(egg)
      end
      # save it to the cloud
      snack.documents.attach(
        io: File.open(filepath),
        filename: filename,
        content_type: 'application/pdf'
      )
      # analyze it with pdf-reader
      pdf_reader = PDF::Reader.new(filepath)
      # record our analysis
      findings = {
                url: url,
        pdf_version: pdf_reader.pdf_version,
               info: pdf_reader.info,
           metadata: pdf_reader.metadata,
         page_count: pdf_reader.page_count
      }
      # publish our findings
      notebook.push findings
    end
    # sort results per specification
    @results = notebook.sort_by do |document|
      document[:url]
    end.group_by do |document|
      document[:page_count]
    end
  end

  private
    # parameters whitelist
    def snack_params
      params.permit(:format, :utf8, :commit, urls: [])
    end
  #/private
end
