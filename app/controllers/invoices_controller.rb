require 'csv'

class InvoicesController < ApplicationController
  def index
  end

  def upload
    csv = CSV.read(params[:attachment].tempfile, col_sep: "\t", headers: :first_row)
    hash = csv.map(&:to_h)
    hash = hash.map { |h| h.transform_keys! {|key| key.gsub(/\ /, '_') } }
    hash.each do |h|
      purchaser = Purchaser.find_or_create_by(name: h['purchaser_name'])
    end
    debugger
    render json: hash.to_json
  end
end
