class ProcessData
	def self.convert(file)
		debugger
		csv = CSV.read(file.tempfile, col_sep: "\t", headers: :first_row)
		data = csv.map(&:to_h)
		data.map { |h| h.transform_keys! {|key| key.gsub(/\ /, '_') } }
	end
end
